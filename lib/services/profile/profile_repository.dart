import 'package:realestate_fe/models/profile_model.dart';
import 'package:realestate_fe/services/profile/profile_provider.dart';

class ProfileRepository {
  final _provider = ProfileProvider();

  Future<ProfileModel> getProfile() {
    return _provider.getUserProfile();
  }
}
