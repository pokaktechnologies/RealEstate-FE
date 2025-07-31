part of 'propertydetails_bloc.dart';

abstract class PropertydetailsEvent extends Equatable {
  const PropertydetailsEvent();

  @override
  List<Object?> get props => [];
}

class LoadPropertyDetails extends PropertydetailsEvent {
  final int propertyId;

  const LoadPropertyDetails(this.propertyId);

  @override
  List<Object?> get props => [propertyId];
}
