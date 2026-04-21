import 'package:equatable/equatable.dart';
import '../../../data/models/movement.dart';
import '../../../data/models/muscle_group.dart';
import '../../../data/models/variation.dart';

enum ExerciseLogStep {
  muscleGroup(0),
  movement(1),
  variation(2),
  details(3);

  final int slideIndex;
  const ExerciseLogStep(this.slideIndex);
}

class LogExerciseState extends Equatable {
  final ExerciseLogStep currentStep;
  final List<MuscleGroup> muscleGroups;
  final MuscleGroup? selectedMuscleGroup;
  
  final String movementQuery;
  final List<Movement> movementSearchResults;
  final Movement? selectedMovement;
  final String? lastPerformanceHint;
  
  final List<Variation> selectedVariations;
  final List<Variation> availableVariations;
  
  final double weight;
  final int reps;
  final bool isSaving;
  final bool isSuccess;
  final bool painFelt;
  final int? editingLogId;

  const LogExerciseState({
    this.currentStep = ExerciseLogStep.muscleGroup,
    this.muscleGroups = const [],
    this.selectedMuscleGroup,
    this.movementQuery = '',
    this.movementSearchResults = const [],
    this.selectedMovement,
    this.lastPerformanceHint,
    this.selectedVariations = const [],
    this.availableVariations = const [],
    this.weight = 0.0,
    this.reps = 0,
    this.isSaving = false,
    this.isSuccess = false,
    this.painFelt = false,
    this.editingLogId,
  });

  LogExerciseState copyWith({
    ExerciseLogStep? currentStep,
    List<MuscleGroup>? muscleGroups,
    MuscleGroup? selectedMuscleGroup,
    String? movementQuery,
    List<Movement>? movementSearchResults,
    Movement? selectedMovement,
    String? lastPerformanceHint,
    List<Variation>? selectedVariations,
    List<Variation>? availableVariations,
    double? weight,
    int? reps,
    bool? isSaving,
    bool? isSuccess,
    bool? painFelt,
    int? editingLogId,
  }) {
    // Note: To clear selected fields, we'd need a more complex copyWith or just handle it in the BLoC.
    // For now, simple copyWith is usually enough if we pass null explicitly for nullable fields.
    return LogExerciseState(
      currentStep: currentStep ?? this.currentStep,
      muscleGroups: muscleGroups ?? this.muscleGroups,
      selectedMuscleGroup: selectedMuscleGroup ?? this.selectedMuscleGroup,
      movementQuery: movementQuery ?? this.movementQuery,
      movementSearchResults: movementSearchResults ?? this.movementSearchResults,
      selectedMovement: selectedMovement ?? this.selectedMovement,
      lastPerformanceHint: lastPerformanceHint ?? this.lastPerformanceHint,
      selectedVariations: selectedVariations ?? this.selectedVariations,
      availableVariations: availableVariations ?? this.availableVariations,
      weight: weight ?? this.weight,
      reps: reps ?? this.reps,
      isSaving: isSaving ?? this.isSaving,
      isSuccess: isSuccess ?? this.isSuccess,
      painFelt: painFelt ?? this.painFelt,
      editingLogId: editingLogId ?? this.editingLogId,
    );
  }

  // Helper to clear forward state when a previous step change occurs
  LogExerciseState clearFrom(ExerciseLogStep step) {
    switch (step) {
      case ExerciseLogStep.muscleGroup:
        return copyWith(
          selectedMuscleGroup: null,
          selectedMovement: null,
          selectedVariations: [],
          availableVariations: [],
          movementSearchResults: [],
        );
      case ExerciseLogStep.movement:
        return copyWith(
          selectedMovement: null,
          selectedVariations: [],
          availableVariations: [],
        );
      case ExerciseLogStep.variation:
        return copyWith(
          selectedVariations: [],
        );
      case ExerciseLogStep.details:
        return this;
    }
  }

  @override
  List<Object?> get props => [
        currentStep,
        muscleGroups,
        selectedMuscleGroup,
        movementQuery,
        movementSearchResults,
        selectedMovement,
        lastPerformanceHint,
        selectedVariations,
        availableVariations,
        weight,
        reps,
        isSaving,
        isSuccess,
        painFelt,
        editingLogId,
      ];
}
