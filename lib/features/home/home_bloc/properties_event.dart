import 'package:equatable/equatable.dart';

abstract class PropertiesEvent extends Equatable {
  const PropertiesEvent();
}

class LoadProperties extends PropertiesEvent {
  const LoadProperties();

  @override
  List<Object?> get props => [];
}

class LoadTrendingPropertiesNearYou extends PropertiesEvent {
  final double latitude;
  final double longitude;
  final int radius;
  final String category;

  const LoadTrendingPropertiesNearYou({
    required this.latitude,
    required this.longitude,
    required this.radius,
    required this.category,
  });

  @override
  List<Object?> get props => [latitude, longitude, radius, category];
}

class LoadIdealPGProperties extends PropertiesEvent {
  const LoadIdealPGProperties();

  @override
  List<Object?> get props => [];
}

class LoadrentProperties extends PropertiesEvent {
  const LoadrentProperties();

  @override
  List<Object?> get props => [];
}
