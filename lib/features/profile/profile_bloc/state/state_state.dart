import 'package:equatable/equatable.dart';
import 'package:realestate_fe/models/state_model.dart';

abstract class StateState extends Equatable {
  const StateState();

  @override
  List<Object?> get props => [];
}

class StateInitial extends StateState {}

class StateLoading extends StateState {}

class StateLoaded extends StateState {
  final StateModel stateModel;
  const StateLoaded(this.stateModel);
}

class StateError extends StateState {
  final String? message;
  const StateError(this.message);
}
