import 'package:realestate_fe/services/home/home_provider.dart';

class HomeRepository {
  final _provider = HomeProvider();

  Future<String> getAllProperties() {
    return _provider.getProperties();
  }
}
