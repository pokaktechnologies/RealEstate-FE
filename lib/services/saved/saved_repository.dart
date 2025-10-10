// lib/repositories/saved_repository.dart
import 'package:realestate_fe/models/propertydetails_model.dart';
import 'package:realestate_fe/services/saved/saved_provider.dart';

class SavedRepository {
  final SavedProvider _provider = SavedProvider();

  Future<List<PropertyDetailsModel>> getSavedProperties() async {
    return await _provider.getSavedProperties();
  }

  Future<void> addSavedProperty(int propertyId) async {
    await _provider.addSavedProperty(propertyId);
  }

  Future<void> removeSavedProperty(int savedId) async {
    await _provider.removeSavedProperty(savedId);
  }
}
