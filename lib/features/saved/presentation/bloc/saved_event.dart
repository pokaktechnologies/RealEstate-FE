import 'package:equatable/equatable.dart';

abstract class SavedEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class GetSavedProperties extends SavedEvent {}

class AddSavedProperty extends SavedEvent {
  final int propertyId;
  AddSavedProperty(this.propertyId);

  @override
  List<Object?> get props => [propertyId];
}

class RemoveSavedProperty extends SavedEvent {
  final int savedId;
  RemoveSavedProperty(this.savedId);

  @override
  List<Object?> get props => [savedId];
}
