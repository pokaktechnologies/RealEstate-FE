import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:realestate_fe/features/home/blocs/properties/properties_event.dart';
import 'package:realestate_fe/features/home/blocs/properties/properties_state.dart';
import 'package:realestate_fe/services/home/home_repository.dart';

class PropertiesBloc extends Bloc<PropertiesEvent, PropertiesState> {
  final HomeRepository homeRepository;

  PropertiesBloc(this.homeRepository) : super(PropertiesInitial()) {
    on<LoadProperties>((event, emit) async {
      emit(PropertiesLoading());
      try {
        final message = await homeRepository.getAllProperties();
        emit(PropertiesSuccess(message));
      } catch (e) {
        emit(PropertiesError("Failed to Fetch Properties"));
      }
    });
  }
}
