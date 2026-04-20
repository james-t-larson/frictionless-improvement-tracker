import 'package:sqflite/sqflite.dart';
import '../models/workout_log.dart';
import '../models/variation.dart';

class WorkoutRepository {
  final Database _db;

  WorkoutRepository(this._db);

  Future<List<WorkoutLog>> getAllLogs() async {
    final List<Map<String, dynamic>> maps = await _db.rawQuery('''
      SELECT w.*, m.name as movement_name 
      FROM workouts w
      JOIN movements m ON w.movement_id = m.id
      ORDER BY w.timestamp DESC
    ''');

    List<WorkoutLog> logs = [];
    for (var map in maps) {
      final List<Map<String, dynamic>> varMaps = await _db.rawQuery('''
        SELECT v.* 
        FROM variations v
        JOIN workout_variations wv ON v.id = wv.variation_id
        WHERE wv.workout_id = ?
      ''', [map['id']]);

      List<Variation> variations = varMaps.map((v) => Variation.fromMap(v)).toList();
      logs.add(WorkoutLog.fromMap(map, variations: variations));
    }
    return logs;
  }

  Future<void> saveWorkoutLog(WorkoutLog log) async {
    await _db.transaction((txn) async {
      final workoutId = await txn.insert('workouts', log.toMap());
      
      for (var variation in log.variations) {
        if (variation.id != null) {
          await txn.insert('workout_variations', {
            'workout_id': workoutId,
            'variation_id': variation.id,
          });
        }
      }
    });
  }

  Future<WorkoutLog?> getLastPerformance(int movementId) async {
    final List<Map<String, dynamic>> maps = await _db.query(
      'workouts',
      where: 'movement_id = ?',
      whereArgs: [movementId],
      orderBy: 'timestamp DESC',
      limit: 1,
    );
    if (maps.isNotEmpty) {
      final map = maps.first;
      final List<Map<String, dynamic>> varMaps = await _db.rawQuery('''
        SELECT v.* 
        FROM variations v
        JOIN workout_variations wv ON v.id = wv.variation_id
        WHERE wv.workout_id = ?
      ''', [map['id']]);
      List<Variation> variations = varMaps.map((v) => Variation.fromMap(v)).toList();
      return WorkoutLog.fromMap(map, variations: variations);
    }
    return null;
  }
}
