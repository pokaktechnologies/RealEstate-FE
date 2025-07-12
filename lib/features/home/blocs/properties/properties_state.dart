import 'package:equatable/equatable.dart';
import 'package:realestate_fe/models/rent_properties_model.dart';

abstract class PropertiesState extends Equatable {
  const PropertiesState();

  @override
  List<Object?> get props => [];
}

class PropertiesInitial extends PropertiesState {}

class PropertiesLoading extends PropertiesState {}

class PropertiesSuccess extends PropertiesState {
  final List<RentPropertiesModel> propertiesList;
  const PropertiesSuccess(this.propertiesList);

  @override
  List<Object?> get props => [propertiesList];
}

class PropertiesError extends PropertiesState {
  final String message;

  const PropertiesError(this.message);

  @override
  List<Object?> get props => [message];
}
