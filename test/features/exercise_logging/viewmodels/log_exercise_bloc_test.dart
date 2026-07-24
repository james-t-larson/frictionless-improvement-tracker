import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:simple_gym_tracker/data/models/movement.dart';
import 'package:simple_gym_tracker/data/models/workout_log.dart';
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

    test('SelectMovement with preselectedVariations selects them and applies exclusions', () async {
      when(() => mockWorkoutRepository.getLastPerformance(any())).thenAnswer((_) async => null);

      bloc.add(SelectMovement(movement, preselectedVariations: const ['bodyweight']));
      await Future.delayed(Duration.zero);

      expect(bloc.state.currentStep, ExerciseLogStep.variation);
      expect(bloc.state.selectedVariations, ['bodyweight']);
      // bodyweight excludes weighted and assisted
      expect(bloc.state.availableVariations.length, 3);
      expect(bloc.state.availableVariations, isNot(contains('weighted')));
      expect(bloc.state.availableVariations, isNot(contains('assisted')));
    });

    test('SelectMovement ignores preselected keys the movement does not have', () async {
      when(() => mockWorkoutRepository.getLastPerformance(any())).thenAnswer((_) async => null);

      bloc.add(SelectMovement(movement, preselectedVariations: const ['nonexistent']));
      await Future.delayed(Duration.zero);

      expect(bloc.state.selectedVariations, isEmpty);
      expect(bloc.state.availableVariations.length, 5);
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

  group('LogExerciseBloc last-performance autofill', () {
    final movement = Movement(
      id: '1',
      name: 'Pull-Up',
      variations: {
        'bodyweight': ['weighted', 'assisted'],
        'weighted': ['bodyweight', 'assisted'],
        'assisted': ['bodyweight', 'weighted'],
      },
    );

    final noVariationMovement = Movement(id: '2', name: 'Plank', variations: const {});

    test('SelectMovement on a movement with no variations fetches by movement + selected variations and autofills weight', () async {
      when(() => mockWorkoutRepository.getLastPerformance(any(), variations: any(named: 'variations')))
          .thenAnswer((_) async => WorkoutLog(
                movementId: '2',
                weight: 45,
                reps: 10,
                timestamp: 0,
              ));

      bloc.add(SelectMovement(noVariationMovement));
      await Future.delayed(Duration.zero);

      expect(bloc.state.currentStep, ExerciseLogStep.details);
      expect(bloc.state.weight, 45);
      expect(bloc.state.lastPerformanceHint, 'Last time: 45.0 lbs x 10 reps');
      verify(() => mockWorkoutRepository.getLastPerformance('2', variations: const [])).called(1);
    });

    test('AdvanceFromVariations fetches with the finalized variation combo and autofills weight', () async {
      when(() => mockWorkoutRepository.getLastPerformance(any(), variations: any(named: 'variations')))
          .thenAnswer((invocation) async {
        final variations = invocation.namedArguments[#variations] as List<String>;
        if (variations.contains('weighted')) {
          return WorkoutLog(movementId: '1', weight: 25, reps: 5, timestamp: 0, variations: const ['weighted']);
        }
        return WorkoutLog(movementId: '1', weight: 0, reps: 12, timestamp: 0, variations: const ['bodyweight']);
      });

      bloc.add(SelectMovement(movement));
      await Future.delayed(Duration.zero);
      // Still on the variation slide — no fetch should have happened yet.
      expect(bloc.state.currentStep, ExerciseLogStep.variation);
      expect(bloc.state.lastPerformanceHint, isNull);

      bloc.add(const ToggleVariation('weighted'));
      await Future.delayed(Duration.zero);
      bloc.add(const AdvanceFromVariations());
      await Future.delayed(Duration.zero);

      expect(bloc.state.currentStep, ExerciseLogStep.details);
      expect(bloc.state.weight, 25);
      verify(() => mockWorkoutRepository.getLastPerformance('1', variations: const ['weighted'])).called(1);
    });

    test('does not overwrite the weight being edited with an unrelated last performance', () async {
      when(() => mockWorkoutRepository.getLastPerformance(any(), variations: any(named: 'variations')))
          .thenAnswer((_) async => WorkoutLog(movementId: '1', weight: 999, reps: 1, timestamp: 0));

      final editedLog = WorkoutLog(
        id: 7,
        movementId: '1',
        weight: 30,
        reps: 8,
        timestamp: 0,
        variations: const ['bodyweight'],
      );

      bloc.add(InitializeFlowForEdit(editedLog, movement: movement));
      await Future.delayed(Duration.zero);

      expect(bloc.state.currentStep, ExerciseLogStep.details);
      expect(bloc.state.editingLogId, 7);
      // Should keep the log's own weight, not the (unrelated) last-performance value.
      expect(bloc.state.weight, 30);
    });
  });
}
