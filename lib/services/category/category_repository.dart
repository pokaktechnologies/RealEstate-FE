import 'package:realestate_fe/models/rent_properties_model.dart';
import 'package:realestate_fe/services/category/category_provider.dart';

class CategoryRepository {
  final CategoryProvider _provider = CategoryProvider();

  Future<List<RentPropertiesModel>> getCategoryProperties(String category) {
    return _provider.fetchCategory(category);
  }
}
