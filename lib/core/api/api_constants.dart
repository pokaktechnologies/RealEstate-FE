import 'package:realestate_fe/core/config.dart';

class ApiConstants {
  static String serverUrl = ApiConfig.serverUrl;

  // Authentication
  static String registerEndPoint = '$serverUrl/accounts/register/request-otp/';
  static String verifyOtpEndPoint = '$serverUrl/accounts/register/verify-otp/';
  static String loginEndPoint = '$serverUrl/accounts/login/';
}
