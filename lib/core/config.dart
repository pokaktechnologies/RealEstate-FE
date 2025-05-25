import 'package:flutter_dotenv/flutter_dotenv.dart';
class ApiConfig {
  static String serverUrl =
      dotenv.env['SERVER_URL'] ?? 'http://93.127.167.39:8001';
}
