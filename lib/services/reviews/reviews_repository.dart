

import 'package:realestate_fe/models/reviews_model.dart';
import 'package:realestate_fe/services/reviews/reviews_provider.dart';

class ReviewRepository {
  final _provider = ReviewProvider();

  Future<ReviewModel> getReviews(int propertyId) {
    return _provider.getReviews(propertyId);
  }
}
