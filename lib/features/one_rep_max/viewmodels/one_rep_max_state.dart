import 'package:equatable/equatable.dart';
import '../../../data/models/workout_log.dart';

abstract class OneRepMaxState extends Equatable {
  const OneRepMaxState();

  @override
  List<Object?> get props => [];
}

class OneRepMaxInitial extends OneRepMaxState {}

class OneRepMaxLoading extends OneRepMaxState {}

class OneRepMaxLoaded extends OneRepMaxState {
  final Map<String, WorkoutLog?> latestLogs;

  const OneRepMaxLoaded({required this.latestLogs});

  @override
  List<Object?> get props => [latestLogs];
}

class OneRepMaxError extends OneRepMaxState {
  final String message;

  const OneRepMaxError(this.message);

  @override
  List<Object?> get props => [message];
}
