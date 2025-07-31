import 'package:realestate_fe/core/config.dart';

class ApiConstants {
  static String serverUrl = ApiConfig.serverUrl;

  // Authentication
  static String registerEndPoint = '$serverUrl/accounts/register/request-otp/';
  static String verifyOtpEndPoint = '$serverUrl/accounts/register/verify-otp/';
  static String loginEndPoint = '$serverUrl/accounts/login/';

// Forgot password
  static String forgotPasswordRequestOtp =
      '$serverUrl/accounts/forgot-password/request-otp/';
  static String forgotPasswordVerifyOtp =
      '$serverUrl/accounts/forgot-password/verify-otp/';
  static String forgotPasswordReset =
      '$serverUrl/accounts/forgot-password/reset-password/';

  // Profile
  static String profileEndPoint = '$serverUrl/profiles/personal-info/';
  static String logoutEndPoint = '$serverUrl/accounts/logout/';
  static String countryEndPoint = '$serverUrl/accounts/country/';
  static String getStateByCountryId(String countryId) =>
      "$serverUrl/accounts/country/$countryId/state/";
  static String contactEndPoint = '$serverUrl/profiles/contact-info/';

  // home
  static String idealPayingGusetEndPoint =
      '$serverUrl/property/user/ideal-pay-per-stay/';
  static String trendingPropertiesNearYouEndPoint =
      '$serverUrl/property/user/trending-properties-near-you/';
  static String propertiesRentalEndPoint =
      '$serverUrl/property/user/best-properties-for-rental/';
  static String personalEndPoint = '$serverUrl/profiles/personal-info/';

  //property
  static String propertyByIdEndPoint = '$serverUrl/property/user';
}
