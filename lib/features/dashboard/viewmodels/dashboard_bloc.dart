import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../data/models/workout_log.dart';
import '../../../data/repositories/workout_repository.dart';
import '../../../data/repositories/settings_repository.dart';
import '../../../core/utils/date_formatters.dart';
import 'dashboard_event.dart';
import 'dashboard_state.dart';

export 'dashboard_event.dart';
export 'dashboard_state.dart';

class DashboardBloc extends Bloc<DashboardEvent, DashboardState> {
  final WorkoutRepository _repository;
  final SettingsRepository _settingsRepository;

  DashboardBloc(this._repository, this._settingsRepository) : super(DashboardLoading()) {
    on<LoadDashboardLogs>(_onLoadLogs);
    on<SearchDashboardLogs>(_onSearchLogs);
    on<DashboardWorkoutDeleted>(_onWorkoutDeleted);
    on<DashboardWorkoutUpdated>(_onWorkoutUpdated);
    on<DashboardWorkoutGroupDeleted>(_onWorkoutGroupDeleted);
    on<DashboardDuplicateLastSet>(_onDuplicateLastSet);
    on<RecordSwipeAction>(_onRecordSwipeAction);
    on<ToggleDateExpansion>(_onToggleDateExpansion);
  }

  Future<void> _onLoadLogs(LoadDashboardLogs event, Emitter<DashboardState> emit) async {
    emit(DashboardLoading());
    try {
      final logs = await _repository.getAllLogs();
      final hasSwiped = await _settingsRepository.getHasSwiped();
      final grouped = _groupLogs(logs);
      
      final expandedDates = <String>{};
      if (grouped.isNotEmpty) {
        expandedDates.add(grouped.keys.first);
      }
      
      final commonMuscleGroups = _computeCommonMuscleGroups(logs);
      final todaysMuscleGroupIds = await _repository.getTodaysMuscleGroupIds();

      emit(DashboardLoaded(grouped, logs, hasSwipedBefore: hasSwiped, expandedDates: expandedDates, commonMuscleGroups: commonMuscleGroups, todaysMuscleGroupIds: todaysMuscleGroupIds));
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
      final commonMuscleGroups = _computeCommonMuscleGroups(filtered);

      // When a search is active, expand all result dates so matches are visible.
      // When the query is cleared, revert to only the first date — matching
      // the initial load behavior from _onLoadLogs.
      final Set<String> expandedDates;
      if (event.query.isEmpty) {
        expandedDates = grouped.isNotEmpty ? {grouped.keys.first} : {};
      } else {
        expandedDates = grouped.keys.toSet();
      }

      emit(DashboardLoaded(
        grouped,
        currentState.allLogs,
        query: event.query,
        hasSwipedBefore: currentState.hasSwipedBefore,
        expandedDates: expandedDates,
        commonMuscleGroups: commonMuscleGroups,
      ));
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
        final commonMuscleGroups = _computeCommonMuscleGroups(filtered);
        emit(DashboardLoaded(
          grouped,
          updatedLogs,
          query: currentState.query,
          hasSwipedBefore: currentState.hasSwipedBefore,
          expandedDates: currentState.expandedDates,
          commonMuscleGroups: commonMuscleGroups,
        ));
      }
    } catch (e) {
      emit(DashboardError());
    }
  }

  Future<void> _onWorkoutUpdated(DashboardWorkoutUpdated event, Emitter<DashboardState> emit) async {
    try {
      await _repository.updateWorkoutLog(event.updatedLog);
      final logs = await _repository.getAllLogs();
      final todaysMuscleGroupIds = await _repository.getTodaysMuscleGroupIds();
      if (state is DashboardLoaded) {
        final currentState = state as DashboardLoaded;
        final filtered = logs.where((log) {
          return log.movementName?.toLowerCase().contains(currentState.query.toLowerCase()) ?? false;
        }).toList();
        final grouped = _groupLogs(filtered);
        final commonMuscleGroups = _computeCommonMuscleGroups(filtered);
        emit(DashboardLoaded(
          grouped,
          logs,
          query: currentState.query,
          hasSwipedBefore: currentState.hasSwipedBefore,
          expandedDates: currentState.expandedDates,
          commonMuscleGroups: commonMuscleGroups,
          todaysMuscleGroupIds: todaysMuscleGroupIds,
        ));
      } else {
        final grouped = _groupLogs(logs);
        final commonMuscleGroups = _computeCommonMuscleGroups(logs);
        final hasSwiped = await _settingsRepository.getHasSwiped();
        final expandedDates = <String>{};
        if (grouped.isNotEmpty) {
          expandedDates.add(grouped.keys.first);
        }
        emit(DashboardLoaded(grouped, logs, hasSwipedBefore: hasSwiped, expandedDates: expandedDates, commonMuscleGroups: commonMuscleGroups, todaysMuscleGroupIds: todaysMuscleGroupIds));
      }
    } catch (e) {
      emit(DashboardError());
    }
  }

  Future<void> _onWorkoutGroupDeleted(DashboardWorkoutGroupDeleted event, Emitter<DashboardState> emit) async {
    try {
      for (final id in event.logIds) {
        await _repository.deleteWorkoutLog(id);
      }
      final logs = await _repository.getAllLogs();
      final todaysMuscleGroupIds = await _repository.getTodaysMuscleGroupIds();
      if (state is DashboardLoaded) {
        final currentState = state as DashboardLoaded;
        final filtered = logs.where((log) {
          return log.movementName?.toLowerCase().contains(currentState.query.toLowerCase()) ?? false;
        }).toList();
        final grouped = _groupLogs(filtered);
        final commonMuscleGroups = _computeCommonMuscleGroups(filtered);
        emit(DashboardLoaded(
          grouped,
          logs,
          query: currentState.query,
          hasSwipedBefore: currentState.hasSwipedBefore,
          expandedDates: currentState.expandedDates,
          commonMuscleGroups: commonMuscleGroups,
          todaysMuscleGroupIds: todaysMuscleGroupIds,
        ));
      }
    } catch (e) {
      emit(DashboardError());
    }
  }

  Future<void> _onDuplicateLastSet(DashboardDuplicateLastSet event, Emitter<DashboardState> emit) async {
    try {
      final lastLog = event.lastLog;
      final newLog = WorkoutLog(
        id: null,
        movementId: lastLog.movementId,
        weight: lastLog.weight,
        reps: lastLog.reps,
        timestamp: DateTime.now().millisecondsSinceEpoch,
        painFelt: lastLog.painFelt,
        variations: lastLog.variations,
        movementName: lastLog.movementName,
      );
      await _repository.saveWorkoutLog(newLog);
      final logs = await _repository.getAllLogs();
      final todaysMuscleGroupIds = await _repository.getTodaysMuscleGroupIds();
      if (state is DashboardLoaded) {
        final currentState = state as DashboardLoaded;
        final filtered = logs.where((log) {
          return log.movementName?.toLowerCase().contains(currentState.query.toLowerCase()) ?? false;
        }).toList();
        final grouped = _groupLogs(filtered);
        final commonMuscleGroups = _computeCommonMuscleGroups(filtered);
        emit(DashboardLoaded(
          grouped,
          logs,
          query: currentState.query,
          hasSwipedBefore: currentState.hasSwipedBefore,
          expandedDates: currentState.expandedDates,
          commonMuscleGroups: commonMuscleGroups,
          todaysMuscleGroupIds: todaysMuscleGroupIds,
        ));
      }
    } catch (e) {
      emit(DashboardError());
    }
  }

  Future<void> _onRecordSwipeAction(RecordSwipeAction event, Emitter<DashboardState> emit) async {
    if (state is DashboardLoaded) {
      final currentState = state as DashboardLoaded;
      if (!currentState.hasSwipedBefore) {
        await _settingsRepository.setHasSwiped(true);
        emit(currentState.copyWith(hasSwipedBefore: true));
      }
    }
  }

  void _onToggleDateExpansion(ToggleDateExpansion event, Emitter<DashboardState> emit) {
    if (state is DashboardLoaded) {
      final currentState = state as DashboardLoaded;

      final newExpanded = Set<String>.from(currentState.expandedDates);
      if (newExpanded.contains(event.dateKey)) {
        newExpanded.remove(event.dateKey);
      } else {
        newExpanded.add(event.dateKey);
      }
      emit(currentState.copyWith(expandedDates: newExpanded));
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

  Map<String, List<String>> _computeCommonMuscleGroups(List<WorkoutLog> logs) {
    final Map<String, List<WorkoutLog>> groupedByDate = {};
    for (var log in logs) {
      final dateKey = DateFormatters.formatTimestamp(log.timestamp);
      if (!groupedByDate.containsKey(dateKey)) {
        groupedByDate[dateKey] = [];
      }
      groupedByDate[dateKey]!.add(log);
    }

    final Map<String, List<String>> result = {};
    for (var dateKey in groupedByDate.keys) {
      final dailyLogs = groupedByDate[dateKey]!;
      final counts = <String, int>{};
      for (var log in dailyLogs) {
        if (log.workoutGroupName != null) {
          counts[log.workoutGroupName!] = (counts[log.workoutGroupName!] ?? 0) + 1;
        }
      }
      if (counts.isNotEmpty) {
        final sortedEntries = counts.entries.toList()
          ..sort((a, b) => b.value.compareTo(a.value));
        result[dateKey] = sortedEntries.take(2).map((e) => e.key).toList();
      }
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

