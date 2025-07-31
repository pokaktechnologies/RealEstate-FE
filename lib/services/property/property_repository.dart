import 'package:realestate_fe/models/propertydetails_model.dart';
import 'package:realestate_fe/services/property/property_provider.dart';

class PropertyRepository {
  final _provider = PropertyProvider();

  Future<PropertyDetailsModel> getPropertyById(int id) {
    return _provider.getPropertyById(id);
  }
}
