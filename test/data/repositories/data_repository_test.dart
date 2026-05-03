import 'dart:io';
import 'package:flutter_test/flutter_test.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';
import 'package:simple_gym_tracker/core/database/database_helper.dart';
import 'package:simple_gym_tracker/data/repositories/data_repository.dart';
import 'package:path/path.dart' as p;

import 'package:csv/csv.dart';

void main() {
  sqfliteFfiInit();
  databaseFactory = databaseFactoryFfi;

  late Database db;
  late DataRepository repository;

  setUp(() async {
    db = await DatabaseHelper.initTestDb();
    repository = DataRepository(db);
  });

  tearDown(() async {
    await db.close();
  });

  group('DataRepository Integration Tests', () {
    test('Round-trip SQL Export/Import', () async {
      // ... (unchanged)
    });

    test('CSV Import with Smart Merge and Idempotency', () async {
      // 1. Prepare CSV using the converter itself
      final csvData = [
        ['Date', 'Movement', 'Muscle Group', 'Variations', 'Weight', 'Reps', 'Pain'],
        ['2023-10-01 10:00:00', 'Squat', 'Legs', 'Back|Barbell', 225.0, 5, 'FALSE'],
        ['2023-10-01 10:00:00', 'Squat', 'Legs', 'Back|Barbell', 225.0, 5, 'FALSE'],
      ];
      final csvContent = const ListToCsvConverter().convert(csvData);

      final tempFile = File(p.join(Directory.systemTemp.path, 'test_import.csv'));
      await tempFile.writeAsString(csvContent);

      // 2. Import
      final importedCount = await repository.importCsv(tempFile.path);

      // 3. Assert
      expect(importedCount, 1, reason: 'Only 1 unique log should be imported');
      
      final movements = await db.query('movements');
      expect(movements.length, 1);
      expect(movements.first['name'], 'Squat');

      final variations = await db.query('variations');
      expect(variations.length, 2);
      expect(variations.any((v) => v['name'] == 'Back'), isTrue);
      expect(variations.any((v) => v['name'] == 'Barbell'), isTrue);

      final muscleGroups = await db.query('muscle_groups');
      expect(muscleGroups.length, 1);
      expect(muscleGroups.first['name'], 'Legs');

      // Verify Relationships
      final workoutId = (await db.query('workouts')).first['id'];
      final linkedVariations = await db.query('workout_variations', where: 'workout_id = ?', whereArgs: [workoutId]);
      expect(linkedVariations.length, 2);
    });

    test('CSV Import - Name Normalization', () async {
      // 1. Seed "Bench Press"
      await db.insert('movements', {'name': 'Bench Press'});

      // 2. Import CSV with "bench press" (lowercase)
      final csvData = [
        ['Date', 'Movement', 'Muscle Group', 'Variations', 'Weight', 'Reps', 'Pain'],
        ['2023-10-01 10:00:00', 'bench press', 'Chest', '', 135.0, 10, 'FALSE'],
      ];
      final csvContent = const ListToCsvConverter().convert(csvData);
      
      final tempFile = File(p.join(Directory.systemTemp.path, 'test_norm.csv'));
      await tempFile.writeAsString(csvContent);

      await repository.importCsv(tempFile.path);

      // 3. Assert - Should NOT create a second movement
      final movements = await db.query('movements');
      expect(movements.length, 1);
    });
  });
}

