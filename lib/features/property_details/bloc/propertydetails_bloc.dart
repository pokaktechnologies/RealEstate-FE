import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:realestate_fe/models/propertydetails_model.dart';
import 'package:realestate_fe/services/property/property_repository.dart';

part 'propertydetails_event.dart';
part 'propertydetails_state.dart';

class PropertydetailsBloc
    extends Bloc<PropertydetailsEvent, PropertydetailsState> {
  final PropertyRepository propertyRepository;

  PropertydetailsBloc(this.propertyRepository)
      : super(PropertydetailsInitial()) {
    on<LoadPropertyDetails>(_onLoadPropertyDetails);
  }

  Future<void> _onLoadPropertyDetails(
    LoadPropertyDetails event,
    Emitter<PropertydetailsState> emit,
  ) async {
    emit(PropertydetailsLoading());
    try {
      final property =
          await propertyRepository.getPropertyById(event.propertyId);
      emit(PropertydetailsLoaded(property));
    } catch (e) {
      emit(PropertydetailsError(e.toString()));
    }
  }
}
