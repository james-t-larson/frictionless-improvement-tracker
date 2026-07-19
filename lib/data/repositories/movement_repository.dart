
import 'package:sqflite/sqflite.dart';
import '../models/movement.dart';
import '../models/movement_search_result.dart';
import '../models/workout_log.dart';
import '../sources/exercise_data_source.dart';
import '../sources/exercise_migrations.dart';

class MovementRepository {
  final Database _db;
  final ExerciseDataSource _dataSource;

  MovementRepository(this._db, this._dataSource);

  Future<void> syncMovements() async {
    final List<dynamic> data = await _dataSource.getExercises();

    await _db.transaction((txn) async {
      await _applyMigrations(txn);

      for (var json in data) {
        var movement = Movement.fromJson(json as Map<String, dynamic>);
        if (movement.id != null) {
          final existingMaps = await txn.query('movements', where: 'id = ?', whereArgs: [movement.id]);
          if (existingMaps.isNotEmpty) {
            final existingMovement = Movement.fromMap(existingMaps.first);
            final mergedVariations = Map<String, List<String>>.from(movement.variations);
            for (var entry in existingMovement.variations.entries) {
              if (!mergedVariations.containsKey(entry.key)) {
                mergedVariations[entry.key] = entry.value;
              }
            }
            movement = movement.copyWith(variations: mergedVariations);
          }
          await txn.insert('movements', movement.toMap(), conflictAlgorithm: ConflictAlgorithm.replace);
        }
      }
    });
  }

  /// Applies the migrations declared in exercise_migrations.dart to the
  /// user's stored movements and logs. Runs before every sync; idempotent.
  Future<void> _applyMigrations(Transaction txn) async {
    // Deleted bundled movements: move their logs to the replacement, then
    // drop the stale movement row so it no longer shows up in search.
    for (final entry in deprecatedMovements.entries) {
      final replacementPk = entry.value['replacementPk'] as String;
      final addVariations = List<String>.from(entry.value['addVariations'] ?? []);

      final logRows = await txn.query(
        'logs',
        where: "json_extract(data, '\$.movementId') = ?",
        whereArgs: [entry.key],
      );
      for (final row in logRows) {
        final log = WorkoutLog.fromMap(row);
        final variations = [
          ...log.variations,
          ...addVariations.where((v) => !log.variations.contains(v)),
        ];
        await txn.update(
          'logs',
          log.copyWith(movementId: replacementPk, variations: variations).toMap(),
          where: 'id = ?',
          whereArgs: [log.id],
        );
      }
      await txn.delete('movements', where: 'id = ?', whereArgs: [entry.key]);
    }

    // Renamed variation keys: fix stored movements and logs.
    for (final entry in renamedVariationKeys.entries) {
      await _transformStoredVariations(txn, entry.key, renames: entry.value);

      final logRows = await txn.query(
        'logs',
        where: "json_extract(data, '\$.movementId') = ?",
        whereArgs: [entry.key],
      );
      for (final row in logRows) {
        final log = WorkoutLog.fromMap(row);
        if (!log.variations.any(entry.value.containsKey)) continue;
        final variations = log.variations.map((v) => entry.value[v] ?? v).toSet().toList();
        await txn.update(
          'logs',
          log.copyWith(variations: variations).toMap(),
          where: 'id = ?',
          whereArgs: [log.id],
        );
      }
    }

    // Removed variation keys: drop from stored movements only. Logs keep the
    // key so old history still reads correctly.
    for (final entry in removedVariationKeys.entries) {
      await _transformStoredVariations(txn, entry.key, removals: entry.value);
    }
  }

  Future<void> _transformStoredVariations(
    Transaction txn,
    String movementId, {
    Map<String, String> renames = const {},
    List<String> removals = const [],
  }) async {
    final rows = await txn.query('movements', where: 'id = ?', whereArgs: [movementId]);
    if (rows.isEmpty) return;

    final movement = Movement.fromMap(rows.first);
    final hasWork = movement.variations.keys.any((k) => renames.containsKey(k) || removals.contains(k));
    if (!hasWork) return;

    final transformed = <String, List<String>>{};
    for (final e in movement.variations.entries) {
      if (removals.contains(e.key)) continue;
      final newKey = renames[e.key] ?? e.key;
      // If both old and new spellings exist (e.g. from an earlier merge),
      // the new one wins.
      if (renames.containsKey(e.key) && movement.variations.containsKey(newKey)) continue;
      transformed[newKey] = e.value
          .where((v) => !removals.contains(v))
          .map((v) => renames[v] ?? v)
          .toSet()
          .toList();
    }

    await txn.insert(
      'movements',
      movement.copyWith(variations: transformed).toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<List<Movement>> _getAllMovements() async {
    final List<Map<String, dynamic>> maps = await _db.query('movements');
    return maps.map((map) => Movement.fromMap(map)).toList();
  }

  Future<List<MovementSearchResult>> searchMovements(String query) async {
    final all = await _getAllMovements();
    final lowerQuery = query.toLowerCase();

    // Lower score = better match. Prefix matches rank above substring matches;
    // base movements rank above their named variations at equal quality.
    int? matchScore(String candidate) {
      final lower = candidate.toLowerCase();
      if (lower.startsWith(lowerQuery)) return 0;
      if (lower.contains(lowerQuery)) return 1;
      return null;
    }

    final scored = <(int, MovementSearchResult)>[];
    for (final m in all) {
      final nameScore = matchScore(m.name);
      if (nameScore != null) {
        scored.add((nameScore * 2, MovementSearchResult(m)));
      }
      for (final nv in m.namedVariations) {
        final scores = [nv.name, ...nv.aliases].map(matchScore).whereType<int>();
        if (scores.isNotEmpty) {
          final best = scores.reduce((a, b) => a < b ? a : b);
          scored.add((best * 2 + 1, MovementSearchResult(m, namedVariation: nv)));
        }
      }
    }

    scored.sort((a, b) {
      if (a.$1 != b.$1) return a.$1.compareTo(b.$1);
      return a.$2.displayName.compareTo(b.$2.displayName);
    });
    return scored.map((s) => s.$2).toList();
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

  Future<void> saveMovement(Movement movement) async {
    await _db.insert('movements', movement.toMap(), conflictAlgorithm: ConflictAlgorithm.replace);
  }
}
