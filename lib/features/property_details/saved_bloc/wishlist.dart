import 'package:flutter_bloc/flutter_bloc.dart';

// EVENTS
abstract class FavoriteEvent {}

class ToggleFavoriteEvent extends FavoriteEvent {}

// STATES
abstract class FavoriteState {}

class FavoriteBorderState extends FavoriteState {} // Initial state

class FavoriteFilledState extends FavoriteState {} // When toggled

// BLOC
class FavoriteBloc extends Bloc<FavoriteEvent, FavoriteState> {
  FavoriteBloc() : super(FavoriteBorderState()) {
    on<ToggleFavoriteEvent>((event, emit) {
      if (state is FavoriteBorderState) {
        emit(FavoriteFilledState()); // Change to filled
      } else {
        emit(FavoriteBorderState()); // Change to border
      }
    });
  }
}
