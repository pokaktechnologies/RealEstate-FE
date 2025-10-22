import 'package:equatable/equatable.dart';
import 'package:realestate_fe/models/saved_model.dart';

abstract class SavedState extends Equatable {
  @override
  List<Object?> get props => [];
}

class SavedInitial extends SavedState {}

class SavedLoading extends SavedState {}

class SavedEmpty extends SavedState {}

class SavedLoaded extends SavedState {
  final List<SavedPropertyModel> properties;
  SavedLoaded(this.properties);

  @override
  List<Object?> get props => [properties];
}

class SavedDeleted extends SavedState {}

class SavedError extends SavedState {
  final String message;
  SavedError(this.message);

  @override
  List<Object?> get props => [message];
}
