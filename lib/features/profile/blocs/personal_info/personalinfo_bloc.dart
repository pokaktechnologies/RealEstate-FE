import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:realestate_fe/models/personal_info_model.dart';
import 'package:realestate_fe/services/profile/profile_repository.dart';
part 'personalinfo_event.dart';
part 'personalinfo_state.dart';

class PersonalinfoBloc extends Bloc<PersonalinfoEvent, PersonalinfoState> {
  final ProfileRepository profileRepository;

  PersonalinfoBloc(this.profileRepository) : super(PersonalinfoInitial()) {
    on<GetPersonalInfo>((event, emit) async {
      try {
        emit(PersonalLoading());
        final data = await profileRepository.getPersonalInfo();
        if (data.error != null) {
          emit(PersonalError(data.error));
        } else {
          emit(PersonalLoaded(data));
        }
      } catch (e) {
        emit(PersonalError(e.toString()));
      }
    });

    on<UpdatePersonalInfo>((event, emit) async {
      try {
        emit(PersonalLoading());
        await profileRepository.updatePersonalInfo(event.data);
        final updatedData = await profileRepository.getPersonalInfo();
        emit(PersonalLoaded(updatedData));
      } catch (e) {
        emit(PersonalError(e.toString()));
      }
    });
  }
}
