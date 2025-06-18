part of 'personalinfo_bloc.dart';

abstract class PersonalinfoEvent extends Equatable {
  const PersonalinfoEvent();

  @override
  List<Object> get props => [];
}

class GetPersonalInfo extends PersonalinfoEvent {}
