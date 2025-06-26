import 'package:realestate_fe/models/rent_properties_model.dart';
import 'package:realestate_fe/services/home/home_provider.dart';

class HomeRepository {
  final _provider = HomeProvider();

  Future<List<RentPropertiesModel>> getAllProperties() {
    return _provider.getProperties();
  }
}
