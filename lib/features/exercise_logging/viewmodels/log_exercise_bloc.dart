import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import '../../../data/models/movement.dart';
import '../../../data/models/workout_log.dart';
import '../../../data/models/variation.dart';
import '../../../data/repositories/movement_repository.dart';
import '../../../data/repositories/workout_repository.dart';

// Events
abstract class LogExerciseEvent extends Equatable {
  const LogExerciseEvent();
  @override
  List<Object?> get props => [];
}

class InitializeFlow extends LogExerciseEvent {
  const InitializeFlow();
}

class SearchMovement extends LogExerciseEvent {
  final String query;
  const SearchMovement(this.query);
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
  final Variation variation;
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

class AdvanceSlide extends LogExerciseEvent {
  const AdvanceSlide();
}

class SaveLog extends LogExerciseEvent {
  const SaveLog();
}

class TogglePain extends LogExerciseEvent {
  final bool painFelt;
  const TogglePain(this.painFelt);
  @override
  List<Object?> get props => [painFelt];
}

class ReturnToPreviousSlide extends LogExerciseEvent {
  const ReturnToPreviousSlide();
}

class InitializeWithPreviousLog extends LogExerciseEvent {
  final Movement movement;
  final List<Variation> selectedVariations;

  const InitializeWithPreviousLog({
    required this.movement,
    required this.selectedVariations,
  });

  @override
  List<Object?> get props => [movement, selectedVariations];
}

// State
class LogExerciseState extends Equatable {
  final int currentSlideIndex;
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

  const LogExerciseState({
    this.currentSlideIndex = 0,
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
  });

  LogExerciseState copyWith({
    int? currentSlideIndex,
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
  }) {
    return LogExerciseState(
      currentSlideIndex: currentSlideIndex ?? this.currentSlideIndex,
      movementQuery: movementQuery ?? this.movementQuery,
      movementSearchResults:
          movementSearchResults ?? this.movementSearchResults,
      selectedMovement: selectedMovement ?? this.selectedMovement,
      lastPerformanceHint: lastPerformanceHint ?? this.lastPerformanceHint,
      selectedVariations: selectedVariations ?? this.selectedVariations,
      availableVariations: availableVariations ?? this.availableVariations,
      weight: weight ?? this.weight,
      reps: reps ?? this.reps,
      isSaving: isSaving ?? this.isSaving,
      isSuccess: isSuccess ?? this.isSuccess,
      painFelt: painFelt ?? this.painFelt,
    );
  }

  @override
  List<Object?> get props => [
    currentSlideIndex,
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
  ];
}

// Bloc
class LogExerciseBloc extends Bloc<LogExerciseEvent, LogExerciseState> {
  final MovementRepository _movementRepository;
  final WorkoutRepository _workoutRepository;

  LogExerciseBloc(this._movementRepository, this._workoutRepository)
    : super(const LogExerciseState()) {
    on<InitializeFlow>(_onInitialize);
    on<SearchMovement>(_onSearchMovement);
    on<SelectMovement>(_onSelectMovement);
    on<CreateAndSelectMovement>(_onCreateAndSelectMovement);
    on<ToggleVariation>(_onToggleVariation);
    on<CreateAndSelectVariation>(_onCreateAndSelectVariation);
    on<AdvanceFromVariations>(_onAdvanceFromVariations);
    on<UpdateMetrics>(_onUpdateMetrics);
    on<AdvanceSlide>(_onAdvanceSlide);
    on<ReturnToPreviousSlide>(_onReturnToPreviousSlide);
    on<TogglePain>(_onTogglePain);
    on<SaveLog>(_onSaveLog);
    on<InitializeWithPreviousLog>(_onInitializeWithPreviousLog);
  }

  Future<void> _onInitialize(
    InitializeFlow event,
    Emitter<LogExerciseState> emit,
  ) async {
    emit(const LogExerciseState());
    final common = await _movementRepository.getTopMovements();
    emit(state.copyWith(movementSearchResults: common));
  }

  Future<void> _onInitializeWithPreviousLog(
    InitializeWithPreviousLog event,
    Emitter<LogExerciseState> emit,
  ) async {
    emit(const LogExerciseState());
    
    List<Variation> variations = [];
    if (event.movement.id != null) {
      variations = await _movementRepository.getVariationsForMovement(event.movement.id!);
    }

    emit(state.copyWith(
      selectedMovement: event.movement,
      selectedVariations: event.selectedVariations,
      availableVariations: variations,
      currentSlideIndex: 2, // Go straight to metrics
    ));

    if (event.movement.id != null) {
      _fetchLastPerformance(event.movement.id!, emit);
    }
  }

  void _onAdvanceSlide(AdvanceSlide event, Emitter<LogExerciseState> emit) {
    emit(state.copyWith(currentSlideIndex: state.currentSlideIndex + 1));
  }

  void _onReturnToPreviousSlide(
    ReturnToPreviousSlide event,
    Emitter<LogExerciseState> emit,
  ) {
    if (state.currentSlideIndex > 0) {
      emit(state.copyWith(currentSlideIndex: state.currentSlideIndex - 1));
    }
  }

  Future<void> _onSearchMovement(
    SearchMovement event,
    Emitter<LogExerciseState> emit,
  ) async {
    if (event.query.isEmpty) {
      final common = await _movementRepository.getTopMovements();
      emit(state.copyWith(movementQuery: '', movementSearchResults: common));
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

  Future<void> _onSelectMovement(
    SelectMovement event,
    Emitter<LogExerciseState> emit,
  ) async {
    List<Variation> variations = [];
    if (event.movement.id != null) {
      variations = await _movementRepository.getVariationsForMovement(event.movement.id!);
    }
    
    emit(
      state.copyWith(
        selectedMovement: event.movement, 
        currentSlideIndex: 1,
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
    List<Variation> variations = [];
    if (movement.id != null) {
      variations = await _movementRepository.getVariationsForMovement(movement.id!);
    }

    emit(state.copyWith(
      selectedMovement: movement, 
      currentSlideIndex: 1,
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

    // Refresh available variations
    final variations = await _movementRepository.getVariationsForMovement(
      state.selectedMovement!.id!,
    );

    // Update state: add to available and auto-select it
    final updatedSelected = List<Variation>.from(state.selectedVariations)..add(variation);

    emit(state.copyWith(
      availableVariations: variations,
      selectedVariations: updatedSelected,
    ));
  }

  void _onAdvanceFromVariations(
    AdvanceFromVariations event,
    Emitter<LogExerciseState> emit,
  ) {
    emit(state.copyWith(currentSlideIndex: 2));
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
      timestamp: DateTime.now().millisecondsSinceEpoch,
      movementId: state.selectedMovement!.id!,
      variations: state.selectedVariations,
      weight: state.weight,
      reps: state.reps,
      painFelt: state.painFelt,
    );

    await _workoutRepository.saveWorkoutLog(log);

    emit(state.copyWith(isSaving: false, isSuccess: true));
  }
}
