import 'package:realestate_fe/core/api/api_constants.dart';
import 'package:realestate_fe/core/api/dio_client.dart';
import 'package:realestate_fe/models/rent_properties_model.dart';

class HomeProvider {
  final String propertyUrl = ApiConstants.propertiesRentalEndPoint;

  Future<String> getProperties() async {
    try {
      final dio = await DioClient().getAuthorizedDio();

      final response = await dio.get(propertyUrl);

      if (response.statusCode == 200) {
        print("success");
        return "success";
      } else {
        print("failure");
        return "failure";
      }
    } catch (error, stackTrace) {
      print("Exception occured: $error stackTrace $stackTrace");
      return "fail";
      // return RentPropertiesModel.withError("Data not found/ Connection issue");
    }
  }
}
