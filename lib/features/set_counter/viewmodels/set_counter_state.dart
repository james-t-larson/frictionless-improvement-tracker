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

  const SetCounterLoaded({required this.setCounts});

  @override
  List<Object?> get props => [setCounts];
}

class SetCounterError extends SetCounterState {
  final String message;

  const SetCounterError(this.message);

  @override
  List<Object?> get props => [message];
}
