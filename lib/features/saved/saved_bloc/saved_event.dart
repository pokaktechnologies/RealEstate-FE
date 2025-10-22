import 'package:equatable/equatable.dart';

abstract class SavedEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class FetchSavedProperties extends SavedEvent {}

class AddSavedProperty extends SavedEvent {
  final int propertyId;
  AddSavedProperty(this.propertyId);
}

class RemoveSavedProperty extends SavedEvent {
  final int savedId;
  RemoveSavedProperty(this.savedId);
}
