import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:simple_gym_tracker/data/models/movement.dart';
import 'package:simple_gym_tracker/data/repositories/movement_repository.dart';
import 'package:simple_gym_tracker/data/repositories/workout_repository.dart';
import 'package:simple_gym_tracker/features/exercise_logging/viewmodels/log_exercise_bloc.dart';

class MockMovementRepository extends Mock implements MovementRepository {}
class MockWorkoutRepository extends Mock implements WorkoutRepository {}

void main() {
  late LogExerciseBloc bloc;
  late MockMovementRepository mockMovementRepository;
  late MockWorkoutRepository mockWorkoutRepository;

  setUp(() {
    mockMovementRepository = MockMovementRepository();
    mockWorkoutRepository = MockWorkoutRepository();
    bloc = LogExerciseBloc(mockMovementRepository, mockWorkoutRepository);
  });

  tearDown(() {
    bloc.close();
  });

  group('LogExerciseBloc Variation Logic', () {
    final movement = Movement(
      id: '1',
      name: 'Pull-Up',
      variations: {
        'bodyweight': ['neutral-grip', 'wide-grip'],
        'neutral-grip': ['bodyweight', 'weighted'],
        'wide-grip': ['bodyweight', 'weighted'],
        'weighted': ['neutral-grip', 'wide-grip'],
        'assisted': ['neutral-grip', 'wide-grip'],
      },
    );

    test('SelectMovement initializes availableVariations with all keys', () async {
      when(() => mockWorkoutRepository.getLastPerformance(any())).thenAnswer((_) async => null);
      
      bloc.add(SelectMovement(movement));
      await Future.delayed(Duration.zero);

      expect(bloc.state.availableVariations.length, 5);
      expect(bloc.state.availableVariations, contains('bodyweight'));
      expect(bloc.state.availableVariations, contains('neutral-grip'));
    });

    test('ToggleVariation filters availableVariations based on selection (single)', () async {
      when(() => mockWorkoutRepository.getLastPerformance(any())).thenAnswer((_) async => null);
      
      bloc.add(SelectMovement(movement));
      await Future.delayed(Duration.zero);
      
      bloc.add(const ToggleVariation('bodyweight'));
      await Future.delayed(Duration.zero);

      expect(bloc.state.selectedVariations, contains('bodyweight'));
      expect(bloc.state.availableVariations.length, 2);
      expect(bloc.state.availableVariations, contains('neutral-grip'));
      expect(bloc.state.availableVariations, contains('wide-grip'));
    });

    test('ToggleVariation restores all variations when deselected', () async {
      when(() => mockWorkoutRepository.getLastPerformance(any())).thenAnswer((_) async => null);
      
      bloc.add(SelectMovement(movement));
      await Future.delayed(Duration.zero);
      bloc.add(const ToggleVariation('bodyweight'));
      await Future.delayed(Duration.zero);
      bloc.add(const ToggleVariation('bodyweight')); // Deselect
      await Future.delayed(Duration.zero);

      expect(bloc.state.selectedVariations, isEmpty);
      expect(bloc.state.availableVariations.length, 5); // Restored all
    });

    test('ToggleVariation calculates intersection for multiple selections', () async {
      when(() => mockWorkoutRepository.getLastPerformance(any())).thenAnswer((_) async => null);
      
      bloc.add(SelectMovement(movement));
      await Future.delayed(Duration.zero);
      bloc.add(const ToggleVariation('bodyweight'));
      await Future.delayed(Duration.zero);
      bloc.add(const ToggleVariation('neutral-grip'));
      await Future.delayed(Duration.zero);

      expect(bloc.state.selectedVariations, contains('bodyweight'));
      expect(bloc.state.selectedVariations, contains('neutral-grip'));
      expect(bloc.state.availableVariations, isEmpty);
    });

    test('ToggleVariation handles empty intersection gracefully', () async {
      when(() => mockWorkoutRepository.getLastPerformance(any())).thenAnswer((_) async => null);
      
      bloc.add(SelectMovement(movement));
      await Future.delayed(Duration.zero);
      bloc.add(const ToggleVariation('bodyweight'));
      await Future.delayed(Duration.zero);
      bloc.add(const ToggleVariation('neutral-grip')); // Incompatible, intersection empty
      await Future.delayed(Duration.zero);

      expect(bloc.state.selectedVariations.length, 2);
      expect(bloc.state.availableVariations, isEmpty);
    });
  });
}
