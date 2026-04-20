import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import '../../../data/models/workout_log.dart';
import '../../../data/repositories/workout_repository.dart';
import '../../../core/utils/date_formatters.dart';

// Events
abstract class DashboardEvent extends Equatable {
  const DashboardEvent();
  @override
  List<Object?> get props => [];
}

class LoadDashboardLogs extends DashboardEvent {
  const LoadDashboardLogs();
}

class SearchDashboardLogs extends DashboardEvent {
  final String query;
  const SearchDashboardLogs(this.query);
  @override
  List<Object?> get props => [query];
}

class DashboardWorkoutDeleted extends DashboardEvent {
  final int logId;
  const DashboardWorkoutDeleted(this.logId);
  @override
  List<Object?> get props => [logId];
}

class DashboardWorkoutUpdated extends DashboardEvent {
  final WorkoutLog updatedLog;
  const DashboardWorkoutUpdated(this.updatedLog);
  @override
  List<Object?> get props => [updatedLog];
}

// States
abstract class DashboardState extends Equatable {
  @override
  List<Object?> get props => [];
}

class DashboardLoading extends DashboardState {}
class DashboardLoaded extends DashboardState {
  final Map<String, List<WorkoutLog>> groupedLogs;
  final List<WorkoutLog> allLogs;
  final String query;

  DashboardLoaded(this.groupedLogs, this.allLogs, {this.query = ''});

  @override
  List<Object?> get props => [groupedLogs, allLogs, query];
}
class DashboardError extends DashboardState {}

// Bloc
class DashboardBloc extends Bloc<DashboardEvent, DashboardState> {
  final WorkoutRepository _repository;

  DashboardBloc(this._repository) : super(DashboardLoading()) {
    on<LoadDashboardLogs>(_onLoadLogs);
    on<SearchDashboardLogs>(_onSearchLogs);
    on<DashboardWorkoutDeleted>(_onWorkoutDeleted);
    on<DashboardWorkoutUpdated>(_onWorkoutUpdated);
  }

  Future<void> _onLoadLogs(LoadDashboardLogs event, Emitter<DashboardState> emit) async {
    emit(DashboardLoading());
    try {
      final logs = await _repository.getAllLogs();
      final grouped = _groupLogs(logs);
      emit(DashboardLoaded(grouped, logs));
    } catch (e) {
      emit(DashboardError());
    }
  }

  void _onSearchLogs(SearchDashboardLogs event, Emitter<DashboardState> emit) {
    if (state is DashboardLoaded) {
      final currentState = state as DashboardLoaded;
      final filtered = currentState.allLogs.where((log) {
        return log.movementName?.toLowerCase().contains(event.query.toLowerCase()) ?? false;
      }).toList();
      final grouped = _groupLogs(filtered);
      emit(DashboardLoaded(grouped, currentState.allLogs, query: event.query));
    }
  }

  Future<void> _onWorkoutDeleted(DashboardWorkoutDeleted event, Emitter<DashboardState> emit) async {
    try {
      await _repository.deleteWorkoutLog(event.logId);
      if (state is DashboardLoaded) {
        final currentState = state as DashboardLoaded;
        final updatedLogs = currentState.allLogs.where((log) => log.id != event.logId).toList();
        final filtered = updatedLogs.where((log) {
          return log.movementName?.toLowerCase().contains(currentState.query.toLowerCase()) ?? false;
        }).toList();
        final grouped = _groupLogs(filtered);
        emit(DashboardLoaded(grouped, updatedLogs, query: currentState.query));
      }
    } catch (e) {
      emit(DashboardError());
    }
  }

  Future<void> _onWorkoutUpdated(DashboardWorkoutUpdated event, Emitter<DashboardState> emit) async {
    try {
      await _repository.updateWorkoutLog(event.updatedLog);
      // Re-fetch all logs to be sure we have the latest state (including joined names if any changed, though they shouldn't)
      // Alternatively, we could update the list in memory. Re-fetching is safer.
      final logs = await _repository.getAllLogs();
      if (state is DashboardLoaded) {
        final currentState = state as DashboardLoaded;
        final filtered = logs.where((log) {
          return log.movementName?.toLowerCase().contains(currentState.query.toLowerCase()) ?? false;
        }).toList();
        final grouped = _groupLogs(filtered);
        emit(DashboardLoaded(grouped, logs, query: currentState.query));
      } else {
        final grouped = _groupLogs(logs);
        emit(DashboardLoaded(grouped, logs));
      }
    } catch (e) {
      emit(DashboardError());
    }
  }

  Map<String, List<WorkoutLog>> _groupLogs(List<WorkoutLog> logs) {
    final Map<String, List<WorkoutLog>> grouped = {};
    for (var log in logs) {
      final dateKey = DateFormatters.formatTimestamp(log.timestamp);
      if (!grouped.containsKey(dateKey)) {
        grouped[dateKey] = [];
      }
      grouped[dateKey]!.add(log);
    }
    return grouped;
  }
}
