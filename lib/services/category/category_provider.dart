import 'package:dio/dio.dart';
import 'package:realestate_fe/core/api/api_constants.dart';

import 'package:realestate_fe/models/rent_properties_model.dart';

class CategoryProvider {
  final Dio _dio = Dio();

  Future<List<RentPropertiesModel>> fetchCategory(String category) async {
    try {
      final response =
          await _dio.get("${ApiConstants.propertiesByCategory}$category");

      if (response.statusCode == 200 && response.data['status'] == '1') {
        final List data = response.data['data'];
        return data.map((e) => RentPropertiesModel.fromJson(e)).toList();
      } else {
        return [];
      }
    } catch (e) {
      throw Exception("Failed to fetch category: $e");
    }
  }
}
