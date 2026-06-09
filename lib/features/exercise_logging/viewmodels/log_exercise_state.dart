import 'package:equatable/equatable.dart';
import '../../../data/models/movement.dart';

enum ExerciseLogStep {
  movement(0),
  variation(1),
  details(2),
  customMovementName(3);

  final int slideIndex;
  const ExerciseLogStep(this.slideIndex);
}

class LogExerciseState extends Equatable {
  final ExerciseLogStep currentStep;
  final List<String> muscleGroups;
  final String? selectedMuscleGroup;
  
  final String movementQuery;
  final List<Movement> movementSearchResults;
  final Movement? selectedMovement;
  final String? lastPerformanceHint;
  
  final String variationQuery;
  final List<String> selectedVariations;
  final List<String> availableVariations;
  
  final double weight;
  final int reps;
  final bool isSaving;
  final bool isSuccess;
  final bool painFelt;
  final int? editingLogId;

  /// Section header shown above the suggestions list.
  /// 'TODAY\'S SPLIT' when today has logged lifts, 'MOST COMMON' otherwise.
  final String suggestionLabel;

  /// Muscle group IDs from today's lifts. Stored in state so the BLoC can
  /// restore the right suggestions when a search query is cleared.
  final Set<String> todaysMuscleGroupIds;

  const LogExerciseState({
    this.currentStep = ExerciseLogStep.movement,
    this.muscleGroups = const [],
    this.selectedMuscleGroup,
    this.movementQuery = '',
    this.movementSearchResults = const [],
    this.selectedMovement,
    this.lastPerformanceHint,
    this.variationQuery = '',
    this.selectedVariations = const [],
    this.availableVariations = const [],
    this.weight = 0.0,
    this.reps = 0,
    this.isSaving = false,
    this.isSuccess = false,
    this.painFelt = false,
    this.editingLogId,
    this.suggestionLabel = 'MOST COMMON',
    this.todaysMuscleGroupIds = const {},
  });

  LogExerciseState copyWith({
    ExerciseLogStep? currentStep,
    List<String>? muscleGroups,
    String? selectedMuscleGroup,
    String? movementQuery,
    List<Movement>? movementSearchResults,
    Movement? selectedMovement,
    String? lastPerformanceHint,
    String? variationQuery,
    List<String>? selectedVariations,
    List<String>? availableVariations,
    double? weight,
    int? reps,
    bool? isSaving,
    bool? isSuccess,
    bool? painFelt,
    int? editingLogId,
    String? suggestionLabel,
    Set<String>? todaysMuscleGroupIds,
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
      variationQuery: variationQuery ?? this.variationQuery,
      selectedVariations: selectedVariations ?? this.selectedVariations,
      availableVariations: availableVariations ?? this.availableVariations,
      weight: weight ?? this.weight,
      reps: reps ?? this.reps,
      isSaving: isSaving ?? this.isSaving,
      isSuccess: isSuccess ?? this.isSuccess,
      painFelt: painFelt ?? this.painFelt,
      editingLogId: editingLogId ?? this.editingLogId,
      suggestionLabel: suggestionLabel ?? this.suggestionLabel,
      todaysMuscleGroupIds: todaysMuscleGroupIds ?? this.todaysMuscleGroupIds,
    );
  }

  // Helper to clear forward state when a previous step change occurs
  LogExerciseState clearFrom(ExerciseLogStep step) {
    switch (step) {
      case ExerciseLogStep.movement:
        return copyWith(
          selectedMovement: null,
          selectedVariations: [],
          availableVariations: [],
        );
      case ExerciseLogStep.variation:
        return copyWith(
          selectedVariations: [],
          variationQuery: '',
        );
      case ExerciseLogStep.customMovementName:
        return copyWith(
          selectedMovement: null,
          selectedVariations: [],
          availableVariations: [],
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
        variationQuery,
        selectedVariations,
        availableVariations,
        weight,
        reps,
        isSaving,
        isSuccess,
        painFelt,
        editingLogId,
        suggestionLabel,
        todaysMuscleGroupIds,
      ];
}

