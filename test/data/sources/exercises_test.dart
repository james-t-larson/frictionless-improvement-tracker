import 'dart:io';
import 'package:flutter_test/flutter_test.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';
import 'package:sqflite/sqflite.dart';
import 'package:simple_gym_tracker/core/database/database_helper.dart';
import 'package:simple_gym_tracker/data/repositories/movement_repository.dart';
import 'package:simple_gym_tracker/data/sources/exercise_data_source.dart';

void main() {
  setUpAll(() {
    // Initialize FFI for tests
    sqfliteFfiInit();
    databaseFactory = databaseFactoryFfi;
  });

  test('Number of exercise files matches number of exercises in database', () async {
    // 1. Get all exercise files and their PKs
    final directory = Directory('lib/data/sources/exercises');
    final files = directory.listSync().whereType<File>().where((file) => file.path.endsWith('.dart')).toList();
    final fileCount = files.length;

    final pksInFiles = <String>[];
    final pkRegex = RegExp(r'"pk"\s*:\s*"([^"]+)"');
    for (final file in files) {
      final content = file.readAsStringSync();
      final match = pkRegex.firstMatch(content);
      if (match != null) {
        pksInFiles.add(match.group(1)!);
      }
    }

    // 2. Initialize in-memory database
    final db = await databaseFactory.openDatabase(inMemoryDatabasePath, options: OpenDatabaseOptions(
      version: 7,
      onCreate: DatabaseHelper.onCreate,
    ));

    // 3. Seed the database
    final dataSource = ExerciseDataSource();
    final repository = MovementRepository(db, dataSource);
    await repository.syncMovements();

    // 4. Get the PKs from the database
    final result = await db.rawQuery('SELECT COUNT(*) FROM movements');
    final dbCount = Sqflite.firstIntValue(result) ?? 0;

    final idRows = await db.rawQuery('SELECT id FROM movements');
    final pksInDb = idRows.map((row) => row['id'] as String).toList();

    // 5. Assert they match and list missing PKs
    final missingInDb = pksInFiles.where((pk) => !pksInDb.contains(pk)).toList();
    expect(missingInDb, isEmpty, reason: 'The following exercise PKs from files are missing in the DB: $missingInDb');
    expect(dbCount, fileCount, reason: 'The number of exercise files should match the number of exercises seeded into the DB.');

    await db.close();
  });
}
