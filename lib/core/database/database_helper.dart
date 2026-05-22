import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';

class DatabaseHelper {
  static const _databaseName = "gym_tracker.db";
  static const _databaseVersion = 7;

  static Future<Database> initDb() async {
    final documentsDirectory = await getApplicationDocumentsDirectory();
    final path = join(documentsDirectory.path, _databaseName);

    return await openDatabase(
      path,
      version: _databaseVersion,
      onCreate: onCreate,
      onUpgrade: (db, oldVersion, newVersion) async {
        if (oldVersion < 6) {
          // Simplest upgrade: Drop all and recreate for now
          await db.execute("DROP TABLE IF EXISTS workout_variations");
          await db.execute("DROP TABLE IF EXISTS workouts");
          await db.execute("DROP TABLE IF EXISTS movement_variations");
          await db.execute("DROP TABLE IF EXISTS variations");
          await db.execute("DROP TABLE IF EXISTS movement_muscles");
          await db.execute("DROP TABLE IF EXISTS muscles");
          await db.execute("DROP TABLE IF EXISTS movement_muscle_groups");
          await db.execute("DROP TABLE IF EXISTS muscle_groups");
          await db.execute("DROP TABLE IF EXISTS movement_groups");
          await db.execute("DROP TABLE IF EXISTS workout_groups");
          await db.execute("DROP TABLE IF EXISTS movements");
          await db.execute("DROP TABLE IF EXISTS logs");
          await db.execute("DROP TABLE IF EXISTS settings");
          await onCreate(db, newVersion);
        } else if (oldVersion < 7) {
          await db.execute("DROP TABLE IF EXISTS movements");
          await db.execute('''
            CREATE TABLE movements (
              id TEXT PRIMARY KEY,
              data TEXT NOT NULL
            )
          ''');
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
        id TEXT PRIMARY KEY,
        data TEXT NOT NULL
      )
    ''');

    await db.execute('''
      CREATE TABLE logs (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        data TEXT NOT NULL
      )
    ''');

    await db.execute('''
      CREATE TABLE settings (
        key TEXT PRIMARY KEY,
        value TEXT NOT NULL
      )
    ''');

    await db.insert('settings', {'key': 'has_swiped', 'value': '0'});
  }
}
