import 'package:flutter_test/flutter_test.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';
import 'package:simple_gym_tracker/core/database/database_helper.dart';
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
    
    expect(results.any((m) => m.name == 'Bench Press'), isTrue);
    expect(results.first.primaryMuscles, contains('pectoralis major'));
  });
}

