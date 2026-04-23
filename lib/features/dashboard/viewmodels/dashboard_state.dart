import 'package:equatable/equatable.dart';
import '../../../data/models/workout_log.dart';
import '../../../data/models/variation.dart';

abstract class WorkoutHistoryItem extends Equatable {
  const WorkoutHistoryItem();
}

class SingleLogItem extends WorkoutHistoryItem {
  final WorkoutLog log;
  const SingleLogItem(this.log);
  @override
  List<Object?> get props => [log];
}

class GroupedLogsItem extends WorkoutHistoryItem {
  final List<WorkoutLog> logs;
  const GroupedLogsItem(this.logs);
  
  String get movementName => logs.first.movementName ?? 'Unknown';
  List<Variation> get variations => logs.first.variations;
  double get maxWeight => logs.isEmpty ? 0 : logs.map((l) => l.weight).reduce((a, b) => a > b ? a : b);
  int get totalSets => logs.length;
  bool get painFelt => logs.any((l) => l.painFelt);

  @override
  List<Object?> get props => [logs];
}

abstract class DashboardState extends Equatable {
  const DashboardState();
  @override
  List<Object?> get props => [];
}

class DashboardLoading extends DashboardState {}

class DashboardLoaded extends DashboardState {
  final Map<String, List<WorkoutHistoryItem>> groupedLogs;
  final List<WorkoutLog> allLogs;
  final String query;
  final bool hasSwipedBefore;

  const DashboardLoaded(
    this.groupedLogs,
    this.allLogs, {
    this.query = '',
    this.hasSwipedBefore = true,
  });

  DashboardLoaded copyWith({
    Map<String, List<WorkoutHistoryItem>>? groupedLogs,
    List<WorkoutLog>? allLogs,
    String? query,
    bool? hasSwipedBefore,
  }) {
    return DashboardLoaded(
      groupedLogs ?? this.groupedLogs,
      allLogs ?? this.allLogs,
      query: query ?? this.query,
      hasSwipedBefore: hasSwipedBefore ?? this.hasSwipedBefore,
    );
  }

  @override
  List<Object?> get props => [groupedLogs, allLogs, query, hasSwipedBefore];
}

class DashboardError extends DashboardState {}
