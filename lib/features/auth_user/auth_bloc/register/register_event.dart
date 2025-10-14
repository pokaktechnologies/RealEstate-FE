import 'package:equatable/equatable.dart';

abstract class RegisterEvent extends Equatable {
  const RegisterEvent();

  @override
  List<Object> get props => [];
}

class RegisterUser extends RegisterEvent {
  final Map<String, dynamic> accountData;

  const RegisterUser(this.accountData);

  @override
  List<Object> get props => [accountData];
}
