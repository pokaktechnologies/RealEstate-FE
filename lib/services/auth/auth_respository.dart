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
}
