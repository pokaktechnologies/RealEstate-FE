import 'package:dio/dio.dart';
import 'package:realestate_fe/core/api/api_constants.dart';
import 'package:realestate_fe/core/api/dio_client.dart';
import 'package:realestate_fe/models/contact_info_model.dart';
import 'package:realestate_fe/models/contact_model.dart';
import 'package:realestate_fe/models/country_model.dart';
import 'package:realestate_fe/models/profile_model.dart';
import 'package:realestate_fe/models/state_model.dart';

class ProfileProvider {
  final String profileUrl = ApiConstants.profileEndPoint;
  final String countryUrl = ApiConstants.countryEndPoint;
  final String contactUrl = ApiConstants.contactEndPoint;

  Future<ProfileModel> getUserProfile() async {
    try {
      final dio = await DioClient().getAuthorizedDio();
      Response response = await dio.get(profileUrl);

      return ProfileModel.fromJson(response.data);
    } catch (error, stacktrace) {
      print("Exception occured: $error stackTrace $stacktrace");
      return ProfileModel.withError("Data not found/ Connection issue");
    }
  }

  Future<CountryModel> getCountry() async {
    try {
      final dio = await DioClient().getAuthorizedDio();
      Response response = await dio.get(countryUrl);
      return CountryModel.fromJson(response.data);
    } catch (error, stacktrace) {
      print("Country fetch error: $error stackTrace: $stacktrace");
      return CountryModel.withError(
          "Country data not found / connection issue");
    }
  }

  Future<StateModel> getStatesByCountryId(String countryId) async {
    try {
      final dio = await DioClient().getAuthorizedDio();
      final stateUrl = ApiConstants.getStateByCountryId(countryId);
      Response response = await dio.get(stateUrl);
      return StateModel.fromJson(response.data);
    } catch (error, stacktrace) {
      print("State fetch error: $error stackTrace: $stacktrace");
      return StateModel.withError("State data not found / connection issue");
    }
  }

  Future<void> postContact(ContactData data) async {
    try {
      final dio = await DioClient().getAuthorizedDio();
      final response = await dio.post(
        contactUrl,
        data: data.toJson(),
      );

      if (response.statusCode != 200 && response.statusCode != 201) {
        throw Exception("Failed to post contact info: ${response.statusCode}");
      }

      print("Contact info posted successfully");
    } on DioException catch (e) {
      print("Dio error occurred: ${e.response?.data}");
      rethrow;
    } catch (e) {
      print("Unknown error occurred: $e");
      rethrow;
    }
  }

  Future<ContactInfoModel> getContact() async {
    try {
      final dio = await DioClient().getAuthorizedDio();
      final response = await dio.get(contactUrl);

      return ContactInfoModel.fromJson(response.data);
    } catch (error, stacktrace) {
      print("Contact fetch error: $error stackTrace: $stacktrace");
      return ContactInfoModel.withError(
          "Contact info not found / connection issue");
    }
  }
}
