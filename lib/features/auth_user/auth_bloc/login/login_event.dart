import 'package:equatable/equatable.dart';

abstract class LoginEvent extends Equatable {
  const LoginEvent();

  @override
  List<Object> get props => [];
}

class LoginUser extends LoginEvent {
  final Map<String, dynamic> accountData;

  const LoginUser(this.accountData);

  @override
  List<Object> get props => [accountData];
}
