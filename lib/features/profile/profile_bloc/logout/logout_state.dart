import 'package:equatable/equatable.dart';

abstract class LogoutState extends Equatable {
  const LogoutState();

  @override
  List<Object?> get props => [];
}

class LogoutInitial extends LogoutState {}

class LogoutLoading extends LogoutState {}

class LogoutSuccess extends LogoutState {
  final String message;
  const LogoutSuccess(this.message);
}

class LogoutError extends LogoutState {
  final String? error;
  const LogoutError(this.error);
}
