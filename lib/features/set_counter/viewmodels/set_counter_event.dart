import 'package:equatable/equatable.dart';

abstract class SetCounterEvent extends Equatable {
  const SetCounterEvent();

  @override
  List<Object?> get props => [];
}

class LoadSetCounterData extends SetCounterEvent {
  const LoadSetCounterData();
}
