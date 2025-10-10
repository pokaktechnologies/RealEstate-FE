// lib/providers/saved_provider.dart
import 'package:realestate_fe/core/api/api_constants.dart';
import 'package:realestate_fe/core/api/dio_client.dart';
import 'package:realestate_fe/models/propertydetails_model.dart';

class SavedProvider {
  Future<List<PropertyDetailsModel>> getSavedProperties() async {
    final dio = await DioClient().getAuthorizedDio();
    final response = await dio.get(ApiConstants.savedProperties);

    return (response.data as List)
        .map((e) => PropertyDetailsModel.fromJson(e))
        .toList();
  }

  Future<void> addSavedProperty(int propertyId) async {
    final dio = await DioClient().getAuthorizedDio();
    await dio.post(ApiConstants.savedProperties, data: {
      "property_id": propertyId,
    });
  }

  Future<void> removeSavedProperty(int savedId) async {
    final dio = await DioClient().getAuthorizedDio();
    await dio.delete(ApiConstants.deleteSaved(savedId));
  }
}
