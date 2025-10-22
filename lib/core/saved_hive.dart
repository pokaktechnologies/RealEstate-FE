import 'package:hive_flutter/hive_flutter.dart';

class SavedHiveService {
  static const String _boxName = 'saved_properties';

  static Future<void> init() async {
    await Hive.initFlutter();
    await Hive.openBox<int>(_boxName);
  }

  static Box<int> get _box => Hive.box<int>(_boxName);

  static List<int> getSavedPropertyIds() {
    return _box.values.toList();
  }

  static Future<void> addSavedProperty(int id) async {
    if (!_box.values.contains(id)) {
      await _box.add(id);
    }
  }

  static Future<void> removeSavedProperty(int id) async {
    final key = _box.keys.firstWhere(
      (k) => _box.get(k) == id,
      orElse: () => null,
    );
    if (key != null) {
      await _box.delete(key);
    }
  }

  static bool isPropertySaved(int id) {
    return _box.values.contains(id);
  }

  static Future<void> clearAll() async {
    await _box.clear();
  }
}
