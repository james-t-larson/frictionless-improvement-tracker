import 'package:flutter_test/flutter_test.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';
import 'package:simple_gym_tracker/core/database/database_helper.dart';
import 'package:simple_gym_tracker/data/repositories/movement_repository.dart';
import 'package:simple_gym_tracker/data/sources/exercise_data_source.dart';
import 'package:simple_gym_tracker/data/sources/static_exercise_data.dart';
import 'dart:convert';

void main() {
  // Initialize sqflite ffi
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

  test('seedMovementsIfEmpty should import all data from staticExerciseJson', () async {
    // Act
    await repository.seedMovementsIfEmpty();

    // Assert
    final movements = await db.query('movements');
    final jsonCount = (jsonDecode(staticExerciseJson) as List).length;
    
    expect(movements.length, jsonCount, reason: 'Number of movements should match JSON entries');

    // Verify a specific exercise: Pull-Up (the first one in JSON)
    final pullUp = movements.firstWhere((m) => m['name'] == 'Pull-Up');
    final pullUpId = pullUp['id'];

    // Verify variations for Pull-Up
    final pullUpVariations = await db.rawQuery('''
      SELECT v.name 
      FROM variations v
      JOIN movement_variations mv ON v.id = mv.variation_id
      WHERE mv.movement_id = ?
    ''', [pullUpId]);

    final expectedVariations = ["bodyweight", "weighted", "assisted", "neutral-grip", "wide-grip", "close-grip"];
    final actualVariations = pullUpVariations.map((v) => v['name']).toList();
    
    for (var v in expectedVariations) {
      expect(actualVariations, contains(v));
    }

    // Verify muscle groups for Pull-Up
    final pullUpMuscles = await db.rawQuery('''
      SELECT mg.name, mm.is_primary
      FROM muscle_groups mg
      JOIN movement_muscles mm ON mg.id = mm.muscle_id
      WHERE mm.movement_id = ?
    ''', [pullUpId]);

    final primaryMuscles = pullUpMuscles.where((m) => m['is_primary'] == 1).map((m) => m['name']).toList();
    final secondaryMuscles = pullUpMuscles.where((m) => m['is_primary'] == 0).map((m) => m['name']).toList();

    expect(primaryMuscles, contains('lat'));
    expect(secondaryMuscles, containsAll(['bicep', 'forearm - inner', 'rotator cuff - back', 'shoulder - back']));
  });

  test('seedMovementsIfEmpty should not duplicate data if already seeded', () async {
    // Seed once
    await repository.seedMovementsIfEmpty();
    final firstCount = Sqflite.firstIntValue(await db.rawQuery('SELECT COUNT(*) FROM movements'));

    // Seed again
    await repository.seedMovementsIfEmpty();
    final secondCount = Sqflite.firstIntValue(await db.rawQuery('SELECT COUNT(*) FROM movements'));

    expect(secondCount, firstCount);
  });

  test('searchMovements should return results from seeded data', () async {
    await repository.seedMovementsIfEmpty();
    
    final results = await repository.searchMovements('Bench');
    
    expect(results.any((m) => m.name == 'Bench Press'), isTrue);
    expect(results.first.primaryMuscles, contains('chest'));
  });
}
