import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:realestate_fe/features/auth/bloc/register/register_event.dart';
import 'package:realestate_fe/features/auth/bloc/register/register_state.dart';
import 'package:realestate_fe/services/register/register_respository.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  RegisterBloc() : super(RegisterInitial()) {
    final RegisterRespository apiRepository = RegisterRespository();

    on<RegisterUser>((event, emit) async {
      emit(RegisterLoading());
      try {
        final message = await apiRepository.registerUser(event.accountData);
        emit(RegisterSuccess(message));
      } catch (e) {
        emit(RegisterError('Failed to add account'));
      }
    });
  }
}
