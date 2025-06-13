import 'package:equatable/equatable.dart';

abstract class StateEvent extends Equatable {
  const StateEvent();

  @override
  List<Object> get props => [];
}

class GetStateList extends StateEvent {
  final int countryId;

  const GetStateList(this.countryId);

  @override
  List<Object> get props => [countryId];
}
