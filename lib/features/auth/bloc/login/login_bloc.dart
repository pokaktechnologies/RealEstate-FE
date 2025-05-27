import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:realestate_fe/features/auth/bloc/login/login_event.dart';
import 'package:realestate_fe/features/auth/bloc/login/login_state.dart';
import 'package:realestate_fe/services/auth/auth_respository.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginInitial()) {
    final AuthRespository authRepository = AuthRespository();

    on<LoginUser>((event, emit) async {
      emit(LoginInitial());
      try {
        final message = await authRepository.loginUser(event.accountData);
        emit(LoginSuccess(message));
      } catch (e) {
        emit(LoginError('Failed to Login'));
      }
    });
  }
}
