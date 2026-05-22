import 'dart:convert';
import 'package:sqflite/sqflite.dart';
import '../models/workout_log.dart';

class WorkoutRepository {
  final Database _db;

  WorkoutRepository(this._db);

  Future<List<WorkoutLog>> getAllLogs() async {
    final List<Map<String, dynamic>> resultMaps = await _db.rawQuery('''
      SELECT l.id, l.data as log_data, m.data as mov_data
      FROM logs l
      JOIN movements m ON json_extract(l.data, '\$.movementId') = m.id
      ORDER BY json_extract(l.data, '\$.timestamp') DESC
    ''');

    return resultMaps.map((map) {
      final logMap = jsonDecode(map['log_data'] as String);
      final movMap = jsonDecode(map['mov_data'] as String);
      
      final List<dynamic>? muscleGroups = movMap['muscleGroups'];
      String? firstGroup;
      if (muscleGroups != null && muscleGroups.isNotEmpty) {
        firstGroup = muscleGroups.first.toString();
      }

      return WorkoutLog.fromJson(logMap, id: map['id'] as int).copyWith(
        movementName: movMap['name'] as String?,
        muscleGroupName: firstGroup,
      );
    }).toList();
  }

  Future<void> saveWorkoutLog(WorkoutLog log) async {
    await _db.insert('logs', log.toMap());
  }

  Future<WorkoutLog?> getLastPerformance(String movementId) async {
    final List<Map<String, dynamic>> maps = await _db.rawQuery('''
      SELECT * FROM logs 
      WHERE json_extract(data, '\$.movementId') = ?
      ORDER BY json_extract(data, '\$.timestamp') DESC
      LIMIT 1
    ''', [movementId]);

    if (maps.isNotEmpty) {
      return WorkoutLog.fromMap(maps.first);
    }
    return null;
  }

  /// Returns all distinct muscle groups from workouts logged today.
  Future<Set<String>> getTodaysMuscleGroupIds() async {
    final now = DateTime.now();
    final midnightMs = DateTime(now.year, now.month, now.day)
        .millisecondsSinceEpoch;

    final rows = await _db.rawQuery('''
      SELECT json_extract(m.data, '\$.muscleGroups') as groups
      FROM logs l
      JOIN movements m ON json_extract(l.data, '\$.movementId') = m.id
      WHERE json_extract(l.data, '\$.timestamp') >= ?
    ''', [midnightMs]);

    final Set<String> todaysGroups = {};
    for (var row in rows) {
      final groupsStr = row['groups'] as String?;
      if (groupsStr != null) {
        final List<dynamic> parsed = jsonDecode(groupsStr);
        todaysGroups.addAll(parsed.map((e) => e.toString()));
      }
    }
    return todaysGroups;
  }

  Future<void> deleteWorkoutLog(int id) async {
    await _db.delete(
      'logs',
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  Future<void> updateWorkoutLog(WorkoutLog log) async {
    if (log.id == null) return;
    await _db.update(
      'logs',
      log.toMap(),
      where: 'id = ?',
      whereArgs: [log.id],
    );
  }
}
