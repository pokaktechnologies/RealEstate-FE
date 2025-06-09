import 'package:dio/dio.dart';
import 'package:realestate_fe/core/api/api_constants.dart';
import 'package:realestate_fe/core/api/dio_client.dart';
import 'package:realestate_fe/models/profile_model.dart';

class ProfileProvider {
  final String profileUrl = ApiConstants.profileEndPoint;

  Future<ProfileModel> getUserProfile() async {
    try {
      final dio = await DioClient().getAuthorizedDio();
      Response response = await dio.get(profileUrl);

      return ProfileModel.fromJson(response.data);
    } catch (error, stacktrace) {
      print("Exception occured: $error stackTrace $stacktrace");
      return ProfileModel.withError("Data not found/ Connection issue");
    }
  }
}
