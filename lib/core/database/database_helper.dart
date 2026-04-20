import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';

class DatabaseHelper {
  static const _databaseName = "gym_tracker.db";
  static const _databaseVersion = 1;

  static Future<Database> initDb() async {
    final documentsDirectory = await getApplicationDocumentsDirectory();
    final path = join(documentsDirectory.path, _databaseName);
    
    return await openDatabase(
      path,
      version: _databaseVersion,
      onCreate: _onCreate,
    );
  }

  static Future _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE movements (
        id TEXT PRIMARY KEY,
        name TEXT NOT NULL,
        primary_muscles TEXT,
        secondary_muscles TEXT,
        steps TEXT,
        notes TEXT
      )
    ''');

    await db.execute('''
      CREATE TABLE workouts (
        id TEXT PRIMARY KEY,
        timestamp INTEGER NOT NULL,
        movement_id TEXT NOT NULL,
        equipment TEXT NOT NULL,
        weight REAL NOT NULL,
        reps INTEGER NOT NULL,
        pain_felt INTEGER NOT NULL,
        FOREIGN KEY (movement_id) REFERENCES movements (id) ON DELETE CASCADE
      )
    ''');
  }
}
