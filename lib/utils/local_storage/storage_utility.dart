import 'package:get_storage/get_storage.dart';

class RLocalStorage {
  static final RLocalStorage _instance = RLocalStorage._internal();

  factory RLocalStorage() {
    return _instance;
  }

  RLocalStorage._internal();

  final _storage = GetStorage();

  // Generic methods
  Future<void> saveData<T>(String key, T value) async {
    await _storage.write(key, value);
  }

  T? readData<T>(String key) {
    return _storage.read<T>(key);
  }

  Future<void> removeData(String key) async {
    await _storage.remove(key);
  }

  Future<void> clearAll() async {
    await _storage.erase();
  }
}