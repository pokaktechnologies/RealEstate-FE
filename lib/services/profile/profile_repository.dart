import 'package:realestate_fe/models/contact_info_model.dart';
import 'package:realestate_fe/models/contact_model.dart';
import 'package:realestate_fe/models/country_model.dart';
import 'package:realestate_fe/models/personal_info_model.dart';
import 'package:realestate_fe/models/profile_model.dart';
import 'package:realestate_fe/models/state_model.dart';
import 'package:realestate_fe/services/profile/profile_provider.dart';

class ProfileRepository {
  final _provider = ProfileProvider();

  Future<ProfileModel> getProfile() {
    return _provider.getUserProfile();
  }

  Future<CountryModel> getCountries() {
    return _provider.getCountry();
  }

  Future<StateModel> getStatesByCountry(String countryId) =>
      _provider.getStatesByCountryId(countryId);

  Future<void> postContact(ContactData data) async {
    await _provider.postContact(data);
  }

  Future<ContactInfoModel> getContact() {
    return _provider.getContact();
  }

  Future<String> logoutUser() {
    return _provider.logoutUser();
  }

  // Future<PersonalInfoModel> getPersonalInfo() {
  //   return _provider.getPersonalInfo();
  // }
}
