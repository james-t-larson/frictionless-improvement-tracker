import 'package:equatable/equatable.dart';

abstract class SetCounterState extends Equatable {
  const SetCounterState();

  @override
  List<Object?> get props => [];
}

class SetCounterInitial extends SetCounterState {}

class SetCounterLoading extends SetCounterState {}

class SetCounterLoaded extends SetCounterState {
  final Map<String, int> setCounts;
  final Map<String, Map<String, int>> muscleCounts;

  const SetCounterLoaded({required this.setCounts, required this.muscleCounts});

  @override
  List<Object?> get props => [setCounts, muscleCounts];
}

class SetCounterError extends SetCounterState {
  final String message;

  const SetCounterError(this.message);

  @override
  List<Object?> get props => [message];
}
