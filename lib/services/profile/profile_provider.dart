import 'package:dio/dio.dart';
import 'package:realestate_fe/core/api/api_constants.dart';
import 'package:realestate_fe/core/api/dio_client.dart';
import 'package:realestate_fe/core/services.dart';
import 'package:realestate_fe/models/profile_model.dart';

class ProfileProvider {
  final String profileUrl = ApiConstants.profileEndPoint;
  final String logoutUrl = ApiConstants.logoutEndPoint;

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

  Future<String> logoutUser() async {
    try {
      final refreshToken = await SecureStorageService().getRefreshToken();
      if (refreshToken == null || refreshToken.isEmpty) {
        print("no refresh token");
        return 'No refresh token found';
      }

      final dio = await DioClient().getAuthorizedDio();
      final response = await dio.post(
        logoutUrl,
        data: {
          "refresh": refreshToken,
        },
        options: Options(
          headers: {
            "Content-Type": "application/json",
          },
        ),
      );

      print("status code ==> $response");

      return response.data['message'] ?? 'Logout Successfully Completed';
    } on DioException catch (error) {
      print("Logout Error: ${error.response?.data}");
      return 'Logout Failed: ${error.response?.data["detail"] ?? "Unknown error"}';
    } catch (error) {
      print("Logout Error: $error");
      return 'Error While Logout User';
    }
  }
}
