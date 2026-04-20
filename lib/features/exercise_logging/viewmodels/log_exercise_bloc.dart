import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:uuid/uuid.dart';
import '../../../data/models/movement.dart';
import '../../../data/models/workout_log.dart';
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

class SelectEquipment extends LogExerciseEvent {
  final String equipment;
  const SelectEquipment(this.equipment);
  @override
  List<Object?> get props => [equipment];
}

class UpdateMetrics extends LogExerciseEvent {
  final double weight;
  final int reps;
  const UpdateMetrics(this.weight, this.reps);
  @override
  List<Object?> get props => [weight, reps];
}

class UpdatePain extends LogExerciseEvent {
  final bool hasPain;
  const UpdatePain(this.hasPain);
  @override
  List<Object?> get props => [hasPain];
}

class AdvanceSlide extends LogExerciseEvent {
  const AdvanceSlide();
}

class SaveLog extends LogExerciseEvent {
  const SaveLog();
}

class ReturnToPreviousSlide extends LogExerciseEvent {
  const ReturnToPreviousSlide();
}

// State
class LogExerciseState extends Equatable {
  final int currentSlideIndex;
  final String movementQuery;
  final List<Movement> movementSearchResults;
  final Movement? selectedMovement;
  final String? lastPerformanceHint;
  final String? selectedEquipment;
  final double weight;
  final int reps;
  final bool hasPain;
  final bool isSaving;
  final bool isSuccess;

  const LogExerciseState({
    this.currentSlideIndex = 0,
    this.movementQuery = '',
    this.movementSearchResults = const [],
    this.selectedMovement,
    this.lastPerformanceHint,
    this.selectedEquipment,
    this.weight = 0.0,
    this.reps = 0,
    this.hasPain = false,
    this.isSaving = false,
    this.isSuccess = false,
  });

  LogExerciseState copyWith({
    int? currentSlideIndex,
    String? movementQuery,
    List<Movement>? movementSearchResults,
    Movement? selectedMovement,
    String? lastPerformanceHint,
    String? selectedEquipment,
    double? weight,
    int? reps,
    bool? hasPain,
    bool? isSaving,
    bool? isSuccess,
  }) {
    return LogExerciseState(
      currentSlideIndex: currentSlideIndex ?? this.currentSlideIndex,
      movementQuery: movementQuery ?? this.movementQuery,
      movementSearchResults: movementSearchResults ?? this.movementSearchResults,
      selectedMovement: selectedMovement ?? this.selectedMovement,
      lastPerformanceHint: lastPerformanceHint ?? this.lastPerformanceHint,
      selectedEquipment: selectedEquipment ?? this.selectedEquipment,
      weight: weight ?? this.weight,
      reps: reps ?? this.reps,
      hasPain: hasPain ?? this.hasPain,
      isSaving: isSaving ?? this.isSaving,
      isSuccess: isSuccess ?? this.isSuccess,
    );
  }

  @override
  List<Object?> get props => [
        currentSlideIndex,
        movementQuery,
        movementSearchResults,
        selectedMovement,
        lastPerformanceHint,
        selectedEquipment,
        weight,
        reps,
        hasPain,
        isSaving,
        isSuccess,
      ];
}

// Bloc
class LogExerciseBloc extends Bloc<LogExerciseEvent, LogExerciseState> {
  final MovementRepository _movementRepository;
  final WorkoutRepository _workoutRepository;
  final _uuid = const Uuid();

  LogExerciseBloc(this._movementRepository, this._workoutRepository)
      : super(const LogExerciseState()) {
    on<InitializeFlow>(_onInitialize);
    on<SearchMovement>(_onSearchMovement);
    on<SelectMovement>(_onSelectMovement);
    on<CreateAndSelectMovement>(_onCreateAndSelectMovement);
    on<SelectEquipment>(_onSelectEquipment);
    on<UpdateMetrics>(_onUpdateMetrics);
    on<UpdatePain>(_onUpdatePain);
    on<AdvanceSlide>(_onAdvanceSlide);
    on<ReturnToPreviousSlide>(_onReturnToPreviousSlide);
    on<SaveLog>(_onSaveLog);
  }

  void _onInitialize(InitializeFlow event, Emitter<LogExerciseState> emit) {
    emit(const LogExerciseState());
  }

  void _onAdvanceSlide(AdvanceSlide event, Emitter<LogExerciseState> emit) {
    emit(state.copyWith(currentSlideIndex: state.currentSlideIndex + 1));
  }

  void _onReturnToPreviousSlide(ReturnToPreviousSlide event, Emitter<LogExerciseState> emit) {
    if (state.currentSlideIndex > 0) {
      emit(state.copyWith(currentSlideIndex: state.currentSlideIndex - 1));
    }
  }

  Future<void> _onSearchMovement(SearchMovement event, Emitter<LogExerciseState> emit) async {
    if (event.query.isEmpty) {
      emit(state.copyWith(movementQuery: '', movementSearchResults: []));
      return;
    }
    final results = await _movementRepository.searchMovements(event.query);
    emit(state.copyWith(movementQuery: event.query, movementSearchResults: results));
  }

  Future<void> _onSelectMovement(SelectMovement event, Emitter<LogExerciseState> emit) async {
    emit(state.copyWith(selectedMovement: event.movement, currentSlideIndex: 1));
    _fetchLastPerformance(event.movement.id, emit);
  }

  Future<void> _onCreateAndSelectMovement(CreateAndSelectMovement event, Emitter<LogExerciseState> emit) async {
    final movement = await _movementRepository.createMovement(event.name);
    emit(state.copyWith(selectedMovement: movement, currentSlideIndex: 1));
    _fetchLastPerformance(movement.id, emit);
  }

  Future<void> _fetchLastPerformance(String movementId, Emitter<LogExerciseState> emit) async {
    final last = await _workoutRepository.getLastPerformance(movementId);
    if (last != null) {
      emit(state.copyWith(
        lastPerformanceHint: "Last time: ${last.weight.toStringAsFixed(1)} lbs x ${last.reps} reps",
        // Pre-fill weight and reps for convenience? Spec doesn't explicitly say but shows it as hint.
        // I'll keep it as hint.
      ));
    } else {
      emit(state.copyWith(lastPerformanceHint: "First time doing this exercise!"));
    }
  }

  void _onSelectEquipment(SelectEquipment event, Emitter<LogExerciseState> emit) {
    emit(state.copyWith(selectedEquipment: event.equipment, currentSlideIndex: 2));
  }

  void _onUpdateMetrics(UpdateMetrics event, Emitter<LogExerciseState> emit) {
    emit(state.copyWith(weight: event.weight, reps: event.reps));
  }

  void _onUpdatePain(UpdatePain event, Emitter<LogExerciseState> emit) {
    emit(state.copyWith(hasPain: event.hasPain));
  }

  Future<void> _onSaveLog(SaveLog event, Emitter<LogExerciseState> emit) async {
    if (state.selectedMovement == null || state.selectedEquipment == null) return;

    emit(state.copyWith(isSaving: true));
    
    final log = WorkoutLog(
      id: _uuid.v4(),
      timestamp: DateTime.now().millisecondsSinceEpoch,
      movementId: state.selectedMovement!.id,
      equipment: state.selectedEquipment!,
      weight: state.weight,
      reps: state.reps,
      painFelt: state.hasPain,
    );

    await _workoutRepository.saveWorkoutLog(log);
    
    emit(state.copyWith(isSaving: false, isSuccess: true));
  }
}
