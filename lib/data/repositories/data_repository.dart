import 'dart:convert';
import 'dart:io';
import 'dart:ui';
import 'package:csv/csv.dart';
import 'package:flutter/foundation.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:share_plus/share_plus.dart';
import 'package:sqflite/sqflite.dart';
import 'package:intl/intl.dart';

class DataRepository {
  final Database _db;

  DataRepository(this._db);

  // --- EXPORT LOGIC ---

  Future<void> exportToCsv() async {
    final List<Map<String, dynamic>> results = await _db.rawQuery('''
      SELECT 
        w.timestamp,
        m.name AS movement_name,
        mg.name AS primary_muscle_group,
        GROUP_CONCAT(v.name, '|') AS variations,
        w.weight,
        w.reps,
        w.pain_felt
      FROM workouts w
      LEFT JOIN movements m ON w.movement_id = m.id
      LEFT JOIN movement_muscles mm ON m.id = mm.movement_id AND mm.is_primary = 1
      LEFT JOIN muscle_groups mg ON mm.muscle_id = mg.id
      LEFT JOIN workout_variations wv ON w.id = wv.workout_id
      LEFT JOIN variations v ON wv.variation_id = v.id
      GROUP BY w.id
      ORDER BY w.timestamp DESC
    ''');

    List<List<dynamic>> csvData = [
      ['Date', 'Movement', 'Muscle Group', 'Variations', 'Weight', 'Reps', 'Pain'],
    ];

    for (var row in results) {
      final date = DateTime.fromMillisecondsSinceEpoch(row['timestamp']);
      csvData.add([
        DateFormat('yyyy-MM-dd HH:mm:ss').format(date),
        row['movement_name'] ?? '',
        row['primary_muscle_group'] ?? '',
        row['variations'] ?? '',
        row['weight'],
        row['reps'],
        row['pain_felt'] == 1 ? 'TRUE' : 'FALSE',
      ]);
    }

    String csvString = const ListToCsvConverter().convert(csvData);
    final directory = await getTemporaryDirectory();
    final fileName = 'gym_logs_${DateTime.now().millisecondsSinceEpoch}.csv';
    final file = File(join(directory.path, fileName));
    await file.writeAsString(csvString);

    if (await file.exists()) {
      await Share.shareXFiles(
        [
          XFile(
            file.path,
            name: fileName,
            mimeType: 'text/csv',
          )
        ],
        sharePositionOrigin: const Rect.fromLTWH(0, 0, 10, 10), // Required for iPad/Tablets
      );
    } else {
      throw Exception('Failed to create CSV file');
    }
  }

  Future<void> exportToSql() async {
    final tables = [
      'muscle_groups',
      'movements',
      'movement_muscles',
      'variations',
      'movement_variations',
      'workouts',
      'workout_variations',
      'settings'
    ];

    StringBuffer sqlBuffer = StringBuffer();
    sqlBuffer.writeln('-- Gym Tracker Database Export');
    sqlBuffer.writeln('-- Generated at: ${DateTime.now().toIso8601String()}');
    sqlBuffer.writeln('PRAGMA foreign_keys=OFF;');

    for (var table in tables) {
      final List<Map<String, dynamic>> rows = await _db.query(table);
      if (rows.isEmpty) continue;

      sqlBuffer.writeln('\n-- Table: $table');
      for (var row in rows) {
        final columns = row.keys.join(', ');
        final values = row.values.map((v) {
          if (v == null) return 'NULL';
          if (v is String) return "'${v.replaceAll("'", "''")}'";
          return v.toString();
        }).join(', ');
        sqlBuffer.writeln('INSERT INTO $table ($columns) VALUES ($values);');
      }
    }

    sqlBuffer.writeln('\nPRAGMA foreign_keys=ON;');

    final directory = await getTemporaryDirectory();
    final fileName = 'gym_backup_${DateTime.now().millisecondsSinceEpoch}.sql';
    final file = File(join(directory.path, fileName));
    await file.writeAsString(sqlBuffer.toString());

    if (await file.exists()) {
      await Share.shareXFiles(
        [
          XFile(
            file.path,
            name: fileName,
            mimeType: 'text/plain',
          )
        ],
        sharePositionOrigin: const Rect.fromLTWH(0, 0, 10, 10),
      );
    } else {
      throw Exception('Failed to create SQL backup file');
    }
  }

  // --- IMPORT LOGIC ---

  Future<void> importSql(String filePath) async {
    try {
      final file = File(filePath);
      if (!await file.exists()) {
        throw Exception('SQL file not found');
      }
      
      final sqlContent = await file.readAsString();
      final lines = sqlContent.split('\n');

      // Pragmas must be outside transaction
      await _db.execute('PRAGMA foreign_keys=OFF;');
      
      try {
        await _db.transaction((txn) async {
          final tables = [
            'workout_variations',
            'workouts',
            'movement_variations',
            'variations',
            'movement_muscles',
            'muscle_groups',
            'movements',
            'settings'
          ];

          for (var table in tables) {
            await txn.execute('DELETE FROM $table;');
          }

          Batch batch = txn.batch();
          int statementCount = 0;
          for (var line in lines) {
            var statement = line.trim();
            if (statement.startsWith('INSERT INTO')) {
              // sqflite batch.execute often fails if trailing semicolon is present
              if (statement.endsWith(';')) {
                statement = statement.substring(0, statement.length - 1);
              }
              batch.execute(statement);
              statementCount++;
            }
          }
          if (statementCount > 0) {
            await batch.commit(noResult: true);
          }
        });
      } finally {
        await _db.execute('PRAGMA foreign_keys=ON;');
      }
    } catch (e) {
      throw Exception('SQL Restore failed: $e');
    }
  }

  Future<int> importCsv(String filePath) async {
    final file = File(filePath);
    if (!await file.exists()) {
      throw Exception('CSV file not found');
    }

    String csvString;
    try {
      csvString = await file.readAsString();
    } catch (e) {
      try {
        final bytes = await file.readAsBytes();
        csvString = utf8.decode(bytes, allowMalformed: true);
      } catch (e2) {
        throw Exception('Failed to read CSV file: $e2');
      }
    }
    
    List<List<dynamic>> rows;
    try {
      rows = await compute(_parseCsv, csvString);
    } catch (e) {
      try {
        rows = _parseCsv(csvString);
      } catch (e2) {
        throw Exception('Failed to parse CSV content: $e2');
      }
    }

    if (rows.isEmpty) throw Exception('CSV file is empty');
    if (rows.length <= 1) return 0;

    final headers = rows.first.map((h) => h.toString().toLowerCase().trim()).toList();
    final dataRows = rows.sublist(1);

    int importedCount = 0;
    int currentRow = 1;

    try {
      await _db.transaction((txn) async {
        final muscleMap = {for (var m in await txn.query('muscle_groups')) (m['name'] as String).toLowerCase(): m['id'] as int};
        final movementMap = {for (var m in await txn.query('movements')) (m['name'] as String).toLowerCase(): m['id'] as int};
        final variationMap = {for (var v in await txn.query('variations')) (v['name'] as String).toLowerCase(): v['id'] as int};

        for (var row in dataRows) {
          currentRow++;
          if (row.length < headers.length) continue;

          final Map<String, dynamic> mappedRow = {};
          for (int i = 0; i < headers.length; i++) {
            mappedRow[headers[i]] = row[i];
          }

          final mgName = (mappedRow['muscle group']?.toString() ?? '').trim();
          int? muscleId = muscleMap[mgName.toLowerCase()];
          if (muscleId == null && mgName.isNotEmpty) {
            muscleId = await txn.insert('muscle_groups', {'name': mgName});
            muscleMap[mgName.toLowerCase()] = muscleId;
          }

          final mName = (mappedRow['movement']?.toString() ?? '').trim();
          if (mName.isEmpty) continue;
          int? movementId = movementMap[mName.toLowerCase()];
          if (movementId == null) {
            movementId = await txn.insert('movements', {'name': mName});
            movementMap[mName.toLowerCase()] = movementId;
            
            if (muscleId != null) {
              await txn.insert('movement_muscles', {
                'movement_id': movementId,
                'muscle_id': muscleId,
                'is_primary': 1
              });
            }
          }

          final vNames = (mappedRow['variations']?.toString() ?? '').split('|').map((e) => e.trim()).where((e) => e.isNotEmpty).toList();
          final List<int> variationIds = [];
          for (var vn in vNames) {
            int? vId = variationMap[vn.toLowerCase()];
            if (vId == null) {
              vId = await txn.insert('variations', {'name': vn});
              variationMap[vn.toLowerCase()] = vId;
            }
            variationIds.add(vId);
            
            final existingLink = await txn.query('movement_variations', 
              where: 'movement_id = ? AND variation_id = ?', 
              whereArgs: [movementId, vId]
            );
            if (existingLink.isEmpty) {
              await txn.insert('movement_variations', {
                'movement_id': movementId,
                'variation_id': vId
              });
            }
          }

          final dateStr = mappedRow['date']?.toString() ?? '';
          final timestamp = _parseDate(dateStr).millisecondsSinceEpoch;
          final weight = double.tryParse(mappedRow['weight']?.toString() ?? '0') ?? 0.0;
          final reps = int.tryParse(mappedRow['reps']?.toString() ?? '0') ?? 0;
          final pain = mappedRow['pain']?.toString().toUpperCase() == 'TRUE' ? 1 : 0;

          final existingWorkout = await txn.query('workouts', 
            where: 'timestamp = ? AND movement_id = ? AND weight = ? AND reps = ?',
            whereArgs: [timestamp, movementId, weight, reps]
          );

          if (existingWorkout.isEmpty) {
            final workoutId = await txn.insert('workouts', {
              'timestamp': timestamp,
              'movement_id': movementId,
              'weight': weight,
              'reps': reps,
              'pain_felt': pain
            });

            for (var vId in variationIds) {
              await txn.insert('workout_variations', {
                'workout_id': workoutId,
                'variation_id': vId
              });
            }
            importedCount++;
          }
        }
      });
    } catch (e) {
      throw Exception('CSV Merge failed at row $currentRow: $e');
    }

    return importedCount;
  }

  static List<List<dynamic>> _parseCsv(String csv) {
    return const CsvToListConverter().convert(csv);
  }

  DateTime _parseDate(String dateStr) {
    try {
      return DateTime.parse(dateStr);
    } catch (e) {
      try {
        return DateFormat('yyyy-MM-dd HH:mm:ss').parse(dateStr);
      } catch (e2) {
        return DateTime.now();
      }
    }
  }
}
