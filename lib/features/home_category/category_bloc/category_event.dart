import 'package:equatable/equatable.dart';

abstract class CategoryEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class FetchCategoryEvent extends CategoryEvent {
  final String category;

  FetchCategoryEvent(this.category);

  @override
  List<Object?> get props => [category];
}
