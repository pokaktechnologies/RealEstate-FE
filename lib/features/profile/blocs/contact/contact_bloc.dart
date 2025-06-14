import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:realestate_fe/services/profile/profile_repository.dart';
import 'contact_event.dart';
import 'contact_state.dart';

class ContactBloc extends Bloc<ContactEvent, ContactState> {
  ContactBloc() : super(ContactInitial()) {
    final ProfileRepository profileRepository = ProfileRepository();
    on<PostContactEvent>((event, emit) async {
      emit(ContactLoading());

      try {
        await profileRepository.postContact(event.contactData);
        emit(ContactSuccess());
      } catch (e) {
        emit(ContactError(e.toString()));
      }
    });
    on<GetContactEvent>((event, emit) async {
      emit(ContactLoading());
      try {
        final contact = await profileRepository.getContact();

        if (contact.data != null) {
          emit(ContactLoaded(contact));
        } else {
          emit(ContactError("Contact data not available"));
        }
      } catch (e) {
        emit(ContactError(e.toString()));
      }
    });
  }
}
