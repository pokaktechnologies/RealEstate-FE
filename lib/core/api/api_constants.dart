import 'package:realestate_fe/core/config.dart';

class ApiConstants {
  static String serverUrl = ApiConfig.serverUrl;

  // Authentication
  static String registerEndPoint = '$serverUrl/accounts/register/request-otp/';
}
