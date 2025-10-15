
import 'package:equatable/equatable.dart';

abstract class CountryEvent extends Equatable {
  const CountryEvent();

  @override
  List<Object> get props => [];
}

class GetCountryList extends CountryEvent {}

class SelectCountry extends CountryEvent {
  final int selectedCountryId;

  const SelectCountry(this.selectedCountryId);

  @override
  List<Object> get props => [selectedCountryId];
}
