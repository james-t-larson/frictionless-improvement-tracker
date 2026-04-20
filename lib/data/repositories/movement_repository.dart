import 'package:sqflite/sqflite.dart';
import 'package:uuid/uuid.dart';
import '../models/movement.dart';
import '../sources/remote_source.dart';

class MovementRepository {
  final Database _db;
  final RemoteSource _remoteSource;
  final _uuid = const Uuid();

  MovementRepository(this._db, this._remoteSource);

  Future<void> seedMovementsIfEmpty() async {
    final count = Sqflite.firstIntValue(
      await _db.rawQuery('SELECT COUNT(*) FROM movements'),
    );

    if (count == 0) {
      final movements = await _remoteSource.fetchExercises();
      final batch = _db.batch();
      for (var movement in movements) {
        batch.insert('movements', movement.toMap());
      }
      await batch.commit(noResult: true);
    }
  }

  Future<List<Movement>> searchMovements(String query) async {
    final List<Map<String, dynamic>> maps = await _db.query(
      'movements',
      where: 'name LIKE ?',
      whereArgs: ['%$query%'],
      limit: 20,
    );
    return maps.map((map) => Movement.fromMap(map)).toList();
  }

  Future<List<Movement>> getTopMovements() async {
    final List<Map<String, dynamic>> maps = await _db.rawQuery('''
      SELECT m.*, COUNT(w.id) as usage_count
      FROM movements m
      LEFT JOIN workouts w ON m.id = w.movement_id
      GROUP BY m.id
      ORDER BY usage_count DESC, m.name ASC
      LIMIT 10
    ''');
    return maps.map((map) => Movement.fromMap(map)).toList();
  }

  Future<Movement> createMovement(String name) async {
    final movement = Movement(
      id: _uuid.v4(),
      name: name,
    );
    await _db.insert('movements', movement.toMap());
    return movement;
  }
}
