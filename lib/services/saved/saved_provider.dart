// import 'package:realestate_fe/core/api/api_constants.dart';
// import 'package:realestate_fe/core/api/dio_client.dart';
// import 'package:realestate_fe/models/saved_model.dart';

// class SavedProvider {
//   Future<List<SavedPropertyModel>> getSavedProperties() async {
//     final dio = await DioClient().getAuthorizedDio();
//     final response = await dio.get(ApiConstants.savedProperties);

//     final data = response.data['data'] as List;
//     return data.map((e) => SavedPropertyModel.fromJson(e)).toList();
//   }

//   Future<void> addSavedProperty(int propertyId) async {
//     final dio = await DioClient().getAuthorizedDio();
//     await dio.post(ApiConstants.savedProperties, data: {
//       "property_id": propertyId,
//     });
//   }

//   Future<void> removeSavedProperty(int savedId) async {
//     try {
//       final dio = await DioClient().getAuthorizedDio();
//       final response = await dio.delete(ApiConstants.deleteSaved(savedId));

//       // check status code
//       if (response.statusCode != 200 && response.statusCode != 204) {
//         throw Exception('Failed to delete property: ${response.statusCode}');
//       }

//       // optionally check body message
//       if (response.data['status'] != "1") {
//         throw Exception(
//             'Failed to delete property: ${response.data['message']}');
//       }
//     } catch (e) {
//       print('Remove API error: $e'); // debug log
//       rethrow;
//     }
//   }
// }
import 'package:realestate_fe/core/api/api_constants.dart';
import 'package:realestate_fe/core/api/dio_client.dart';
import 'package:realestate_fe/models/saved_model.dart';

class SavedProvider {
  Future<List<SavedPropertyModel>> getSavedProperties() async {
    final dio = await DioClient().getAuthorizedDio();
    final response = await dio.get(ApiConstants.savedProperties);

    final data = response.data['data'] as List;
    return data.map((e) => SavedPropertyModel.fromJson(e)).toList();
  }

  Future<void> addSavedProperty(int propertyId) async {
    final dio = await DioClient().getAuthorizedDio();
    await dio.post(ApiConstants.savedProperties, data: {
      "property_id": propertyId,
    });
  }

  Future<void> removeSavedProperty(int savedId) async {
    try {
      final dio = await DioClient().getAuthorizedDio();
      final response = await dio.delete(ApiConstants.deleteSaved(savedId));

      // 204 = deleted successfully
      if (response.statusCode == 204) return;

      // check body if status available
      if (response.data['status'] != "1") {
        throw Exception(
            'Failed to delete property: ${response.data['message']}');
      }
    } catch (e) {
      print('Remove API error: $e');
      rethrow;
    }
  }
}
