import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:realestate_fe/features/home/home_bloc/properties_event.dart';
import 'package:realestate_fe/features/home/home_bloc/properties_state.dart';
import 'package:realestate_fe/services/home/home_repository.dart';

class PropertiesBloc extends Bloc<PropertiesEvent, PropertiesState> {
  final HomeRepository homeRepository;

  PropertiesBloc(this.homeRepository) : super(const PropertiesState()) {
    on<LoadProperties>((event, emit) async {
      emit(state.copyWith(isLoading: true, error: null));
      try {
        final props = await homeRepository.getAllProperties();
        emit(state.copyWith(isLoading: false, propertiesList: props));
      } catch (_) {
        emit(state.copyWith(
            isLoading: false, error: "Failed to fetch properties"));
      }
    });

    on<LoadTrendingPropertiesNearYou>((event, emit) async {
      emit(state.copyWith(isLoading: true, error: null));
      try {
        final trending = await homeRepository.getTrendingPropertiesNearYou(
          latitude: event.latitude,
          longitude: event.longitude,
          radius: event.radius,
          category: event.category,
        );
        emit(state.copyWith(isLoading: false, trendingProperties: trending));
      } catch (_) {
        emit(state.copyWith(
            isLoading: false, error: "Failed to fetch trending properties"));
      }
    });

    on<LoadIdealPGProperties>((event, emit) async {
      emit(state.copyWith(isLoading: true, error: null));
      try {
        final pgList = await homeRepository.getIdealPGProperties();
        emit(state.copyWith(isLoading: false, idealPGList: pgList));
      } catch (_) {
        emit(state.copyWith(
            isLoading: false, error: "Failed to fetch Ideal PG properties"));
      }
    });
    on<LoadrentProperties>((event, emit) async {
      emit(state.copyWith(isLoading: true, error: null));
      try {
        final rentList = await homeRepository.getAllRentProperties();
        emit(state.copyWith(isLoading: false, rentpropertiesList: rentList));
      } catch (_) {
        emit(state.copyWith(
            isLoading: false, error: "Failed to fetch Rent properties"));
      }
    });
  }
}
