import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/models/workout_log.dart';
import '../../../data/models/movement.dart';
import '../../../data/models/movement_search_result.dart';
import '../../../data/repositories/movement_repository.dart';
import '../../../data/repositories/workout_repository.dart';
import 'log_exercise_event.dart';
import 'log_exercise_state.dart';

export 'log_exercise_event.dart';
export 'log_exercise_state.dart';

class LogExerciseBloc extends Bloc<LogExerciseEvent, LogExerciseState> {
  final MovementRepository _movementRepository;
  final WorkoutRepository _workoutRepository;

  LogExerciseBloc(this._movementRepository, this._workoutRepository)
    : super(const LogExerciseState()) {
    on<InitializeFlow>(_onInitialize);
    on<MuscleGroupSelected>(_onMuscleGroupSelected);
    on<SearchMovement>(_onSearchMovement);
    on<SearchVariation>(_onSearchVariation);
    on<SelectMovement>(_onSelectMovement);
    on<ToggleVariation>(_onToggleVariation);
    on<AdvanceFromVariations>(_onAdvanceFromVariations);
    on<UpdateMetrics>(_onUpdateMetrics);
    on<TogglePain>(_onTogglePain);
    on<SaveLog>(_onSaveLog);
    on<PreviousStepRequested>(_onPreviousStepRequested);
    on<ManualSlideChanged>(_onManualSlideChanged);
    on<InitializeWithPreviousLog>(_onInitializeWithPreviousLog);
    on<InitializeFlowForEdit>(_onInitializeFlowForEdit);
    on<AddCustomMovement>(_onAddCustomMovement);
    on<AddCustomVariation>(_onAddCustomVariation);
    on<BeginAddCustomMovement>(_onBeginAddCustomMovement);
    on<ToggleMovementFilters>(_onToggleFilters);
  }

  Future<void> _onInitialize(
    InitializeFlow event,
    Emitter<LogExerciseState> emit,
  ) async {
    emit(const LogExerciseState());
    
    final ids = event.todaysMuscleGroupIds;
    final suggested = await _movementRepository.getSuggestedMovements(ids);
    final label = ids.isNotEmpty ? 'TODAY\'S SPLIT' : 'MOST COMMON';
    final availableMuscleGroups = await _movementRepository.getMuscleGroups();

    emit(state.copyWith(
      movementSearchResults: _asSearchResults(suggested),
      currentStep: ExerciseLogStep.movement,
      suggestionLabel: label,
      todaysMuscleGroupIds: ids,
      availableMuscleGroups: availableMuscleGroups,
    ));
  }

  Future<void> _onMuscleGroupSelected(
    MuscleGroupSelected event,
    Emitter<LogExerciseState> emit,
  ) async {
    final movements = await _movementRepository.getMovementsByMuscleGroupName(event.group);
    emit(state.copyWith(
      selectedMuscleGroup: event.group,
      movementSearchResults: _asSearchResults(movements),
      currentStep: ExerciseLogStep.movement,
      // Clear forward progress
      selectedMovement: null,
      selectedVariations: [],
      availableVariations: [],
      lastPerformanceHint: null,
    ));
  }

  Future<void> _onInitializeFlowForEdit(
    InitializeFlowForEdit event,
    Emitter<LogExerciseState> emit,
  ) async {
    final movement = event.movement ?? await _movementRepository.getMovementById(event.log.movementId);
    if (movement == null) return;

    List<String> variations = _getAvailableVariations(movement, event.log.variations);

    emit(state.copyWith(
      editingLogId: event.log.id,
      selectedMovement: movement,
      selectedVariations: event.log.variations,
      availableVariations: variations,
      weight: event.log.weight,
      reps: event.log.reps,
      painFelt: event.log.painFelt,
      currentStep: ExerciseLogStep.details, // Go straight to metrics
    ));

    await _fetchLastPerformance(movement.id!, emit, variations: event.log.variations);
  }

  Future<void> _onInitializeWithPreviousLog(
    InitializeWithPreviousLog event,
    Emitter<LogExerciseState> emit,
  ) async {
    emit(const LogExerciseState());
    
    List<String> variations = [];
    if (event.movement.id != null) {
      variations = _getAvailableVariations(event.movement, event.selectedVariations);
    }

    emit(state.copyWith(
      selectedMovement: event.movement,
      selectedVariations: event.selectedVariations,
      availableVariations: variations,
      currentStep: ExerciseLogStep.details, // Go straight to metrics
    ));

    if (event.movement.id != null) {
      await _fetchLastPerformance(event.movement.id!, emit, variations: event.selectedVariations);
    }
  }

  void _onPreviousStepRequested(
    PreviousStepRequested event,
    Emitter<LogExerciseState> emit,
  ) {
    switch (state.currentStep) {
      case ExerciseLogStep.customMovementName:
        emit(state.copyWith(currentStep: ExerciseLogStep.movement));
        break;
      case ExerciseLogStep.details:
        if (state.selectedMovement?.variations.isEmpty ?? true) {
          emit(state.copyWith(currentStep: ExerciseLogStep.movement));
        } else {
          emit(state.copyWith(currentStep: ExerciseLogStep.variation));
        }
        break;
      case ExerciseLogStep.variation:
        emit(state.copyWith(currentStep: ExerciseLogStep.movement));
        break;
      case ExerciseLogStep.movement:
        // Already at start
        break;
    }
  }

  void _onManualSlideChanged(
    ManualSlideChanged event,
    Emitter<LogExerciseState> emit,
  ) {
    final newStep = ExerciseLogStep.values.firstWhere(
      (e) => e.slideIndex == event.newIndex,
      orElse: () => state.currentStep,
    );
    emit(state.copyWith(currentStep: newStep));
  }

  List<MovementSearchResult> _asSearchResults(List<Movement> movements) {
    return movements.map((m) => MovementSearchResult(m)).toList();
  }

  List<MovementSearchResult> _applyMovementFilters(List<MovementSearchResult> results, Set<String> filters) {
    if (filters.isEmpty) return results;
    return results.where((r) {
      return r.movement.muscleGroups.any((mg) => filters.contains(mg));
    }).toList();
  }

  Future<List<MovementSearchResult>> _fetchResults(String query) async {
    if (query.isEmpty) {
      if (state.selectedMuscleGroup != null) {
        return _asSearchResults(await _movementRepository.getMovementsByMuscleGroupName(state.selectedMuscleGroup!));
      }
      return _asSearchResults(await _movementRepository.getSuggestedMovements(state.todaysMuscleGroupIds));
    }
    return _movementRepository.searchMovements(query);
  }

  Future<void> _onSearchMovement(
    SearchMovement event,
    Emitter<LogExerciseState> emit,
  ) async {
    final results = _applyMovementFilters(await _fetchResults(event.query), state.selectedMovementFilters);

    emit(
      state.copyWith(
        movementQuery: event.query,
        movementSearchResults: results,
      ),
    );
  }

  Future<void> _onToggleFilters(
    ToggleMovementFilters event,
    Emitter<LogExerciseState> emit,
  ) async {
    final results = _applyMovementFilters(await _fetchResults(state.movementQuery), event.filters);

    emit(state.copyWith(
      selectedMovementFilters: event.filters,
      movementSearchResults: results,
    ));
  }

  void _onSearchVariation(
    SearchVariation event,
    Emitter<LogExerciseState> emit,
  ) {
    emit(state.copyWith(variationQuery: event.query));
  }

  Future<void> _onSelectMovement(
    SelectMovement event,
    Emitter<LogExerciseState> emit,
  ) async {
    final preselected = event.preselectedVariations
        .where(event.movement.variations.containsKey)
        .toList();

    List<String> variations = [];
    if (event.movement.id != null) {
      variations = _getAvailableVariations(event.movement, preselected);
    }

    final nextStep = variations.isEmpty ? ExerciseLogStep.details : ExerciseLogStep.variation;

    emit(
      state.copyWith(
        selectedMovement: event.movement,
        currentStep: nextStep,
        availableVariations: variations,
        selectedVariations: preselected,
      ),
    );
    // Only fetch now if we're landing on the metrics slide directly (no variation
    // step to go through first). Otherwise, AdvanceFromVariations fetches once the
    // variation selection is finalized, so the hint/autofill match the exact combo.
    if (event.movement.id != null && nextStep == ExerciseLogStep.details) {
      await _fetchLastPerformance(event.movement.id!, emit, variations: preselected);
    }
  }



  Future<void> _fetchLastPerformance(
    String movementId,
    Emitter<LogExerciseState> emit, {
    List<String> variations = const [],
  }) async {
    final last = await _workoutRepository.getLastPerformance(movementId, variations: variations);
    if (last != null) {
      // Autofill the weight with what was last lifted for this exact movement +
      // variation combo, but only for a fresh log entry — never clobber a value
      // the user already typed, or the weight being edited on an existing log.
      final shouldAutofillWeight = state.editingLogId == null && state.weight == 0;
      emit(
        state.copyWith(
          lastPerformanceHint:
              "Last time: ${last.weight.toStringAsFixed(1)} lbs x ${last.reps} reps",
          weight: shouldAutofillWeight ? last.weight : null,
        ),
      );
    } else {
      emit(
        state.copyWith(lastPerformanceHint: "First time doing this exercise!"),
      );
    }
  }

  void _onToggleVariation(
    ToggleVariation event,
    Emitter<LogExerciseState> emit,
  ) {
    if (state.selectedMovement == null) return;
    
    final updated = List<String>.from(state.selectedVariations);
    if (updated.contains(event.variation)) {
      updated.remove(event.variation);
    } else {
      updated.add(event.variation);
    }
    
    final available = _getAvailableVariations(state.selectedMovement!, updated);
    
    emit(state.copyWith(
      selectedVariations: updated,
      availableVariations: available,
    ));
  }

  List<String> _getAvailableVariations(Movement movement, List<String> selectedVariations) {
    if (selectedVariations.isEmpty) {
      return movement.variations.keys.toList();
    }
    
    Set<String> available = movement.variations.keys.toSet();
    
    for (final availableVariation in movement.variations.keys) {
      final excludedByThis = movement.variations[availableVariation] ?? <String>[];
      if (excludedByThis.any((e) => selectedVariations.contains(e))) {
        available.remove(availableVariation);
      }
    }

    for (final v in selectedVariations) {
      final excluded = movement.variations[v] ?? <String>[];
      available.removeAll(excluded);
    }
    
    return available.toList();
  }

  Future<void> _onAdvanceFromVariations(
    AdvanceFromVariations event,
    Emitter<LogExerciseState> emit,
  ) async {
    emit(state.copyWith(currentStep: ExerciseLogStep.details));

    final movementId = state.selectedMovement?.id;
    if (movementId != null) {
      await _fetchLastPerformance(movementId, emit, variations: state.selectedVariations);
    }
  }

  void _onUpdateMetrics(UpdateMetrics event, Emitter<LogExerciseState> emit) {
    emit(state.copyWith(weight: event.weight, reps: event.reps));
  }

  void _onTogglePain(TogglePain event, Emitter<LogExerciseState> emit) {
    emit(state.copyWith(painFelt: event.painFelt));
  }

  Future<void> _onSaveLog(SaveLog event, Emitter<LogExerciseState> emit) async {
    if (state.selectedMovement == null || state.selectedMovement!.id == null) {
      return;
    }

    emit(state.copyWith(isSaving: true));

    final movement = state.selectedMovement!;
    final log = WorkoutLog(
      id: state.editingLogId,
      timestamp: DateTime.now().millisecondsSinceEpoch,
      movementId: movement.id!,
      movementName: movement.resolveNamedVariation(state.selectedVariations)?.name ?? movement.name,
      muscleGroupName: state.selectedMovement!.muscleGroups.isNotEmpty 
          ? state.selectedMovement!.muscleGroups.first 
          : null,
      variations: state.selectedVariations,
      weight: state.weight,
      reps: state.reps,
      painFelt: state.painFelt,
    );

    if (state.editingLogId != null) {
      await _workoutRepository.updateWorkoutLog(log);
    } else {
      await _workoutRepository.saveWorkoutLog(log);
    }

    emit(state.copyWith(isSaving: false, isSuccess: true));
  }

  Future<void> _onAddCustomMovement(
    AddCustomMovement event,
    Emitter<LogExerciseState> emit,
  ) async {
    final customId = 'custom_${DateTime.now().millisecondsSinceEpoch}';
    final movement = Movement(
      id: customId,
      name: event.name,
      muscleGroups: state.selectedMuscleGroup != null ? [state.selectedMuscleGroup!] : [],
      primaryMuscles: state.selectedMuscleGroup != null ? [state.selectedMuscleGroup!] : [],
      variations: const {},
    );
    await _movementRepository.saveMovement(movement);
    
    emit(state.copyWith(
      selectedMovement: movement,
      currentStep: ExerciseLogStep.details,
      availableVariations: const [],
      selectedVariations: const [],
      movementQuery: '',
    ));
  }

  void _onBeginAddCustomMovement(
    BeginAddCustomMovement event,
    Emitter<LogExerciseState> emit,
  ) {
    emit(state.copyWith(
      currentStep: ExerciseLogStep.customMovementName,
      movementQuery: event.initialName,
    ));
  }

  Future<void> _onAddCustomVariation(
    AddCustomVariation event,
    Emitter<LogExerciseState> emit,
  ) async {
    if (state.selectedMovement == null || state.selectedMovement!.id == null) return;

    final updatedVariations = Map<String, List<String>>.from(state.selectedMovement!.variations);
    updatedVariations[event.name] = const []; // No exclusions for custom variations

    final updatedMovement = state.selectedMovement!.copyWith(variations: updatedVariations);
    await _movementRepository.saveMovement(updatedMovement);

    final newSelected = List<String>.from(state.selectedVariations)..add(event.name);
    final newAvailable = _getAvailableVariations(updatedMovement, newSelected);

    emit(state.copyWith(
      selectedMovement: updatedMovement,
      selectedVariations: newSelected,
      availableVariations: newAvailable,
      variationQuery: '',
    ));
  }
}

