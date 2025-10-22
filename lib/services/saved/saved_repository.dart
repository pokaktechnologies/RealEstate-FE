// import 'package:realestate_fe/models/saved_model.dart';
// import 'package:realestate_fe/services/saved/saved_provider.dart';

// class SavedRepository {
//   final SavedProvider _provider = SavedProvider();

//   Future<List<SavedPropertyModel>> getSavedProperties() async {
//     return await _provider.getSavedProperties();
//   }

//   Future<void> addSavedProperty(int propertyId) async {
//     await _provider.addSavedProperty(propertyId);
//   }

//   Future<void> removeSavedProperty(int savedId) async {
//     await _provider.removeSavedProperty(savedId);
//   }
// }
import 'package:realestate_fe/models/saved_model.dart';
import 'saved_provider.dart';

class SavedRepository {
  final SavedProvider _provider = SavedProvider();

  Future<List<SavedPropertyModel>> getSavedProperties() async {
    return await _provider.getSavedProperties();
  }

  Future<void> addSavedProperty(int propertyId) async {
    await _provider.addSavedProperty(propertyId);
  }

  Future<void> removeSavedProperty(int savedId) async {
    await _provider.removeSavedProperty(savedId);
  }
}
