import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../data/models/workout_log.dart';
import '../../../data/repositories/workout_repository.dart';
import '../../../core/utils/date_formatters.dart';
import 'dashboard_event.dart';
import 'dashboard_state.dart';

export 'dashboard_event.dart';
export 'dashboard_state.dart';

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

  Map<String, List<WorkoutHistoryItem>> _groupLogs(List<WorkoutLog> logs) {
    final Map<String, List<WorkoutLog>> groupedByDate = {};
    for (var log in logs) {
      final dateKey = DateFormatters.formatTimestamp(log.timestamp);
      if (!groupedByDate.containsKey(dateKey)) {
        groupedByDate[dateKey] = [];
      }
      groupedByDate[dateKey]!.add(log);
    }

    final Map<String, List<WorkoutHistoryItem>> result = {};
    for (var dateKey in groupedByDate.keys) {
      result[dateKey] = _stackLogs(groupedByDate[dateKey]!);
    }
    return result;
  }

  List<WorkoutHistoryItem> _stackLogs(List<WorkoutLog> logs) {
    if (logs.isEmpty) return [];
    List<WorkoutHistoryItem> items = [];

    int i = 0;
    while (i < logs.length) {
      final currentLog = logs[i];
      int j = i + 1;
      while (j < logs.length && _isSameExercise(currentLog, logs[j])) {
        j++;
      }

      if (j - i > 1) {
        items.add(GroupedLogsItem(logs.sublist(i, j)));
      } else {
        items.add(SingleLogItem(currentLog));
      }
      i = j;
    }
    return items;
  }

  bool _isSameExercise(WorkoutLog a, WorkoutLog b) {
    if (a.movementId != b.movementId) return false;
    if (a.variations.length != b.variations.length) return false;

    final aVars = a.variations.map((e) => e.id).toList()..sort();
    final bVars = b.variations.map((e) => e.id).toList()..sort();
    for (int k = 0; k < aVars.length; k++) {
      if (aVars[k] != bVars[k]) return false;
    }
    return true;
  }
}

