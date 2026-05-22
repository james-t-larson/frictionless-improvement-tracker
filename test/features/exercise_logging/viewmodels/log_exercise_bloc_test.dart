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
        'bodyweight': ['weighted', 'assisted'],
        'neutral-grip': ['wide-grip', 'assisted'],
        'wide-grip': ['neutral-grip', 'assisted'],
        'weighted': ['bodyweight', 'assisted'],
        'assisted': ['bodyweight', 'weighted'],
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
      // Now expects 3 because bodyweight itself remains available
      expect(bloc.state.availableVariations.length, 3);
      expect(bloc.state.availableVariations, contains('bodyweight'));
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

    test('ToggleVariation calculates exclusions for multiple selections', () async {
      when(() => mockWorkoutRepository.getLastPerformance(any())).thenAnswer((_) async => null);
      
      bloc.add(SelectMovement(movement));
      await Future.delayed(Duration.zero);
      bloc.add(const ToggleVariation('bodyweight'));
      await Future.delayed(Duration.zero);
      bloc.add(const ToggleVariation('neutral-grip'));
      await Future.delayed(Duration.zero);

      expect(bloc.state.selectedVariations, contains('bodyweight'));
      expect(bloc.state.selectedVariations, contains('neutral-grip'));
      // bodyweight excludes: weighted, assisted
      // neutral-grip excludes: wide-grip, assisted
      // available remaining: bodyweight, neutral-grip (size 2)
      expect(bloc.state.availableVariations.length, 2);
      expect(bloc.state.availableVariations, contains('bodyweight'));
      expect(bloc.state.availableVariations, contains('neutral-grip'));
    });

    test('ToggleVariation handles conflicting selections gracefully', () async {
      when(() => mockWorkoutRepository.getLastPerformance(any())).thenAnswer((_) async => null);
      
      bloc.add(SelectMovement(movement));
      await Future.delayed(Duration.zero);
      bloc.add(const ToggleVariation('bodyweight'));
      await Future.delayed(Duration.zero);
      bloc.add(const ToggleVariation('weighted')); // They exclude each other
      await Future.delayed(Duration.zero);

      expect(bloc.state.selectedVariations.length, 2);
      // Since they exclude each other, neither bodyweight nor weighted should be available!
      // Actually, if selected, they explicitly exclude each other. So both will be removed from available.
      // neutral-grip and wide-grip are NOT excluded by bodyweight OR weighted? 
      // Wait: bodyweight excludes weighted/assisted. weighted excludes bodyweight/assisted.
      // So bodyweight, weighted, assisted are excluded.
      // What about neutral-grip? It excludes wide-grip, assisted. It doesn't exclude bodyweight/weighted.
      // So neutral-grip and wide-grip remain available!
      expect(bloc.state.availableVariations.length, 2);
      expect(bloc.state.availableVariations, contains('neutral-grip'));
      expect(bloc.state.availableVariations, contains('wide-grip'));
    });
  });
}
