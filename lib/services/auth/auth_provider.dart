import 'package:dio/dio.dart';
import 'package:realestate_fe/core/api/api_constants.dart';

class AuthProvider {
  final Dio _dio = Dio();
  final String _registerUrl = ApiConstants.registerEndPoint;
  final String _loginUrl = ApiConstants.loginEndPoint;

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
      print("-------- loginUser api called ------000");
      final response = await _dio.post(_loginUrl, data: loginData);
      if (response.statusCode == 200 && response.data['success'] == true) {
        print("------------- kdfkd ======");
        return response.data['message'] ?? 'User Login Successfully';
      } else {
        print("------------- eror ======");
        throw Exception(response.data['message'] ?? 'Login failed');
      }
    } catch (error) {
      print("Login Error: $error");
      return 'Error While Login User';
    }
  }
}
