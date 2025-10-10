import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:realestate_fe/features/saved/presentation/bloc/saved_event.dart';
import 'package:realestate_fe/features/saved/presentation/bloc/saved_state.dart';
import 'package:realestate_fe/models/propertydetails_model.dart';
import 'package:realestate_fe/services/saved/saved_repository.dart';

class SavedBloc extends Bloc<SavedEvent, SavedState> {
  final SavedRepository repository;

  SavedBloc(this.repository) : super(SavedInitial()) {
    on<GetSavedProperties>(_onGetSavedProperties);
    on<AddSavedProperty>(_onAddSavedProperty);
    on<RemoveSavedProperty>(_onRemoveSavedProperty);
  }

  Future<void> _onGetSavedProperties(
      GetSavedProperties event, Emitter<SavedState> emit) async {
    emit(SavedLoading());
    try {
      final List<PropertyDetailsModel> savedList =
          await repository.getSavedProperties();
      emit(SavedLoaded(savedList));
    } catch (e) {
      emit(SavedError(e.toString()));
    }
  }

  Future<void> _onAddSavedProperty(
      AddSavedProperty event, Emitter<SavedState> emit) async {
    try {
      await repository.addSavedProperty(event.propertyId);
      add(GetSavedProperties());
    } catch (e) {
      emit(SavedError(e.toString()));
    }
  }

  Future<void> _onRemoveSavedProperty(
      RemoveSavedProperty event, Emitter<SavedState> emit) async {
    try {
      await repository.removeSavedProperty(event.savedId);
      add(GetSavedProperties());
    } catch (e) {
      emit(SavedError(e.toString()));
    }
  }
}
