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
import 'package:uuid/uuid.dart';

class DataRepository {
  final Database _db;

  DataRepository(this._db);

  // --- EXPORT LOGIC ---

  Future<void> exportToCsv() async {
    final List<Map<String, dynamic>> results = await _db.rawQuery('''
      SELECT l.data as log_data, m.data as mov_data
      FROM logs l
      LEFT JOIN movements m ON json_extract(l.data, '\$.movementId') = m.id
      ORDER BY json_extract(l.data, '\$.timestamp') DESC
    ''');

    List<List<dynamic>> csvData = [
      ['Date', 'Movement', 'Muscle Group', 'Variations', 'Weight', 'Reps', 'Pain'],
    ];

    for (var row in results) {
      final logMap = jsonDecode(row['log_data'] as String);
      final movMap = row['mov_data'] != null ? jsonDecode(row['mov_data'] as String) : {};

      final timestamp = logMap['timestamp'] as int? ?? 0;
      final date = DateTime.fromMillisecondsSinceEpoch(timestamp);
      
      final movementName = movMap['name']?.toString() ?? logMap['movementName']?.toString() ?? '';
      
      final muscleGroups = movMap['muscleGroups'] as List<dynamic>? ?? [];
      final primaryMuscleGroup = muscleGroups.isNotEmpty ? muscleGroups.first.toString() : (logMap['muscleGroupName']?.toString() ?? '');

      final variationsList = logMap['variations'] as List<dynamic>? ?? [];
      final variationsStr = variationsList.map((e) => e.toString()).join(' | ');

      final weight = logMap['weight'] ?? 0;
      final reps = logMap['reps'] ?? 0;
      final painFelt = logMap['painFelt'] == true ? 'TRUE' : 'FALSE';

      csvData.add([
        DateFormat('yyyy-MM-dd HH:mm:ss').format(date),
        movementName,
        primaryMuscleGroup,
        variationsStr,
        weight,
        reps,
        painFelt,
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
      'settings',
      'movements',
      'logs'
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

      await _db.execute('PRAGMA foreign_keys=OFF;');
      
      try {
        await _db.transaction((txn) async {
          final tables = ['logs', 'movements', 'settings'];

          for (var table in tables) {
            await txn.execute('DELETE FROM $table;');
          }

          Batch batch = txn.batch();
          int statementCount = 0;
          for (var line in lines) {
            var statement = line.trim();
            if (statement.startsWith('INSERT INTO')) {
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
    final uuid = const Uuid();

    try {
      await _db.transaction((txn) async {
        final movementRows = await txn.query('movements');
        final Map<String, String> movementMap = {};
        for (var m in movementRows) {
          final data = jsonDecode(m['data'] as String);
          final name = data['name']?.toString().toLowerCase();
          if (name != null) {
            movementMap[name] = m['id'] as String;
          }
        }

        for (var row in dataRows) {
          currentRow++;
          if (row.length < headers.length) continue;

          final Map<String, dynamic> mappedRow = {};
          for (int i = 0; i < headers.length; i++) {
            mappedRow[headers[i]] = row[i];
          }

          final mName = (mappedRow['movement']?.toString() ?? '').trim();
          if (mName.isEmpty) continue;
          
          String? movementId = movementMap[mName.toLowerCase()];
          if (movementId == null) {
            movementId = uuid.v4();
            final mgName = (mappedRow['muscle group']?.toString() ?? '').trim();
            final newMovData = {
              'pk': movementId,
              'name': mName,
              'primaryMuscles': [],
              'secondaryMuscles': [],
              'muscleGroups': mgName.isNotEmpty ? [mgName] : [],
              'movementVariations': [],
              'equipment': []
            };
            await txn.insert('movements', {
              'id': movementId,
              'data': jsonEncode(newMovData)
            });
            movementMap[mName.toLowerCase()] = movementId;
          }

          final vNames = (mappedRow['variations']?.toString() ?? '').split('|').map((e) => e.trim()).where((e) => e.isNotEmpty).toList();

          final dateStr = mappedRow['date']?.toString() ?? '';
          final timestamp = _parseDate(dateStr).millisecondsSinceEpoch;
          final weight = double.tryParse(mappedRow['weight']?.toString() ?? '0') ?? 0.0;
          final reps = int.tryParse(mappedRow['reps']?.toString() ?? '0') ?? 0;
          final pain = mappedRow['pain']?.toString().toUpperCase() == 'TRUE';

          final logData = {
            'movementId': movementId,
            'weight': weight,
            'reps': reps,
            'timestamp': timestamp,
            'painFelt': pain,
            'variations': vNames,
          };

          // Basic deduplication check
          final existing = await txn.rawQuery('''
            SELECT id FROM logs 
            WHERE json_extract(data, '\$.timestamp') = ? 
            AND json_extract(data, '\$.movementId') = ?
            AND json_extract(data, '\$.weight') = ?
            AND json_extract(data, '\$.reps') = ?
          ''', [timestamp, movementId, weight, reps]);

          if (existing.isEmpty) {
            await txn.insert('logs', {
              'data': jsonEncode(logData)
            });
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
