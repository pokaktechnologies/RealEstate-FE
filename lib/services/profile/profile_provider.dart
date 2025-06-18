import 'dart:io';

import 'package:dio/dio.dart';
import 'package:realestate_fe/core/api/api_constants.dart';
import 'package:realestate_fe/core/api/dio_client.dart';
import 'package:realestate_fe/models/contact_info_model.dart';
import 'package:realestate_fe/models/contact_model.dart';
import 'package:realestate_fe/models/country_model.dart';
import 'package:realestate_fe/models/personal_info_model.dart';
import 'package:realestate_fe/models/profile_model.dart';
import 'package:realestate_fe/models/state_model.dart';

class ProfileProvider {
  final String profileUrl = ApiConstants.profileEndPoint;
  final String countryUrl = ApiConstants.countryEndPoint;
  final String contactUrl = ApiConstants.contactEndPoint;
  final String personalUrl = ApiConstants.personalEndPoint;

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

// contact - post,get,
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

  // Personal Info- create,edit,update

  Future<PersonalInfoModel> getPersonalInfo() async {
    try {
      final dio = await DioClient().getAuthorizedDio();
      final response = await dio.get(personalUrl);
      return PersonalInfoModel.fromJson(response.data);
    } catch (error, stacktrace) {
      print("Personal Info fetch error: $error stackTrace: $stacktrace");
      return PersonalInfoModel.withError(
          "Personal info not found / connection issue");
    }
  }

  Future<PersonalInfoModel> updatePersonalInfo(
    Map<String, dynamic> data, {
    required String fullName,
    required String dob,
    required String gender,
    required String occupation,
    required int nationalityId,
    File? profileImageFile,
  }) async {
    try {
      final dio = await DioClient().getAuthorizedDio();

      final formData = FormData.fromMap({
        "full_name": fullName,
        "dob": dob,
        "gender": gender,
        "occupation": occupation,
        "nationality": nationalityId,
        if (profileImageFile != null)
          "profile_image": await MultipartFile.fromFile(
            profileImageFile.path,
            filename: profileImageFile.path.split('/').last,
          ),
      });

      final response = await dio.patch(
        ApiConstants.personalEndPoint,
        data: formData,
        options: Options(
          headers: {
            'Content-Type': 'multipart/form-data',
          },
        ),
      );

      return PersonalInfoModel.fromJson(response.data);
    } catch (error, stacktrace) {
      print("❌ Personal Info update error: $error stackTrace: $stacktrace");
      return PersonalInfoModel.withError("Failed to update personal info");
    }
  }
}
