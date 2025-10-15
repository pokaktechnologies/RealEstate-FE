import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:realestate_fe/features/profile/profile_bloc/state/state_event.dart';
import 'package:realestate_fe/features/profile/profile_bloc/state/state_state.dart';
import 'package:realestate_fe/services/profile/profile_repository.dart';

class StateBloc extends Bloc<StateEvent, StateState> {
  StateBloc() : super(StateInitial()) {
    final ProfileRepository profileRepository = ProfileRepository();

    on<GetStateList>((event, emit) async {
      try {
        emit(StateLoading());
        print("Getting states for countryId: ${event.countryId}");
        final stateModel = await profileRepository
            .getStatesByCountry(event.countryId.toString());
        print("State list fetched: ${stateModel.data?.length}");
        emit(StateLoaded(stateModel));
      } catch (e) {
        print("State loading error: $e");
        emit(StateError(e.toString()));
      }
    });
  }
}
