import 'package:realestate_fe/models/rent_properties_model.dart';
import 'package:realestate_fe/services/home/home_provider.dart';

class HomeRepository {
  final _provider = HomeProvider();
  Future<List<RentPropertiesModel>> getIdealPGProperties() {
    return _provider.getIdealPGProperties();
  }

  Future<List<RentPropertiesModel>> getAllProperties() {
    return _provider.getProperties();
  }

  Future<List<RentPropertiesModel>> getTrendingPropertiesNearYou({
    required double latitude,
    required double longitude,
    required int radius,
    required String category,
  }) {
    return _provider.getTrendingPropertiesNearYou(
      latitude: latitude,
      longitude: longitude,
      radius: radius,
      category: category,
    );
  }

  Future<List<RentPropertiesModel>> getAllRentProperties() {
    return _provider.getcategoryProperties();
  }
}
