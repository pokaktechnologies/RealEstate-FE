// dio_client.dart
import 'package:dio/dio.dart';
import 'package:realestate_fe/core/services.dart';

class DioClient {
  static final DioClient _instance = DioClient._internal();
  final Dio _dio = Dio();

  factory DioClient() => _instance;

  DioClient._internal();

  Future<Dio> getAuthorizedDio() async {
    final token = await SecureStorageService().getToken();

    if (token != null) {
      _dio.options.headers['Authorization'] = 'Bearer $token';
    } else {
      throw Exception('No token found');
    }

    return _dio;
  }
}
