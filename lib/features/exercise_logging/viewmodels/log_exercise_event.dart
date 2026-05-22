import 'package:equatable/equatable.dart';
import '../../../data/models/movement.dart';
import '../../../data/models/workout_log.dart';

sealed class LogExerciseEvent extends Equatable {
  const LogExerciseEvent();

  @override
  List<Object?> get props => [];
}

class InitializeFlow extends LogExerciseEvent {
  final Set<String> todaysMuscleGroupIds;
  const InitializeFlow({this.todaysMuscleGroupIds = const {}});

  @override
  List<Object?> get props => [todaysMuscleGroupIds];
}

class MuscleGroupSelected extends LogExerciseEvent {
  final String group;
  const MuscleGroupSelected(this.group);

  @override
  List<Object?> get props => [group];
}

class SearchMovement extends LogExerciseEvent {
  final String query;
  const SearchMovement(this.query);

  @override
  List<Object?> get props => [query];
}

class SearchVariation extends LogExerciseEvent {
  final String query;
  const SearchVariation(this.query);

  @override
  List<Object?> get props => [query];
}

class SelectMovement extends LogExerciseEvent {
  final Movement movement;
  const SelectMovement(this.movement);

  @override
  List<Object?> get props => [movement];
}

class CreateAndSelectMovement extends LogExerciseEvent {
  final String name;
  const CreateAndSelectMovement(this.name);

  @override
  List<Object?> get props => [name];
}

class ToggleVariation extends LogExerciseEvent {
  final String variation;
  const ToggleVariation(this.variation);

  @override
  List<Object?> get props => [variation];
}

class CreateAndSelectVariation extends LogExerciseEvent {
  final String name;
  const CreateAndSelectVariation(this.name);

  @override
  List<Object?> get props => [name];
}

class AdvanceFromVariations extends LogExerciseEvent {
  const AdvanceFromVariations();
}

class UpdateMetrics extends LogExerciseEvent {
  final double weight;
  final int reps;
  const UpdateMetrics(this.weight, this.reps);

  @override
  List<Object?> get props => [weight, reps];
}

class TogglePain extends LogExerciseEvent {
  final bool painFelt;
  const TogglePain(this.painFelt);

  @override
  List<Object?> get props => [painFelt];
}

class SaveLog extends LogExerciseEvent {
  const SaveLog();
}

class PreviousStepRequested extends LogExerciseEvent {}

class ManualSlideChanged extends LogExerciseEvent {
  final int newIndex;
  const ManualSlideChanged(this.newIndex);

  @override
  List<Object?> get props => [newIndex];
}

class InitializeWithPreviousLog extends LogExerciseEvent {
  final Movement movement;
  final List<String> selectedVariations;

  const InitializeWithPreviousLog({
    required this.movement,
    required this.selectedVariations,
  });

  @override
  List<Object?> get props => [movement, selectedVariations];
}

class InitializeFlowForEdit extends LogExerciseEvent {
  final WorkoutLog log;
  final Movement? movement;
  const InitializeFlowForEdit(this.log, {this.movement});

  @override
  List<Object?> get props => [log, movement];
}
