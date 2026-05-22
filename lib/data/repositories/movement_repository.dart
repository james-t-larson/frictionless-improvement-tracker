
import 'package:sqflite/sqflite.dart';
import '../models/movement.dart';
import '../sources/exercise_data_source.dart';

class MovementRepository {
  final Database _db;
  final ExerciseDataSource _dataSource;

  MovementRepository(this._db, this._dataSource);

  Future<void> seedMovementsIfEmpty() async {
    final count = Sqflite.firstIntValue(
      await _db.rawQuery('SELECT COUNT(*) FROM movements'),
    );

    if (count == 0 || count == null) {
      final List<dynamic> data = await _dataSource.getExercises();

      await _db.transaction((txn) async {
        for (var json in data) {
          final movement = Movement.fromJson(json as Map<String, dynamic>);
          if (movement.id != null) {
            await txn.insert('movements', movement.toMap(), conflictAlgorithm: ConflictAlgorithm.replace);
          }
        }
      });
    }
  }

  Future<List<Movement>> _getAllMovements() async {
    final List<Map<String, dynamic>> maps = await _db.query('movements');
    return maps.map((map) => Movement.fromMap(map)).toList();
  }

  Future<List<Movement>> searchMovements(String query) async {
    final all = await _getAllMovements();
    final lowerQuery = query.toLowerCase();
    return all.where((m) => m.name.toLowerCase().contains(lowerQuery)).toList();
  }

  Future<List<Movement>> getTopMovements() async {
    final all = await _getAllMovements();
    final usageMaps = await _db.rawQuery('''
      SELECT json_extract(data, '\$.movementId') as mId, COUNT(id) as c
      FROM logs GROUP BY mId
    ''');
    final usage = {for (var row in usageMaps) row['mId'] as String: row['c'] as int};

    all.sort((a, b) {
      int aUsage = usage[a.id] ?? 0;
      int bUsage = usage[b.id] ?? 0;
      if (aUsage != bUsage) return bUsage.compareTo(aUsage);
      return a.name.compareTo(b.name);
    });
    return all;
  }

  Future<List<Movement>> getSuggestedMovements(Set<String> muscleGroups) async {
    if (muscleGroups.isEmpty) return getTopMovements();

    final all = await _getAllMovements();
    final usageMaps = await _db.rawQuery('''
      SELECT json_extract(data, '\$.movementId') as mId, COUNT(id) as c
      FROM logs GROUP BY mId
    ''');
    final usage = {for (var row in usageMaps) row['mId'] as String: row['c'] as int};

    all.sort((a, b) {
      bool aRelevant = a.muscleGroups.any((g) => muscleGroups.contains(g));
      bool bRelevant = b.muscleGroups.any((g) => muscleGroups.contains(g));
      if (aRelevant && !bRelevant) return -1;
      if (!aRelevant && bRelevant) return 1;
      
      int aUsage = usage[a.id] ?? 0;
      int bUsage = usage[b.id] ?? 0;
      if (aUsage != bUsage) return bUsage.compareTo(aUsage);
      
      return a.name.compareTo(b.name);
    });
    return all;
  }

  Future<Movement?> getMovementById(String id) async {
    final List<Map<String, dynamic>> maps = await _db.query(
      'movements',
      where: 'id = ?',
      whereArgs: [id],
      limit: 1,
    );
    if (maps.isEmpty) return null;
    return Movement.fromMap(maps.first);
  }

  Future<List<String>> getMuscleGroups() async {
    final all = await _getAllMovements();
    final Set<String> groups = {};
    for (var m in all) {
      groups.addAll(m.muscleGroups);
    }
    final sorted = groups.toList()..sort();
    return sorted;
  }

  Future<List<Movement>> getMovementsByMuscleGroupName(String groupName) async {
    final all = await _getAllMovements();
    final filtered = all.where((m) => m.muscleGroups.contains(groupName)).toList();
    filtered.sort((a, b) => a.name.compareTo(b.name));
    return filtered;
  }
}
