import 'dart:convert';
import 'package:sqflite/sqflite.dart';
import '../models/workout_log.dart';
import '../../core/utils/one_rep_max_calculator.dart';

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

  /// Fetches the best barbell workout logs for Bench Press, Squat, and Deadlift
  /// from the most recent session for each movement.
  Future<Map<String, WorkoutLog?>> getLatestBarbellBigThree() async {
    final Map<String, WorkoutLog?> results = {
      'Bench Press': null,
      'Squat': null,
      'Deadlift': null,
    };

    final Map<String, String> latestSessionDate = {};
    final Map<String, double> bestSession1RM = {};

    final List<Map<String, dynamic>> maps = await _db.rawQuery('''
      SELECT l.id, l.data as log_data, m.data as mov_data
      FROM logs l
      JOIN movements m ON json_extract(l.data, '\$.movementId') = m.id
      WHERE json_extract(m.data, '\$.name') IN ('Bench Press', 'Squat', 'Deadlift')
        AND (
          json_extract(l.data, '\$.variations') LIKE '%barbell%'
          OR json_extract(l.data, '\$.variations') LIKE '%"barbell"%'
        )
      ORDER BY json_extract(l.data, '\$.timestamp') DESC
    ''');

    for (var map in maps) {
      final logMap = jsonDecode(map['log_data'] as String);
      final movMap = jsonDecode(map['mov_data'] as String);
      final name = movMap['name'] as String;

      final timestamp = logMap['timestamp'] as int;
      final date = DateTime.fromMillisecondsSinceEpoch(timestamp);
      final dateStr = '${date.year}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}';
      
      final weight = (logMap['weight'] as num).toDouble();
      final reps = logMap['reps'] as int;
      final estimated1RM = OneRepMaxCalculator.calculate1RM(weight, reps);

      if (latestSessionDate[name] == null) {
        latestSessionDate[name] = dateStr;
        bestSession1RM[name] = estimated1RM;
        
        final List<dynamic>? muscleGroups = movMap['muscleGroups'];
        String? firstGroup;
        if (muscleGroups != null && muscleGroups.isNotEmpty) {
          firstGroup = muscleGroups.first.toString();
        }

        results[name] = WorkoutLog.fromJson(logMap, id: map['id'] as int).copyWith(
          movementName: name,
          muscleGroupName: firstGroup,
        );
      } else if (latestSessionDate[name] == dateStr) {
        if (estimated1RM > bestSession1RM[name]!) {
          bestSession1RM[name] = estimated1RM;
          
          final List<dynamic>? muscleGroups = movMap['muscleGroups'];
          String? firstGroup;
          if (muscleGroups != null && muscleGroups.isNotEmpty) {
            firstGroup = muscleGroups.first.toString();
          }

          results[name] = WorkoutLog.fromJson(logMap, id: map['id'] as int).copyWith(
            movementName: name,
            muscleGroupName: firstGroup,
          );
        }
      }
    }

    return results;
  }
}
