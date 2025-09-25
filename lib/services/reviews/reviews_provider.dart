import 'package:realestate_fe/core/api/api_constants.dart';
import 'package:realestate_fe/core/api/dio_client.dart';
import 'package:realestate_fe/models/reviews_model.dart';


class ReviewProvider {
  Future<ReviewModel> getReviews(int propertyId) async {
    final dio = await DioClient().getAuthorizedDio();
    final response = await dio.get(ApiConstants.getPropertyReviews(propertyId));

    if (response.statusCode == 200) {
      return ReviewModel.fromJson(response.data);
    } else {
      throw Exception("Failed to fetch reviews");
    }
  }
}
