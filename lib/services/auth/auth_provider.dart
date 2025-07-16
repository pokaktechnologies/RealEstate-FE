import 'package:dio/dio.dart';
import 'package:realestate_fe/core/api/api_constants.dart';
import 'package:realestate_fe/core/services.dart';

class AuthProvider {
  final Dio _dio = Dio();
  final String _registerUrl = ApiConstants.registerEndPoint;
  final String _loginUrl = ApiConstants.loginEndPoint;
  final String _verifyOtpUrl = ApiConstants.verifyOtpEndPoint;

  Future<String> registerUser(Map<String, dynamic> userData) async {
    try {
      final response = await _dio.post(_registerUrl, data: userData);
      return response.data['message'] ?? 'User Created Successfully';
    } on DioError catch (error) {
      if (error.response != null) {
        final data = error.response?.data;
        if (data is Map<String, dynamic> && data['message'] is String) {
          return data['message'];
        }
      }
      return 'Email already exists';
    } catch (error) {
      return 'Unexpected error occurred';
    }
  }

  Future<String> loginUser(Map<String, dynamic> loginData) async {
    try {
      final response = await _dio.post(_loginUrl, data: loginData);
      if (response.statusCode == 200) {
        SecureStorageService secureStorage = SecureStorageService();
        final accessToken = response.data['access'];
        final refreshToken = response.data['refresh'];

        await secureStorage.storeToken(accessToken);
        await secureStorage.storeRefreshToken(refreshToken);
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
      if (response.statusCode == 200) {
        SecureStorageService secureStorage = SecureStorageService();
        final accessToken = response.data['access'];
        final refreshToken = response.data['refresh'];

        await secureStorage.storeToken(accessToken);
        await secureStorage.storeRefreshToken(refreshToken);
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
