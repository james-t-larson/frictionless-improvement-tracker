import 'package:sqflite/sqflite.dart';
import '../models/workout_log.dart';

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
    return maps.map((map) => WorkoutLog.fromMap(map)).toList();
  }

  Future<void> saveWorkoutLog(WorkoutLog log) async {
    await _db.insert('workouts', log.toMap());
  }

  Future<WorkoutLog?> getLastPerformance(String movementId) async {
    final List<Map<String, dynamic>> maps = await _db.query(
      'workouts',
      where: 'movement_id = ?',
      whereArgs: [movementId],
      orderBy: 'timestamp DESC',
      limit: 1,
    );
    if (maps.isNotEmpty) {
      return WorkoutLog.fromMap(maps.first);
    }
    return null;
  }
}
