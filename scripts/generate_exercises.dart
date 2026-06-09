import 'dart:io';

void main() {
  final dir = Directory('lib/data/sources/exercises');
  final files = dir.listSync().whereType<File>().where((f) => f.path.endsWith('.dart')).toList();
  files.sort((a, b) => a.path.compareTo(b.path));

  final imports = <String>[];
  final variables = <String>[];

  for (var file in files) {
    final fileName = file.uri.pathSegments.last;
    imports.add("import 'exercises/$fileName';");

    final content = file.readAsStringSync();
    // Look for const Map<String, dynamic> myExercise = 
    final match = RegExp(r'const Map<String, dynamic>\s+(\w+)\s*=').firstMatch(content);
    if (match != null) {
      variables.add(match.group(1)!);
    } else {
      print("Warning: Could not find map variable in $fileName");
    }
  }

  final out = StringBuffer();
  out.writeln('// GENERATED CODE - DO NOT MODIFY BY HAND');
  out.writeln('// Run `dart scripts/generate_exercises.dart` to update this file.');
  out.writeln();
  for (var imp in imports) {
    out.writeln(imp);
  }
  out.writeln();
  out.writeln('class ExerciseDataSource {');
  out.writeln('  Future<List<dynamic>> getExercises() async {');
  out.writeln('    return [');
  for (var variable in variables) {
    out.writeln('      $variable,');
  }
  out.writeln('    ];');
  out.writeln('  }');
  out.writeln('}');

  File('lib/data/sources/exercise_data_source.dart').writeAsStringSync(out.toString());
  print('Successfully generated lib/data/sources/exercise_data_source.dart with ${variables.length} exercises.');
}
