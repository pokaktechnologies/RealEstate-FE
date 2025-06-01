import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:realestate_fe/features/auth/bloc/verify-otp/verify_otp_event.dart';
import 'package:realestate_fe/features/auth/bloc/verify-otp/verify_otp_state.dart';
import 'package:realestate_fe/services/auth/auth_respository.dart';

class VerifyOtpBloc extends Bloc<VerifyOtpEvent, VerifyOtpState> {
  VerifyOtpBloc() : super(VerifyOtpInitial()) {
    final AuthRespository authRepository = AuthRespository();

    on<VerifyOtpUser>((event, emit) async {
      emit(VerifyOtpLoading());
      try {
        final message = await authRepository.verifyOtp(event.verifyOtpData);
        emit(VerifyOtpSuccess(message));
      } catch (e) {
        emit(VerifyOtpError('Failed to Verify Otp'));
      }
    });
  }
}
