import 'package:realestate_fe/core/api/api_constants.dart';
import 'package:realestate_fe/core/api/dio_client.dart';
import 'package:realestate_fe/models/dealsmodel.dart';

class DealProvider {
  final String dealsEndpoint =
      ApiConstants.dealsEndPoint; // define in constants

  Future<List<DealModel>> getDeals() async {
    final dio = await DioClient().getAuthorizedDio();
    final response = await dio.get(dealsEndpoint);

    if (response.statusCode == 200) {
      final List data = response.data['data'];
      return data.map((e) => DealModel.fromJson(e)).toList();
    } else {
      throw Exception('Failed to fetch deals');
    }
  }
}
