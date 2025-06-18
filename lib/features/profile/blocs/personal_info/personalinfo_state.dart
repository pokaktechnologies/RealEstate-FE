part of 'personalinfo_bloc.dart';

abstract class PersonalinfoState extends Equatable {
  const PersonalinfoState();

  @override
  List<Object> get props => [];
}

class PersonalinfoInitial extends PersonalinfoState {}

class PersonalLoading extends PersonalinfoState {}

class PersonalLoaded extends PersonalinfoState {
  final PersonalInfoModel personalInfoModel;
  const PersonalLoaded(this.personalInfoModel);
}

class PersonalError extends PersonalinfoState {
  final String? message;
  const PersonalError(this.message);
}
class PersonalUpdated extends PersonalinfoState {}