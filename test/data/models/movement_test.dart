import 'package:flutter_test/flutter_test.dart';
import 'package:simple_gym_tracker/data/models/movement.dart';
import 'package:simple_gym_tracker/data/models/named_variation.dart';

void main() {
  group('Movement Model', () {
    test('fromJson parses variations map correctly', () {
      final json = {
        'name': 'Pull-Up',
        'variations': {
          'bodyweight': {'excludedVariations': ['neutral-grip', 'wide-grip']},
          'neutral-grip': {'excludedVariations': ['bodyweight', 'weighted']},
        }
      };

      final movement = Movement.fromJson(json);

      expect(movement.name, 'Pull-Up');
      expect(movement.variations, isNotEmpty);
      expect(movement.variations['bodyweight'], equals(['neutral-grip', 'wide-grip']));
      expect(movement.variations['neutral-grip'], equals(['bodyweight', 'weighted']));
    });

    test('toJson serializes variations map correctly', () {
      final movement = Movement(
        name: 'Pull-Up',
        variations: {
          'bodyweight': ['neutral-grip'],
          'neutral-grip': ['bodyweight'],
        },
      );

      final json = movement.toJson();

      expect(json['name'], 'Pull-Up');
      expect(json['variations'], isA<Map<String, dynamic>>());
      final vars = json['variations'] as Map<String, dynamic>;
      expect(vars['bodyweight']['excludedVariations'], equals(['neutral-grip']));
    });

    test('namedVariations round-trip through JSON', () {
      final json = {
        'name': 'Deadlift',
        'variations': {
          'romanian': {'excludedVariations': ['sumo']},
          'sumo': {'excludedVariations': ['romanian']},
        },
        'namedVariations': [
          {'name': 'Romanian Deadlift', 'variations': ['romanian'], 'aliases': ['RDL']},
          {'name': 'Sumo Deadlift', 'variations': ['sumo']},
        ],
      };

      final movement = Movement.fromJson(json);

      expect(movement.namedVariations, hasLength(2));
      expect(movement.namedVariations.first.name, 'Romanian Deadlift');
      expect(movement.namedVariations.first.variationKeys, ['romanian']);
      expect(movement.namedVariations.first.aliases, ['RDL']);

      final roundTripped = Movement.fromJson(movement.toJson());
      expect(roundTripped.namedVariations, hasLength(2));
      expect(roundTripped.namedVariations.last.name, 'Sumo Deadlift');
      expect(roundTripped.namedVariations.last.aliases, isEmpty);
    });

    test('resolveNamedVariation picks the most specific match', () {
      final movement = Movement(
        name: 'Bench Press',
        variations: const {
          'incline': [],
          'dumbbell': [],
        },
        namedVariations: [
          NamedVariation(name: 'Incline Bench Press', variationKeys: const ['incline']),
          NamedVariation(name: 'Incline Dumbbell Press', variationKeys: const ['incline', 'dumbbell']),
        ],
      );

      expect(movement.resolveNamedVariation(['incline'])?.name, 'Incline Bench Press');
      expect(movement.resolveNamedVariation(['incline', 'dumbbell', 'paused'])?.name, 'Incline Dumbbell Press');
      expect(movement.resolveNamedVariation(['dumbbell']), isNull);
      expect(movement.resolveNamedVariation([]), isNull);
    });

    test('fromJson handles missing variations gracefully', () {
      final json = {
        'name': 'Push-Up',
      };

      final movement = Movement.fromJson(json);

      expect(movement.name, 'Push-Up');
      expect(movement.variations, isEmpty);
    });

    test('fromJson handles empty variations gracefully', () {
      final json = {
        'name': 'Push-Up',
        'variations': {}
      };

      final movement = Movement.fromJson(json);

      expect(movement.name, 'Push-Up');
      expect(movement.variations, isEmpty);
    });
  });
}
