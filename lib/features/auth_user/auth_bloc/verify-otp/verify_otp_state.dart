import 'package:equatable/equatable.dart';

abstract class VerifyOtpState extends Equatable {
  const VerifyOtpState();

  @override
  List<Object?> get props => [];
}

class VerifyOtpInitial extends VerifyOtpState {}

class VerifyOtpLoading extends VerifyOtpState {}

class VerifyOtpSuccess extends VerifyOtpState {
  final String message;
  const VerifyOtpSuccess(this.message);
}

class VerifyOtpError extends VerifyOtpState {
  final String? message;
  const VerifyOtpError(this.message);
}
