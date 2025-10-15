part of 'personalinfo_bloc.dart';

abstract class PersonalinfoEvent extends Equatable {
  const PersonalinfoEvent();

  @override
  List<Object> get props => [];
}

class GetPersonalInfo extends PersonalinfoEvent {}

class UpdatePersonalInfo extends PersonalinfoEvent {
  final Map<String, dynamic> data;
  const UpdatePersonalInfo(this.data);

  @override
  List<Object> get props => [data];
}
