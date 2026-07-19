import 'package:flutter_test/flutter_test.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';
import 'package:simple_gym_tracker/core/database/database_helper.dart';
import 'package:simple_gym_tracker/data/models/movement.dart';
import 'package:simple_gym_tracker/data/models/named_variation.dart';
import 'package:simple_gym_tracker/data/models/workout_log.dart';
import 'package:simple_gym_tracker/data/repositories/movement_repository.dart';
import 'package:simple_gym_tracker/data/sources/exercise_data_source.dart';
import 'dart:convert';

void main() {
  sqfliteFfiInit();
  databaseFactory = databaseFactoryFfi;

  late Database db;
  late MovementRepository repository;
  late ExerciseDataSource dataSource;

  setUp(() async {
    db = await DatabaseHelper.initTestDb();
    
    dataSource = ExerciseDataSource();
    repository = MovementRepository(db, dataSource);
  });

  tearDown(() async {
    await db.close();
  });

  test('syncMovements should import all data from staticExerciseJson', () async {
    // Act
    await repository.syncMovements();

    // Assert
    final movements = await db.query('movements');
    
    // Convert data source elements to list to count unique PKs
    final decodedList = await dataSource.getExercises();
    final Set<String> uniquePks = {};
    for (var m in decodedList) {
      if (m['pk'] != null) {
        uniquePks.add(m['pk'] as String);
      }
    }
    
    expect(movements.length, uniquePks.length, reason: 'Number of movements should match unique PKs in JSON entries');

    // Verify a specific exercise: Pull-Up (the first one in JSON)
    final pullUp = movements.firstWhere((m) {
      final d = jsonDecode(m['data'] as String);
      return d['name'] == 'Pull-Up';
    });
    
    // Decode its JSON data
    final data = jsonDecode(pullUp['data'] as String);
    expect(data['name'], 'Pull-Up');

    final expectedVariations = ["bodyweight", "neutral-grip", "wide-grip", "close-grip"];
    final actualVariations = (data['variations'] as Map).keys.map((e) => e.toString()).toList();
    
    for (var v in expectedVariations) {
      expect(actualVariations, contains(v));
    }

    final primaryMuscles = (data['primaryMuscles'] as List).map((e) => e.toString()).toList();
    final secondaryMuscles = (data['secondaryMuscles'] as List).map((e) => e.toString()).toList();

    expect(primaryMuscles, contains('latissimus dorsi'));
    expect(secondaryMuscles, containsAll(['biceps brachii', 'wrist flexors', 'infraspinatus', 'posterior deltoid']));
  });

  test('syncMovements should not duplicate data if already seeded', () async {
    // Seed once
    await repository.syncMovements();
    final firstCount = Sqflite.firstIntValue(await db.rawQuery('SELECT COUNT(*) FROM movements'));

    // Seed again
    await repository.syncMovements();
    final secondCount = Sqflite.firstIntValue(await db.rawQuery('SELECT COUNT(*) FROM movements'));

    expect(secondCount, firstCount);
  });

  test('searchMovements should return results from seeded data', () async {
    await repository.syncMovements();
    
    final results = await repository.searchMovements('Bench');

    expect(results.any((r) => r.displayName == 'Bench Press'), isTrue);
    expect(results.first.movement.primaryMuscles, contains('pectoralis major'));
  });

  test('searchMovements matches named variations and aliases', () async {
    final movement = Movement(
      id: 'test-deadlift',
      name: 'Deadlift',
      variations: const {
        'romanian': ['sumo'],
        'sumo': ['romanian'],
      },
      namedVariations: [
        NamedVariation(name: 'Romanian Deadlift', variationKeys: const ['romanian'], aliases: const ['RDL']),
        NamedVariation(name: 'Sumo Deadlift', variationKeys: const ['sumo']),
      ],
    );
    await repository.saveMovement(movement);

    final byName = await repository.searchMovements('romanian');
    expect(byName, hasLength(1));
    expect(byName.first.displayName, 'Romanian Deadlift');
    expect(byName.first.preselectedVariations, ['romanian']);

    final byAlias = await repository.searchMovements('rdl');
    expect(byAlias.any((r) => r.displayName == 'Romanian Deadlift'), isTrue);

    // Base movement ranks above its named variations for a shared prefix.
    final byBase = await repository.searchMovements('deadlift');
    expect(byBase.first.displayName, 'Deadlift');
    expect(byBase.map((r) => r.displayName), containsAll(['Romanian Deadlift', 'Sumo Deadlift']));
  });

  group('syncMovements migrations', () {
    const deadliftPk = 'ba2387cd-2192-42d5-8895-4c8ad78b3607';
    const oldRdlPk = '9aea77cf-1fc2-4758-96e5-e894112778a8';

    test('moves logs off the deprecated Romanian Deadlift movement', () async {
      final oldRdl = Movement(
        id: oldRdlPk,
        name: 'Romanian Deadlift',
        muscleGroups: const ['Legs'],
        variations: const {'dumbbell': []},
      );
      await db.insert('movements', oldRdl.toMap());
      await db.insert('logs', WorkoutLog(
        movementId: oldRdlPk,
        weight: 100,
        reps: 8,
        timestamp: 1000,
        variations: const ['dumbbell'],
        movementName: 'Romanian Deadlift',
      ).toMap());

      await repository.syncMovements();

      final staleRows = await db.query('movements', where: 'id = ?', whereArgs: [oldRdlPk]);
      expect(staleRows, isEmpty, reason: 'Deprecated movement row should be deleted');

      final logRows = await db.query('logs');
      expect(logRows, hasLength(1));
      final migrated = WorkoutLog.fromMap(logRows.first);
      expect(migrated.movementId, deadliftPk);
      expect(migrated.variations, containsAll(['dumbbell', 'romanian']));

      // Repeat sync stays stable.
      await repository.syncMovements();
      final again = WorkoutLog.fromMap((await db.query('logs')).first);
      expect(again.variations.where((v) => v == 'romanian'), hasLength(1));
    });

    test('renames misspelled romainian key in stored movements and logs', () async {
      final storedDeadlift = Movement(
        id: deadliftPk,
        name: 'Deadlift',
        variations: const {
          'romainian': ['sumo'],
          'sumo': ['romainian'],
          'my-custom': [],
        },
      );
      await db.insert('movements', storedDeadlift.toMap());
      await db.insert('logs', WorkoutLog(
        movementId: deadliftPk,
        weight: 200,
        reps: 5,
        timestamp: 2000,
        variations: const ['romainian', 'barbell'],
      ).toMap());

      await repository.syncMovements();

      final synced = await repository.getMovementById(deadliftPk);
      expect(synced!.variations.keys, isNot(contains('romainian')));
      expect(synced.variations.keys, contains('romanian'));
      expect(synced.variations.keys, contains('my-custom'), reason: 'Custom variations survive');
      expect(synced.variations.keys, isNot(contains('rack-pull')), reason: 'Removed keys stay removed');
      for (final exclusions in synced.variations.values) {
        expect(exclusions, isNot(contains('romainian')));
        expect(exclusions, isNot(contains('rack-pull')));
      }

      final log = WorkoutLog.fromMap((await db.query('logs')).first);
      expect(log.variations, ['romanian', 'barbell']);
    });
  });
}

