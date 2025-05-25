import 'package:dio/dio.dart';
import 'package:realestate_fe/core/api/api_constants.dart';

class RegisterProvider {
  final Dio _dio = Dio();
  final String _postUrl = ApiConstants.registerEndPoint;

  Future<String> registerUser(Map<String, dynamic> userData) async {
    try {
      final response = await _dio.post(_postUrl, data: userData);
      return response.data['message'] ?? 'User Created Successfully';
    } catch (error) {
      print("POST Error: $error");
      return 'Error While Creating User';
    }
  }
}
