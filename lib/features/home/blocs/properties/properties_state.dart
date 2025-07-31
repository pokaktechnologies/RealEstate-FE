
import 'package:equatable/equatable.dart';
import 'package:realestate_fe/models/rent_properties_model.dart';
import 'package:realestate_fe/models/ideal_pg_model.dart';

class PropertiesState extends Equatable {
  final bool isLoading;
  final String? error;
  final List<RentPropertiesModel> propertiesList;
  final List<RentPropertiesModel> trendingProperties;
  final List<IdealPgModel> idealPGList;

  const PropertiesState({
    this.isLoading = false,
    this.error,
    this.propertiesList = const [],
    this.trendingProperties = const [],
    this.idealPGList = const [],
  });

  PropertiesState copyWith({
    bool? isLoading,
    String? error,
    List<RentPropertiesModel>? propertiesList,
    List<RentPropertiesModel>? trendingProperties,
    List<IdealPgModel>? idealPGList,
  }) {
    return PropertiesState(
      isLoading: isLoading ?? this.isLoading,
      error: error,
      propertiesList: propertiesList ?? this.propertiesList,
      trendingProperties: trendingProperties ?? this.trendingProperties,
      idealPGList: idealPGList ?? this.idealPGList,
    );
  }

  @override
  List<Object?> get props =>
      [isLoading, error, propertiesList, trendingProperties, idealPGList];
}
