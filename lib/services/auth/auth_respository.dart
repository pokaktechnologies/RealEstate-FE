import 'package:realestate_fe/services/auth/auth_provider.dart';

class AuthRespository {
  final _provider = AuthProvider();

  Future<String> registerUser(Map<String, dynamic> userData) {
    return _provider.registerUser(userData);
  }

  Future<String> loginUser(Map<String, dynamic> loginData) {
    return _provider.loginUser(loginData);
  }

  Future<String> verifyOtp(Map<String, dynamic> verifyData) {
    return _provider.verifyOtp(verifyData);
  }

// forgot
  Future<void> requestOtp(String email) {
    return _provider.requestOtp(email);
  }

  Future<void> forgotVerifyOtp(String email, int otp) {
    return _provider.forgotverifyOtp(email, otp);
  }

  Future<void> resetPassword(String email, int otp, String newPassword) {
    return _provider.resetPassword(email, otp, newPassword);
  }
}
