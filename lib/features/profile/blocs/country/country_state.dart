import 'package:equatable/equatable.dart';
import 'package:realestate_fe/models/country_model.dart';

abstract class CountryState extends Equatable {
  const CountryState();

  @override
  List<Object?> get props => [];
}

class CountryInitial extends CountryState {}

class CountryLoading extends CountryState {}

class CountryLoaded extends CountryState {
  final CountryModel countryModel;
  final int? selectedCountryId;

  const CountryLoaded(this.countryModel, {this.selectedCountryId});

  CountryLoaded copyWith({int? selectedCountryId}) {
    return CountryLoaded(
      countryModel,
      selectedCountryId: selectedCountryId ?? this.selectedCountryId,
    );
  }

  @override
  List<Object?> get props => [countryModel, selectedCountryId];
}

class CountryError extends CountryState {
  final String? message;

  const CountryError(this.message);
}
