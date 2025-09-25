import 'package:equatable/equatable.dart';

abstract class ReviewsEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class FetchReviews extends ReviewsEvent {
  final int propertyId;

  FetchReviews(this.propertyId);

  @override
  List<Object?> get props => [propertyId];
}
