import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:realestate_fe/models/personal_info_model.dart';
import 'package:realestate_fe/services/profile/profile_repository.dart';
part 'personalinfo_event.dart';
part 'personalinfo_state.dart';

class PersonalinfoBloc extends Bloc<PersonalinfoEvent, PersonalinfoState> {
  PersonalinfoBloc() : super(PersonalinfoInitial()) {
    final ProfileRepository profileRepository = ProfileRepository();

    // on<GetPersonalInfo>((event, emit) async {
    //   try {
    //     emit(PersonalLoading());
    //     final personList = await profileRepository.getPersonalInfo();
    //     emit(PersonalLoaded(personList));
    //     if (personList.error != null) {
    //       emit(PersonalError(personList.error));
    //     }
    //   } catch (error) {
    //     print(error);
    //   }
   // });
  }
}
