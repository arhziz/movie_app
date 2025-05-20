import 'package:flutter/foundation.dart' show immutable;
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

/// {@template cache_manager}
/// A class that manages secure storage.
/// It provides methods to set, get, remove, and check the existence of
/// values in secure storage.
/// {@endtemplate}
@immutable
class CacheManager {

  /// {@macro cache_manager}
  /// This class is a singleton, so it cannot be instantiated directly.
  
  const CacheManager();

  
  static const _androidOptions =
      AndroidOptions(encryptedSharedPreferences: true);
  static const _iosOptions =
      IOSOptions(accessibility: KeychainAccessibility.first_unlock);

  static const FlutterSecureStorage _secureStorage =
      FlutterSecureStorage(iOptions: _iosOptions, aOptions: _androidOptions);

  /// Sets a string value in secure storage.
  /// [key] is the key to store the value under.
  /// [value] is the value to store.
  /// Returns a [Future] that completes when the value is set.
  /// Throws an [Exception] if the value could not be set.
  static Future<void> setString(String key, String value) =>
      _secureStorage.write(key: key, value: value);

  /// Sets a boolean value in secure storage.
  static Future<void> setBool(String key, {bool value = false}) =>
      _secureStorage.write(key: key, value: value.toString());

  /// Gets a string value from secure storage.
  /// [key] is the key to retrieve the value from.
  /// Returns a [Future] that completes with the value.
  /// Returns `null` if the value does not exist.
  static Future<String?> getString(String key) => _secureStorage.read(key: key);

  /// Gets a boolean value from secure storage.
  /// [key] is the key to retrieve the value from.
  static Future<bool?> getBool(String key) async {
    final string = await _secureStorage.read(key: key);
    if (string == null) return null;
    if (string == 'true') {
      return true;
    } else if (string == 'false') {
      return false;
    } else {
      return null;
    }
  }

  /// Removes a value from secure storage.
  /// [key] is the key to remove the value from.
  static Future<void> remove(String key) => _secureStorage.delete(key: key);

  /// Checks if a key exists in secure storage.
  /// [key] is the key to check.
  /// Returns a [Future] that completes with `true` if the key exists,
  /// `false` otherwise.
  /// Throws an [Exception] if the key could not be checked.
  /// This method is not supported on iOS.
  static Future<bool> containsKey(String key) =>
      _secureStorage.containsKey(key: key);

  /// Clears all values from secure storage.
  /// Returns a [Future] that completes when all values are cleared.
  /// Throws an [Exception] if the values could not be cleared.
  static Future<void> clearAll() async => _secureStorage.deleteAll();
}
