import 'package:flutter_test/flutter_test.dart';
import 'package:simple_gym_tracker/data/models/movement.dart';

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
