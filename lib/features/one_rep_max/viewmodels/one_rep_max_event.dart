import 'package:equatable/equatable.dart';

abstract class OneRepMaxEvent extends Equatable {
  const OneRepMaxEvent();

  @override
  List<Object?> get props => [];
}

class LoadOneRepMaxData extends OneRepMaxEvent {
  const LoadOneRepMaxData();
}
