import 'package:realestate_fe/core/api/api_constants.dart';
import 'package:realestate_fe/core/api/dio_client.dart';
import 'package:realestate_fe/models/propertydetails_model.dart';

class PropertyProvider {
  final String propertyById = ApiConstants.propertyByIdEndPoint;

  Future<PropertyDetailsModel> getPropertyById(int propertyid) async {
    final dio = await DioClient().getAuthorizedDio();
    final response =
        await dio.get("${ApiConstants.propertyByIdEndPoint}/$propertyid/");

    if (response.statusCode == 200) {
      final data = response.data['data'];
      return PropertyDetailsModel.fromJson(data);
    } else {
      throw Exception('Failed to fetch property by ID');
    }
  }
}
