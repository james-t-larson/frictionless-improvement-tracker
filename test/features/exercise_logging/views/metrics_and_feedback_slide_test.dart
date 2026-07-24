import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:simple_gym_tracker/data/models/movement.dart';
import 'package:simple_gym_tracker/data/repositories/movement_repository.dart';
import 'package:simple_gym_tracker/data/repositories/workout_repository.dart';
import 'package:simple_gym_tracker/features/exercise_logging/viewmodels/log_exercise_bloc.dart';
import 'package:simple_gym_tracker/features/exercise_logging/views/carousel_slides.dart';

class MockMovementRepository extends Mock implements MovementRepository {}
class MockWorkoutRepository extends Mock implements WorkoutRepository {}

void main() {
  testWidgets('weight field (with steppers) matches reps field size, even with a 3-digit value', (tester) async {
    final movRepo = MockMovementRepository();
    final workoutRepo = MockWorkoutRepository();
    when(() => workoutRepo.getLastPerformance(any(), variations: any(named: 'variations')))
        .thenAnswer((_) async => null);

    final bloc = LogExerciseBloc(movRepo, workoutRepo);
    addTearDown(bloc.close);

    await tester.pumpWidget(
      MaterialApp(
        home: BlocProvider<LogExerciseBloc>.value(
          value: bloc,
          child: const Scaffold(
            body: Padding(
              padding: EdgeInsets.all(16),
              child: MetricsAndFeedbackSlide(),
            ),
          ),
        ),
      ),
    );

    bloc.add(SelectMovement(Movement(id: '1', name: 'Plank', variations: const {})));
    await tester.pumpAndSettle();
    expect(bloc.state.currentStep, ExerciseLogStep.details);

    final fields = find.byType(TextField);
    expect(fields, findsNWidgets(2));

    final weightFieldFinder = fields.first;
    final repsFieldFinder = fields.last;

    await tester.enterText(weightFieldFinder, '225.0');
    await tester.pump();

    // Compare the weight field's overall box (steppers + text field) against
    // the reps field, not the nested TextField alone — the inner TextField is
    // deliberately narrower to cede room to the +/- buttons.
    final weightBoxFinder = find.byKey(const ValueKey('steppedMetricFieldBox'));
    expect(weightBoxFinder, findsOneWidget);

    final weightBoxSize = tester.getSize(weightBoxFinder);
    final repsSize = tester.getSize(repsFieldFinder);

    expect(weightBoxSize.height, closeTo(repsSize.height, 0.5));
    expect(weightBoxSize.width, closeTo(repsSize.width, 0.5));

    // The step buttons must not visually overlap the typed text: assert the
    // '-' and '+' icon positions never intersect the weight TextField's own
    // rect (they're Row siblings now, so this should be true by construction).
    final minusIcon = find.byIcon(Icons.remove_rounded);
    final plusIcon = find.byIcon(Icons.add_rounded);
    expect(minusIcon, findsOneWidget);
    expect(plusIcon, findsOneWidget);

    final weightRect = tester.getRect(weightFieldFinder);
    final minusRect = tester.getRect(minusIcon);
    final plusRect = tester.getRect(plusIcon);

    expect(weightRect.overlaps(minusRect), isFalse, reason: 'minus button overlaps weight field bounds');
    expect(weightRect.overlaps(plusRect), isFalse, reason: 'plus button overlaps weight field bounds');
  });
}
