import 'package:sqflite/sqflite.dart';

class SettingsRepository {
  final Database _db;

  SettingsRepository(this._db);

  Future<bool> getHasSwiped() async {
    final List<Map<String, dynamic>> maps = await _db.query(
      'settings',
      where: 'key = ?',
      whereArgs: ['has_swiped'],
    );
    if (maps.isNotEmpty) {
      return maps.first['value'] == '1';
    }
    return false;
  }

  Future<void> setHasSwiped(bool value) async {
    await _db.update(
      'settings',
      {'value': value ? '1' : '0'},
      where: 'key = ?',
      whereArgs: ['has_swiped'],
    );
  }
}
