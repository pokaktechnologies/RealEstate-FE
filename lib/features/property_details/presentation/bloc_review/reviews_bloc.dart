import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:realestate_fe/services/reviews/reviews_repository.dart';

import 'reviews_event.dart';
import 'reviews_state.dart';

class ReviewsBloc extends Bloc<ReviewsEvent, ReviewsState> {
  final ReviewRepository repository;

  ReviewsBloc(this.repository) : super(ReviewsInitial()) {
    on<FetchReviews>(_onFetchReviews);
  }

  Future<void> _onFetchReviews(
      FetchReviews event, Emitter<ReviewsState> emit) async {
    emit(ReviewsLoading());
    try {
      final response = await repository.getReviews(event.propertyId);
      emit(ReviewsLoaded(response));
    } catch (e) {
      emit(ReviewsError(e.toString()));
    }
  }
}
