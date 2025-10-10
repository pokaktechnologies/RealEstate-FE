
import 'package:equatable/equatable.dart';
import 'package:realestate_fe/models/propertydetails_model.dart';

abstract class SavedState extends Equatable {
  @override
  List<Object?> get props => [];
}

class SavedInitial extends SavedState {}

class SavedLoading extends SavedState {}

class SavedLoaded extends SavedState {
  final List<PropertyDetailsModel> savedList;
  SavedLoaded(this.savedList);

  @override
  List<Object?> get props => [savedList];
}

class SavedError extends SavedState {
  final String message;
  SavedError(this.message);

  @override
  List<Object?> get props => [message];
}
