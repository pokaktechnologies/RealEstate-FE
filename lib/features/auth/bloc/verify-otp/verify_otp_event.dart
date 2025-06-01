import 'package:equatable/equatable.dart';

abstract class VerifyOtpEvent extends Equatable {
  const VerifyOtpEvent();

  @override
  List<Object> get props => [];
}

class VerifyOtpUser extends VerifyOtpEvent {
  final Map<String, dynamic> verifyOtpData;

  const VerifyOtpUser(this.verifyOtpData);

  @override
  List<Object> get props => [verifyOtpData];
}
