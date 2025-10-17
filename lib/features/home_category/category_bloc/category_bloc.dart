import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:realestate_fe/features/home_category/category_bloc/category_event.dart';
import 'package:realestate_fe/features/home_category/category_bloc/category_state.dart';
import 'package:realestate_fe/services/category/category_repository.dart';

class CategoryBloc extends Bloc<CategoryEvent, CategoryState> {
  final CategoryRepository repository;

  CategoryBloc(this.repository) : super(const CategoryState()) {
    on<FetchCategoryEvent>(_onFetchCategory);
  }

  Future<void> _onFetchCategory(
      FetchCategoryEvent event, Emitter<CategoryState> emit) async {
    emit(state.copyWith(isLoading: true, error: null));

    try {
      final data = await repository.getCategoryProperties(event.category);
      emit(state.copyWith(isLoading: false, categoryProperties: data));
    } catch (e) {
      emit(state.copyWith(isLoading: false, error: e.toString()));
    }
  }
}
