import 'dart:convert';
import 'package:sqflite/sqflite.dart';
import '../models/movement.dart';
import '../models/workout_log.dart';
import '../../core/utils/muscle_display_names.dart';
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
      final movement = Movement.fromJson(jsonDecode(map['mov_data'] as String));

      final log = WorkoutLog.fromJson(logMap, id: map['id'] as int);
      // A named variation match (e.g. Deadlift + romanian) replaces the base
      // movement name, so history reads "Romanian Deadlift".
      final displayName = movement.resolveNamedVariation(log.variations)?.name ?? movement.name;

      return log.copyWith(
        movementName: displayName,
        muscleGroupName: movement.muscleGroups.isNotEmpty ? movement.muscleGroups.first : null,
      );
    }).toList();
  }

  Future<void> saveWorkoutLog(WorkoutLog log) async {
    await _db.insert('logs', log.toMap());
  }

  /// Returns the most recent log for [movementId]. When [variations] is
  /// given, prefers the most recent log that used that exact combination of
  /// variations (e.g. "Deadlift" + romanian shouldn't autofill with a plain
  /// Deadlift's weight), falling back to the movement's overall most recent
  /// log if no exact match exists.
  Future<WorkoutLog?> getLastPerformance(String movementId, {List<String>? variations}) async {
    final List<Map<String, dynamic>> maps = await _db.rawQuery('''
      SELECT * FROM logs
      WHERE json_extract(data, '\$.movementId') = ?
      ORDER BY json_extract(data, '\$.timestamp') DESC
    ''', [movementId]);

    if (maps.isEmpty) return null;

    final logs = maps.map((m) => WorkoutLog.fromMap(m)).toList();

    if (variations != null) {
      final target = Set<String>.from(variations);
      for (final log in logs) {
        final logVariations = Set<String>.from(log.variations);
        if (logVariations.length == target.length && logVariations.containsAll(target)) {
          return log;
        }
      }
    }

    return logs.first;
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

  /// Returns the number of sets logged in the last 7 days (a rolling window,
  /// not the calendar week), grouped by each movement's primary muscle group
  /// (the first entry in its muscleGroups list).
  Future<Map<String, int>> getSetCountsByPrimaryMuscleGroupLast7Days() async {
    final cutoffMs = DateTime.now()
        .subtract(const Duration(days: 7))
        .millisecondsSinceEpoch;

    final rows = await _db.rawQuery('''
      SELECT json_extract(m.data, '\$.muscleGroups') as groups
      FROM logs l
      JOIN movements m ON json_extract(l.data, '\$.movementId') = m.id
      WHERE json_extract(l.data, '\$.timestamp') >= ?
    ''', [cutoffMs]);

    final Map<String, int> counts = {};
    for (var row in rows) {
      final groupsStr = row['groups'] as String?;
      if (groupsStr == null) continue;
      final List<dynamic> parsed = jsonDecode(groupsStr);
      if (parsed.isEmpty) continue;
      final primary = parsed.first.toString();
      counts[primary] = (counts[primary] ?? 0) + 1;
    }
    return counts;
  }

  /// Returns the number of sets logged in the last 7 days (a rolling window,
  /// not the calendar week), grouped by each movement's primary muscle group
  /// (the first entry in its muscleGroups list) and then by individual
  /// primary muscle within that group (e.g. "Front Delts", "Rear Delts"
  /// under "Shoulders"). A set can count toward multiple muscles when the
  /// movement lists more than one primary muscle.
  Future<Map<String, Map<String, int>>> getSetCountsByMuscleLast7Days() async {
    final cutoffMs = DateTime.now()
        .subtract(const Duration(days: 7))
        .millisecondsSinceEpoch;

    final rows = await _db.rawQuery('''
      SELECT json_extract(m.data, '\$.muscleGroups') as groups,
             json_extract(m.data, '\$.primaryMuscles') as muscles
      FROM logs l
      JOIN movements m ON json_extract(l.data, '\$.movementId') = m.id
      WHERE json_extract(l.data, '\$.timestamp') >= ?
    ''', [cutoffMs]);

    final Map<String, Map<String, int>> counts = {};
    for (var row in rows) {
      final groupsStr = row['groups'] as String?;
      final musclesStr = row['muscles'] as String?;
      if (groupsStr == null || musclesStr == null) continue;

      final List<dynamic> groups = jsonDecode(groupsStr);
      final List<dynamic> muscles = jsonDecode(musclesStr);
      if (groups.isEmpty || muscles.isEmpty) continue;

      final primaryGroup = groups.first.toString();
      final groupCounts = counts.putIfAbsent(primaryGroup, () => {});
      for (final muscle in muscles) {
        final label = muscleDisplayName(muscle.toString());
        groupCounts[label] = (groupCounts[label] ?? 0) + 1;
      }
    }
    return counts;
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
