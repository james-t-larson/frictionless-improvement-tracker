import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../data/repositories/workout_repository.dart';
import 'one_rep_max_event.dart';
import 'one_rep_max_state.dart';

class OneRepMaxBloc extends Bloc<OneRepMaxEvent, OneRepMaxState> {
  final WorkoutRepository _workoutRepository;

  OneRepMaxBloc({required WorkoutRepository workoutRepository})
      : _workoutRepository = workoutRepository,
        super(OneRepMaxInitial()) {
    on<LoadOneRepMaxData>(_onLoadOneRepMaxData);
  }

  Future<void> _onLoadOneRepMaxData(
      LoadOneRepMaxData event, Emitter<OneRepMaxState> emit) async {
    emit(OneRepMaxLoading());
    try {
      final logs = await _workoutRepository.getLatestBarbellBigThree();
      emit(OneRepMaxLoaded(latestLogs: logs));
    } catch (e) {
      emit(OneRepMaxError('Failed to load 1RM data: $e'));
    }
  }
}
