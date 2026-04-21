import 'package:sqflite/sqflite.dart';
import '../models/movement.dart';
import '../models/variation.dart';
import '../models/muscle_group.dart';
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
      Map<String, int> variationCache = {};
      Map<String, int> muscleCache = {};

      await _db.transaction((txn) async {
        for (var json in data) {
          final movement = Movement.fromJson(json);
          final movementId = await txn.insert('movements', movement.toMap());

          // Handle Variations
          List<String> variations = List<String>.from(json['variations'] ?? []).toSet().toList();
          for (var vName in variations) {
            int variationId;
            if (variationCache.containsKey(vName)) {
              variationId = variationCache[vName]!;
            } else {
              variationId = await txn.insert('variations', {'name': vName});
              variationCache[vName] = variationId;
            }
            await txn.insert('movement_variations', {
              'movement_id': movementId,
              'variation_id': variationId,
            });
          }

          // Handle Muscle Groups
          Future<void> linkMuscles(List<String> muscles, int isPrimary) async {
            final uniqueMuscles = muscles.toSet().toList();
            for (var mName in uniqueMuscles) {
              int muscleId;
              if (muscleCache.containsKey(mName)) {
                muscleId = muscleCache[mName]!;
              } else {
                muscleId = await txn.insert('muscle_groups', {'name': mName});
                muscleCache[mName] = muscleId;
              }
              await txn.insert('movement_muscles', {
                'movement_id': movementId,
                'muscle_id': muscleId,
                'is_primary': isPrimary,
              });
            }
          }

          await linkMuscles(movement.primaryMuscles, 1);
          await linkMuscles(movement.secondaryMuscles, 0);
        }
      });
    }
  }

  Future<List<Movement>> searchMovements(String query) async {
    final List<Map<String, dynamic>> maps = await _db.query(
      'movements',
      where: 'name LIKE ?',
      whereArgs: ['%$query%'],
      limit: 20,
    );
    
    List<Movement> movements = maps.map((map) => Movement.fromMap(map)).toList();
    for (var i = 0; i < movements.length; i++) {
        movements[i] = await _withMuscles(movements[i]);
    }
    return movements;
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
    
    List<Movement> movements = maps.map((map) => Movement.fromMap(map)).toList();
    for (var i = 0; i < movements.length; i++) {
        movements[i] = await _withMuscles(movements[i]);
    }
    return movements;
  }

  Future<Movement> _withMuscles(Movement movement) async {
    if (movement.id == null) return movement;

    final muscles = await _db.rawQuery('''
      SELECT mg.name, mm.is_primary
      FROM muscle_groups mg
      JOIN movement_muscles mm ON mg.id = mm.muscle_id
      WHERE mm.movement_id = ?
    ''', [movement.id]);

    final primary = muscles
        .where((m) => m['is_primary'] == 1)
        .map((m) => m['name'] as String)
        .toList();
    final secondary = muscles
        .where((m) => m['is_primary'] == 0)
        .map((m) => m['name'] as String)
        .toList();

    return Movement(
      id: movement.id,
      name: movement.name,
      primaryMuscles: primary,
      secondaryMuscles: secondary,
    );
  }

  Future<Movement> createMovement(String name) async {
    final movement = Movement(name: name);
    final id = await _db.insert('movements', movement.toMap());
    return Movement(id: id, name: name);
  }

  Future<Movement?> getMovementById(int id) async {
    final List<Map<String, dynamic>> maps = await _db.query(
      'movements',
      where: 'id = ?',
      whereArgs: [id],
      limit: 1,
    );
    if (maps.isEmpty) return null;
    return await _withMuscles(Movement.fromMap(maps.first));
  }

  Future<List<Variation>> getVariationsForMovement(int movementId) async {
    final List<Map<String, dynamic>> maps = await _db.rawQuery(
      '''
      SELECT v.* 
      FROM variations v
      JOIN movement_variations mv ON v.id = mv.variation_id
      WHERE mv.movement_id = ?
    ''',
      [movementId],
    );
    return maps.map((map) => Variation.fromMap(map)).toList();
  }

  Future<Variation> createVariationForMovement(int movementId, String name) async {
    // Check if variation exists globally
    final List<Map<String, dynamic>> results = await _db.query(
      'variations',
      where: 'LOWER(name) = ?',
      whereArgs: [name.toLowerCase()],
      limit: 1,
    );

    int variationId;
    if (results.isEmpty) {
      variationId = await _db.insert('variations', {'name': name});
    } else {
      variationId = results.first['id'] as int;
    }

    // Link it to the movement if not already linked
    final List<Map<String, dynamic>> linkResults = await _db.query(
      'movement_variations',
      where: 'movement_id = ? AND variation_id = ?',
      whereArgs: [movementId, variationId],
    );

    if (linkResults.isEmpty) {
      await _db.insert('movement_variations', {
        'movement_id': movementId,
        'variation_id': variationId,
      });
    }

    return Variation(id: variationId, name: name);
  }

  Future<List<MuscleGroup>> getMuscleGroups() async {
    final List<Map<String, dynamic>> maps = await _db.query('muscle_groups', orderBy: 'name ASC');
    return maps.map((map) => MuscleGroup.fromMap(map)).toList();
  }

  Future<List<Movement>> getMovementsByMuscleGroup(int muscleGroupId) async {
    final List<Map<String, dynamic>> maps = await _db.rawQuery('''
      SELECT m.*
      FROM movements m
      JOIN movement_muscles mm ON m.id = mm.movement_id
      WHERE mm.muscle_id = ?
      ORDER BY m.name ASC
    ''', [muscleGroupId]);
    
    List<Movement> movements = maps.map((map) => Movement.fromMap(map)).toList();
    for (var i = 0; i < movements.length; i++) {
        movements[i] = await _withMuscles(movements[i]);
    }
    return movements;
  }
}
