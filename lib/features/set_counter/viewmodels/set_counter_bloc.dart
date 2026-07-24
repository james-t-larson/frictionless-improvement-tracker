import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../data/repositories/workout_repository.dart';
import 'set_counter_event.dart';
import 'set_counter_state.dart';

class SetCounterBloc extends Bloc<SetCounterEvent, SetCounterState> {
  final WorkoutRepository _workoutRepository;

  SetCounterBloc({required WorkoutRepository workoutRepository})
      : _workoutRepository = workoutRepository,
        super(SetCounterInitial()) {
    on<LoadSetCounterData>(_onLoadSetCounterData);
  }

  Future<void> _onLoadSetCounterData(
      LoadSetCounterData event, Emitter<SetCounterState> emit) async {
    emit(SetCounterLoading());
    try {
      final counts = await _workoutRepository.getSetCountsByPrimaryMuscleGroupLast7Days();
      final muscleCounts = await _workoutRepository.getSetCountsByMuscleLast7Days();
      emit(SetCounterLoaded(setCounts: counts, muscleCounts: muscleCounts));
    } catch (e) {
      emit(SetCounterError('Failed to load set counts: $e'));
    }
  }
}
