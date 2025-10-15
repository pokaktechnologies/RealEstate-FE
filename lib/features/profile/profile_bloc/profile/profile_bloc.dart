import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:realestate_fe/features/profile/profile_bloc/profile/profile_event.dart';
import 'package:realestate_fe/features/profile/profile_bloc/profile/profile_state.dart';
import 'package:realestate_fe/services/profile/profile_repository.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  ProfileBloc() : super(ProfileInitial()) {
    final ProfileRepository profileRepository = ProfileRepository();

    on<GetUserProfileList>((event, emit) async {
      try {
        emit(ProfileLoading());

        final profileList = await profileRepository.getProfile();
        emit(ProfileLoaded(profileList));

        if (profileList.error != null) {
          emit(ProfileError(profileList.error));
        }
      } catch (error) {
        print(error);
      }
    });
  }
}
