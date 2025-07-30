import 'package:dio/dio.dart';
import 'package:realestate_fe/core/api/api_constants.dart';
import 'package:realestate_fe/core/services.dart';

class AuthProvider {
  final Dio _dio = Dio(
    BaseOptions(
      baseUrl: ApiConstants.serverUrl,
      headers: {
        'Content-Type': 'application/json',
      },
    ),
  );
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

  Future<String> verifyOtp(Map<String, dynamic> verifyData) async {
    final response = await _dio.post(_verifyOtpUrl, data: verifyData);

    if (response.statusCode == 200) {
      final accessToken = response.data['access'];
      final refreshToken = response.data['refresh'];
      SecureStorageService secureStorage = SecureStorageService();

      await secureStorage.storeToken(accessToken);
      await secureStorage.storeRefreshToken(refreshToken);

      return response.data['message'] ?? 'Otp Verified Successfully';
    } else {
      throw Exception(response.data['error'] ?? 'Verification failed');
    }
  }

  Future<String> loginUser(Map<String, dynamic> loginData) async {
    try {
      final response = await _dio.post(_loginUrl, data: loginData);

      if (response.statusCode == 200) {
        final secureStorage = SecureStorageService();
        await secureStorage.storeToken(response.data['access']);
        await secureStorage.storeRefreshToken(response.data['refresh']);
        return response.data['message'] ?? 'User Login Successfully';
      } else {
        throw Exception('Invalid credentials');
      }
    } on DioError catch (error) {
      final data = error.response?.data;
      final serverMessage = data?['detail'] ??
          data?['message'] ??
          'User not registered, please register.';
      throw Exception(serverMessage);
    } catch (_) {
      throw Exception('Something went wrong. Please try again.');
    }
  }

  // forgot password

  Future<void> requestOtp(String email) async {
    try {
      final response = await _dio.post(
        ApiConstants.forgotPasswordRequestOtp,
        data: {"email": email},
      );

      if (response.statusCode == null ||
          response.statusCode! < 200 ||
          response.statusCode! >= 300) {
        final errorMessage = response.data['message'] ?? "Failed to send OTP";
        throw Exception(errorMessage);
      }
    } on DioError catch (error) {
      if (error.response != null) {
        final data = error.response?.data;
        if (data is Map<String, dynamic> && data['message'] is String) {
          throw Exception(data['message']);
        }
      }
      throw Exception('Failed to send OTP');
    } catch (error) {
      throw Exception('Unexpected error occurred');
    }
  }

  Future<void> forgotverifyOtp(String email, int otp) async {
    try {
      final response = await _dio.post(
        ApiConstants.forgotPasswordVerifyOtp,
        data: {"email": email, "otp": otp},
      );

      if (response.statusCode == null ||
          response.statusCode! < 200 ||
          response.statusCode! >= 300) {
        final errorMessage = response.data['error'] ?? "Invalid OTP";
        throw Exception(errorMessage);
      }
    } on DioError catch (error) {
      if (error.response != null) {
        final data = error.response?.data;
        if (data is Map<String, dynamic>) {
          if (data['error'] is String) {
            throw Exception(data['error']);
          }
          if (data['message'] is String) {
            throw Exception(data['message']);
          }
        }
      }
      throw Exception('Network error while verifying OTP');
    } catch (error) {
      throw Exception('Unexpected error while verifying OTP');
    }
  }

  Future<void> resetPassword(String email, int otp, String newPassword) async {
    final response = await _dio.post(
      ApiConstants.forgotPasswordReset,
      data: {
        "email": email,
        "otp": otp,
        "new_password": newPassword,
      },
      options: Options(
        headers: {
          "Content-Type": "application/json",
        },
      ),
    );

    if (response.statusCode != 200) throw Exception("Reset failed");
  }
}
