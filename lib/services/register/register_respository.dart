import 'package:realestate_fe/services/register/register_provider.dart';

class RegisterRespository {
  final _provider = RegisterProvider();

  Future<String> registerUser(Map<String, dynamic> userData) {
    return _provider.registerUser(userData);
  }
}
