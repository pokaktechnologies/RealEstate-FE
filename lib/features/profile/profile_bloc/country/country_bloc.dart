import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:realestate_fe/features/profile/profile_bloc/country/country_event.dart';
import 'package:realestate_fe/features/profile/profile_bloc/country/country_state.dart';
import 'package:realestate_fe/services/profile/profile_repository.dart';

class CountryBloc extends Bloc<CountryEvent, CountryState> {
  CountryBloc() : super(CountryInitial()) {
    final ProfileRepository profileRepository = ProfileRepository();

    on<GetCountryList>((event, emit) async {
      try {
        print("Loading countries...");
        emit(CountryLoading());
        final countryList = await profileRepository.getCountries();
        print("Fetched countries: ${countryList.data?.length}");
        if (countryList.error != null) {
          emit(CountryError(countryList.error));
        } else {
          emit(CountryLoaded(countryList));
        }
      } catch (e) {
        emit(CountryError("Something went wrong"));
      }
    });

    on<SelectCountry>((event, emit) {
      final currentState = state;
      if (currentState is CountryLoaded) {
        emit(currentState.copyWith(selectedCountryId: event.selectedCountryId));
      }
    });
  }
}
