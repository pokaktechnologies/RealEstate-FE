import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:realestate_fe/features/profile/blocs/logout/logout_event.dart';
import 'package:realestate_fe/features/profile/blocs/logout/logout_state.dart';
import 'package:realestate_fe/services/profile/profile_repository.dart';

class LogoutBloc extends Bloc<LogoutEvent, LogoutState> {
  LogoutBloc() : super(LogoutInitial()) {
    final ProfileRepository profileRepository = ProfileRepository();

    on<LogoutUser>((event, emit) async {
      try {
        emit(LogoutLoading());

        final message = await profileRepository.logoutUser();
        emit(LogoutSuccess(message));
      } catch (error) {
        print(error);
      }
    });
  }
}
