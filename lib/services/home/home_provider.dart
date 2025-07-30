import 'package:flutter/material.dart';
import 'package:realestate_fe/core/api/api_constants.dart';
import 'package:realestate_fe/core/api/dio_client.dart';
import 'package:realestate_fe/models/rent_properties_model.dart';

class HomeProvider {
  final String propertyUrl = ApiConstants.propertiesRentalEndPoint;
  final String trendingPropertiesUrl =
      ApiConstants.trendingPropertiesNearYouEndPoint;

// RENTAL 
  Future<List<RentPropertiesModel>> getProperties() async {
    try {
      final dio = await DioClient().getAuthorizedDio();
      final response = await dio.get(propertyUrl);

      if (response.statusCode == 200) {
        print("success");
        final List<dynamic> data = response.data['data'];

        return data.map((json) => RentPropertiesModel.fromJson(json)).toList();
      } else {
        print("failure");
        throw Exception('Failed to fetch properties');
      }
    } catch (error, stackTrace) {
      debugPrint("Exception occurred: $error \nStackTrace: $stackTrace");
      throw Exception('Failed to fetch properties: $error');
    }
  }
// NEAREST
  Future<List<RentPropertiesModel>> getTrendingPropertiesNearYou({
    required double latitude,
    required double longitude,
    required int radius,
    required String category,
  }) async {
    try {
      final dio = await DioClient().getAuthorizedDio();
      final response = await dio.get(
        trendingPropertiesUrl,
        queryParameters: {
          'latitude': latitude,
          'longitude': longitude,
          'radius': radius,
          'category': category,
        },
      );

      if (response.statusCode == 200) {
        debugPrint("Success fetching trending properties");
        final List<dynamic> data = response.data['data'];

        return data.map((json) => RentPropertiesModel.fromJson(json)).toList();
      } else {
        debugPrint("Failure fetching trending properties");
        throw Exception('Failed to fetch trending properties');
      }
    } catch (error, stackTrace) {
      debugPrint("Exception occurred: $error \nStackTrace: $stackTrace");
      throw Exception('Failed to fetch trending properties: $error');
    }
  }
}
