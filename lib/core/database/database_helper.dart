import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';

class DatabaseHelper {
  static const _databaseName = "gym_tracker.db";
  static const _databaseVersion = 2;

  static Future<Database> initDb() async {
    final documentsDirectory = await getApplicationDocumentsDirectory();
    final path = join(documentsDirectory.path, _databaseName);

    return await openDatabase(
      path,
      version: _databaseVersion,
      onCreate: onCreate,
      onUpgrade: (db, oldVersion, newVersion) async {
        if (oldVersion < 2) {
          // Simplest upgrade: Drop all and recreate for now
          // In a production app, we would write migrations.
          await db.execute("DROP TABLE IF EXISTS workout_variations");
          await db.execute("DROP TABLE IF EXISTS workouts");
          await db.execute("DROP TABLE IF EXISTS movement_variations");
          await db.execute("DROP TABLE IF EXISTS variations");
          await db.execute("DROP TABLE IF EXISTS movement_muscles");
          await db.execute("DROP TABLE IF EXISTS muscle_groups");
          await db.execute("DROP TABLE IF EXISTS movements");
          await onCreate(db, newVersion);
        }
      },
    );
  }

  static Future<Database> initTestDb() async {
    return await openDatabase(
      inMemoryDatabasePath,
      version: _databaseVersion,
      onCreate: onCreate,
    );
  }

  static Future onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE movements (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        name TEXT NOT NULL
      )
    ''');

    await db.execute('''
      CREATE TABLE muscle_groups (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        name TEXT NOT NULL UNIQUE
      )
    ''');

    await db.execute('''
      CREATE TABLE movement_muscles (
        movement_id INTEGER NOT NULL,
        muscle_id INTEGER NOT NULL,
        is_primary INTEGER NOT NULL DEFAULT 0,
        PRIMARY KEY (movement_id, muscle_id),
        FOREIGN KEY (movement_id) REFERENCES movements (id) ON DELETE CASCADE,
        FOREIGN KEY (muscle_id) REFERENCES muscle_groups (id) ON DELETE CASCADE
      )
    ''');

    await db.execute('''
      CREATE TABLE variations (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        name TEXT NOT NULL UNIQUE
      )
    ''');

    await db.execute('''
      CREATE TABLE movement_variations (
        movement_id INTEGER NOT NULL,
        variation_id INTEGER NOT NULL,
        PRIMARY KEY (movement_id, variation_id),
        FOREIGN KEY (movement_id) REFERENCES movements (id) ON DELETE CASCADE,
        FOREIGN KEY (variation_id) REFERENCES variations (id) ON DELETE CASCADE
      )
    ''');

    await db.execute('''
      CREATE TABLE workouts (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        timestamp INTEGER NOT NULL,
        movement_id INTEGER NOT NULL,
        weight REAL NOT NULL,
        reps INTEGER NOT NULL,
        pain_felt INTEGER NOT NULL,
        FOREIGN KEY (movement_id) REFERENCES movements (id) ON DELETE CASCADE
      )
    ''');

    await db.execute('''
      CREATE TABLE workout_variations (
        workout_id INTEGER NOT NULL,
        variation_id INTEGER NOT NULL,
        PRIMARY KEY (workout_id, variation_id),
        FOREIGN KEY (workout_id) REFERENCES workouts (id) ON DELETE CASCADE,
        FOREIGN KEY (variation_id) REFERENCES variations (id) ON DELETE CASCADE
      )
    ''');
  }
}
