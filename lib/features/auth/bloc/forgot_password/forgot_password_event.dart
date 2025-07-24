abstract class ForgotPasswordEvent {}

class ForgotPasswordRequestOtpEvent extends ForgotPasswordEvent {
  final String email;
  ForgotPasswordRequestOtpEvent(this.email);
}

class ForgotPasswordVerifyOtpEvent extends ForgotPasswordEvent {
  final String email;
  final int otp;
  ForgotPasswordVerifyOtpEvent(this.email, this.otp);
}

class ForgotPasswordResetEvent extends ForgotPasswordEvent {
  final String email;
  final int otp;
  final String newPassword;
  ForgotPasswordResetEvent(
    this.email,
    this.otp,
    this.newPassword,
  );
}
