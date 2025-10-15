part of 'propertydetails_bloc.dart';

abstract class PropertydetailsState extends Equatable {
  const PropertydetailsState();

  @override
  List<Object?> get props => [];
}

class PropertydetailsInitial extends PropertydetailsState {}

class PropertydetailsLoading extends PropertydetailsState {}

class PropertydetailsError extends PropertydetailsState {
  final String error;
  const PropertydetailsError(this.error);

  @override
  List<Object?> get props => [error];
}

class PropertydetailsLoaded extends PropertydetailsState {
  final PropertyDetailsModel property;

  const PropertydetailsLoaded(this.property);

  @override
  List<Object?> get props => [property];
}
