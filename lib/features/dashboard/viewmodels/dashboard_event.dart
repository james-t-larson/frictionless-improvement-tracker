import 'package:equatable/equatable.dart';
import '../../../data/models/workout_log.dart';

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
