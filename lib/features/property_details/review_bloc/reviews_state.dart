import 'package:equatable/equatable.dart';
import 'package:realestate_fe/models/reviews_model.dart';

abstract class ReviewsState extends Equatable {
  @override
  List<Object?> get props => [];
}

class ReviewsInitial extends ReviewsState {}

class ReviewsLoading extends ReviewsState {}

class ReviewsLoaded extends ReviewsState {
  final ReviewModel reviewResponse;

  ReviewsLoaded(this.reviewResponse);

  @override
  List<Object?> get props => [reviewResponse];
}

class ReviewsError extends ReviewsState {
  final String message;

  ReviewsError(this.message);

  @override
  List<Object?> get props => [message];
}
