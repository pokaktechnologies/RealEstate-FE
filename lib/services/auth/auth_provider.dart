import 'package:dio/dio.dart';
import 'package:realestate_fe/core/api/api_constants.dart';

class AuthProvider {
  final Dio _dio = Dio();
  final String _registerUrl = ApiConstants.registerEndPoint;
  final String _loginUrl = ApiConstants.loginEndPoint;
  final String _verifyOtpUrl = ApiConstants.verifyOtpEndPoint;

  Future<String> registerUser(Map<String, dynamic> userData) async {
    try {
      final response = await _dio.post(_registerUrl, data: userData);
      return response.data['message'] ?? 'User Created Successfully';
    } catch (error) {
      print("POST Error: $error");
      return 'Error While Creating User';
    }
  }

  Future<String> loginUser(Map<String, dynamic> loginData) async {
    try {
      print("login user function called");
      print("login url => $_loginUrl");
      print("login data => $loginData");
      final response = await _dio.post(_loginUrl, data: loginData);
      print("response => $response");
      if (response.statusCode == 200 && response.data['success'] == true) {
        return response.data['message'] ?? 'User Login Successfully';
      } else {
        throw Exception(response.data['message'] ?? 'Login failed');
      }
    } catch (error) {
      print("Login Error: $error");
      return 'Error While Login User';
    }
  }

  Future<String> verifyOtp(Map<String, dynamic> verifyData) async {
    try {
      final response = await _dio.post(_verifyOtpUrl, data: verifyData);
      if (response.statusCode == 200 && response.data['success'] == true) {
        return response.data['message'] ?? 'Otp Verified Successfully';
      } else {
        throw Exception(response.data['message'] ?? 'Verification failed');
      }
    } catch (error) {
      print("Otp Verification Error: $error");
      return 'Error While Verifying Otp';
    }
  }
}
