import 'package:flutter_secure_storage/flutter_secure_storage.dart';

abstract class AppSecureStorageValueKey{

  static String appPincode = 'appPincode'; 
}

class AppSecureStorage {
  // Единственный экземпляр
  static final AppSecureStorage _instance = AppSecureStorage._internal();
  final FlutterSecureStorage _storage = const FlutterSecureStorage();

  factory AppSecureStorage() {
    return _instance;
  }

  AppSecureStorage._internal();

  Future<void> write({required String key,required String value}) async {
    await _storage.write(key: key, value: value);
  }

  Future<String?> read(String key) async {
    return await _storage.read(key: key);
  }

  Future<void> delete(String key) async {
    await _storage.delete(key: key);
  }
}


