import 'package:realestate_fe/models/dealsmodel.dart';
import 'package:realestate_fe/services/deal/deals_provider.dart';

class DealRepository {
  final _provider = DealProvider();

  Future<List<DealModel>> getDeals() {
    return _provider.getDeals();
  }
}
