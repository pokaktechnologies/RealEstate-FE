import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:realestate_fe/features/auth/bloc/forgot_password/forgot_password_event.dart';
import 'package:realestate_fe/features/auth/bloc/forgot_password/forgot_password_state.dart';
import 'package:realestate_fe/services/auth/auth_respository.dart';

class ForgotPasswordBloc
    extends Bloc<ForgotPasswordEvent, ForgotPasswordState> {
  final AuthRespository authRepository = AuthRespository();

  ForgotPasswordBloc() : super(ForgotPasswordInitial()) {
    on<ForgotPasswordRequestOtpEvent>((event, emit) async {
      emit(ForgotPasswordLoading());
      try {
        await authRepository.requestOtp(event.email);
        emit(ForgotPasswordOtpSent("OTP sent to email"));
      } catch (error) {
        final errorMessage = error.toString();
        if (errorMessage.toLowerCase().contains('otp sent')) {
          emit(ForgotPasswordOtpSent("OTP sent to email"));
        } else {
          emit(ForgotPasswordError(errorMessage));
        }
      }
    });

    on<ForgotPasswordVerifyOtpEvent>((event, emit) async {
      emit(ForgotPasswordLoading());
      try {
        await authRepository.forgotVerifyOtp(event.email, event.otp);
        print('📢 ForgotPasswordRequestOtpEvent triggered');

        emit(ForgotPasswordOtpVerified("OTP verified"));
      } catch (error) {
        emit(ForgotPasswordError(error.toString()));
      }
    });

    on<ForgotPasswordResetEvent>((event, emit) async {
      emit(ForgotPasswordLoading());
      try {
        await authRepository.resetPassword(
          event.email,
          event.otp,
          event.newPassword,
        );
        emit(ForgotPasswordSuccess("Password reset successfully"));
      } catch (error) {
        emit(ForgotPasswordError(error.toString()));
      }
    });
  }
}
