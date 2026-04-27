import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../data/models/workout_log.dart';
import '../../../data/models/variation.dart';
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
    on<CreateAndSelectMovement>(_onCreateAndSelectMovement);
    on<ToggleVariation>(_onToggleVariation);
    on<CreateAndSelectVariation>(_onCreateAndSelectVariation);
    on<AdvanceFromVariations>(_onAdvanceFromVariations);
    on<UpdateMetrics>(_onUpdateMetrics);
    on<TogglePain>(_onTogglePain);
    on<SaveLog>(_onSaveLog);
    on<PreviousStepRequested>(_onPreviousStepRequested);
    on<ManualSlideChanged>(_onManualSlideChanged);
    on<InitializeWithPreviousLog>(_onInitializeWithPreviousLog);
    on<InitializeFlowForEdit>(_onInitializeFlowForEdit);
  }

  Future<void> _onInitialize(
    InitializeFlow event,
    Emitter<LogExerciseState> emit,
  ) async {
    emit(const LogExerciseState());
    
    // Pre-fetch top movements
    final topMovements = await _movementRepository.getTopMovements();
    emit(state.copyWith(
      movementSearchResults: topMovements,
      currentStep: ExerciseLogStep.movement,
    ));
  }

  Future<void> _onMuscleGroupSelected(
    MuscleGroupSelected event,
    Emitter<LogExerciseState> emit,
  ) async {
    final movements = await _movementRepository.getMovementsByMuscleGroup(event.group.id!);
    emit(state.copyWith(
      selectedMuscleGroup: event.group,
      movementSearchResults: movements,
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

    List<Variation> variations = await _movementRepository.getVariationsForMovement(movement.id!);
    if (variations.isEmpty) {
      variations = await _movementRepository.getAllVariations();
    }

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
    
    _fetchLastPerformance(movement.id!, emit);
  }

  Future<void> _onInitializeWithPreviousLog(
    InitializeWithPreviousLog event,
    Emitter<LogExerciseState> emit,
  ) async {
    emit(const LogExerciseState());
    
    List<Variation> variations = [];
    if (event.movement.id != null) {
      variations = await _movementRepository.getVariationsForMovement(event.movement.id!);
      if (variations.isEmpty) {
        variations = await _movementRepository.getAllVariations();
      }
    }

    emit(state.copyWith(
      selectedMovement: event.movement,
      selectedVariations: event.selectedVariations,
      availableVariations: variations,
      currentStep: ExerciseLogStep.details, // Go straight to metrics
    ));

    if (event.movement.id != null) {
      _fetchLastPerformance(event.movement.id!, emit);
    }
  }

  void _onPreviousStepRequested(
    PreviousStepRequested event,
    Emitter<LogExerciseState> emit,
  ) {
    switch (state.currentStep) {
      case ExerciseLogStep.details:
        emit(state.copyWith(currentStep: ExerciseLogStep.variation));
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

  Future<void> _onSearchMovement(
    SearchMovement event,
    Emitter<LogExerciseState> emit,
  ) async {
    if (event.query.isEmpty) {
      // If we have a selected muscle group, show those movements again
      if (state.selectedMuscleGroup != null) {
        final movements = await _movementRepository.getMovementsByMuscleGroup(state.selectedMuscleGroup!.id!);
        emit(state.copyWith(movementQuery: '', movementSearchResults: movements));
      } else {
        final common = await _movementRepository.getTopMovements();
        emit(state.copyWith(movementQuery: '', movementSearchResults: common));
      }
      return;
    }
    final results = await _movementRepository.searchMovements(event.query);
    emit(
      state.copyWith(
        movementQuery: event.query,
        movementSearchResults: results,
      ),
    );
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
    List<Variation> variations = [];
    if (event.movement.id != null) {
      variations = await _movementRepository.getVariationsForMovement(event.movement.id!);
      if (variations.isEmpty) {
        variations = await _movementRepository.getAllVariations();
      }
    }
    
    emit(
      state.copyWith(
        selectedMovement: event.movement, 
        currentStep: ExerciseLogStep.variation,
        availableVariations: variations,
      ),
    );
    if (event.movement.id != null) {
      _fetchLastPerformance(event.movement.id!, emit);
    }
  }

  Future<void> _onCreateAndSelectMovement(
    CreateAndSelectMovement event,
    Emitter<LogExerciseState> emit,
  ) async {
    final movement = await _movementRepository.createMovement(event.name);
    List<Variation> variations = await _movementRepository.getAllVariations();

    emit(state.copyWith(
      selectedMovement: movement, 
      currentStep: ExerciseLogStep.variation,
      availableVariations: variations,
    ));
    if (movement.id != null) {
      _fetchLastPerformance(movement.id!, emit);
    }
  }

  Future<void> _fetchLastPerformance(
    int movementId,
    Emitter<LogExerciseState> emit,
  ) async {
    final last = await _workoutRepository.getLastPerformance(movementId);
    if (last != null) {
      emit(
        state.copyWith(
          lastPerformanceHint:
              "Last time: ${last.weight.toStringAsFixed(1)} lbs x ${last.reps} reps",
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
    final updated = List<Variation>.from(state.selectedVariations);
    int index = updated.indexWhere(
      (v) => v.id == event.variation.id && v.name == event.variation.name,
    );
    if (index >= 0) {
      updated.removeAt(index);
    } else {
      updated.add(event.variation);
    }
    emit(state.copyWith(selectedVariations: updated));
  }

  Future<void> _onCreateAndSelectVariation(
    CreateAndSelectVariation event,
    Emitter<LogExerciseState> emit,
  ) async {
    if (state.selectedMovement == null || state.selectedMovement!.id == null) return;

    final variation = await _movementRepository.createVariationForMovement(
      state.selectedMovement!.id!,
      event.name,
    );

    // Append to existing available variations to avoid losing other global variations
    // if this is a newly created movement
    final updatedAvailable = List<Variation>.from(state.availableVariations);
    if (!updatedAvailable.any((v) => v.id == variation.id)) {
      updatedAvailable.add(variation);
    }

    // Update state: add to available and auto-select it
    final updatedSelected = List<Variation>.from(state.selectedVariations)..add(variation);

    emit(state.copyWith(
      availableVariations: updatedAvailable,
      selectedVariations: updatedSelected,
    ));
  }

  void _onAdvanceFromVariations(
    AdvanceFromVariations event,
    Emitter<LogExerciseState> emit,
  ) {
    emit(state.copyWith(currentStep: ExerciseLogStep.details));
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

    final log = WorkoutLog(
      id: state.editingLogId,
      timestamp: DateTime.now().millisecondsSinceEpoch,
      movementId: state.selectedMovement!.id!,
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

    // Ensure selected variations are linked to the movement for future use
    await _movementRepository.syncVariationsToMovement(
      state.selectedMovement!.id!,
      state.selectedVariations,
    );

    emit(state.copyWith(isSaving: false, isSuccess: true));
  }
}
