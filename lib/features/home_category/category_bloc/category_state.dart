import 'package:equatable/equatable.dart';
import 'package:realestate_fe/models/rent_properties_model.dart';

class CategoryState extends Equatable {
  final bool isLoading;
  final List<RentPropertiesModel> categoryProperties;
  final String? error;

  const CategoryState({
    this.isLoading = false,
    this.categoryProperties = const [],
    this.error,
  });

  CategoryState copyWith({
    bool? isLoading,
    List<RentPropertiesModel>? categoryProperties,
    String? error,
  }) {
    return CategoryState(
      isLoading: isLoading ?? this.isLoading,
      categoryProperties: categoryProperties ?? this.categoryProperties,
      error: error,
    );
  }

  @override
  List<Object?> get props => [isLoading, categoryProperties, error];
}
