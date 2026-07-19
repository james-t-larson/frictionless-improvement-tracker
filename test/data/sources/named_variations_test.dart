import 'package:flutter_test/flutter_test.dart';
import 'package:simple_gym_tracker/data/models/movement.dart';
import 'package:simple_gym_tracker/data/sources/exercise_data_source.dart';

void main() {
  test('Named variations reference valid, non-conflicting variation keys', () async {
    final data = await ExerciseDataSource().getExercises();
    final movements = data.map((json) => Movement.fromJson(json as Map<String, dynamic>)).toList();

    final errors = <String>[];
    final seenNames = <String, String>{};

    for (final movement in movements) {
      if (seenNames.containsKey(movement.name)) {
        errors.add('Duplicate movement name "${movement.name}"');
      }
      seenNames[movement.name] = movement.name;

      for (final nv in movement.namedVariations) {
        if (nv.variationKeys.isEmpty) {
          errors.add('${movement.name}: "${nv.name}" has no variation keys');
        }

        for (final key in nv.variationKeys) {
          if (!movement.variations.containsKey(key)) {
            errors.add('${movement.name}: "${nv.name}" references unknown variation "$key"');
          }
        }

        for (final key in nv.variationKeys) {
          final excluded = movement.variations[key] ?? const [];
          final conflicts = nv.variationKeys.where(excluded.contains);
          for (final conflict in conflicts) {
            errors.add('${movement.name}: "${nv.name}" combines "$key" with "$conflict" but they are mutually exclusive');
          }
        }

        final existing = seenNames[nv.name];
        if (existing != null) {
          errors.add('${movement.name}: "${nv.name}" collides with a name already used by $existing');
        }
        seenNames[nv.name] = '${movement.name} (named variation)';

        for (final alias in nv.aliases) {
          final aliasOwner = seenNames[alias];
          if (aliasOwner != null) {
            errors.add('${movement.name}: alias "$alias" of "${nv.name}" collides with $aliasOwner');
          }
          seenNames[alias] = '${movement.name} (alias of "${nv.name}")';
        }
      }
    }

    expect(errors, isEmpty, reason: 'Named variation catalog problems:\n${errors.join('\n')}');
  });
}
