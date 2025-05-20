import 'dart:convert';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:movie_app_api/movie_app_api.dart' show BaseModel;

/// {@template cache_client}
/// An in-memory cache client.
/// {@endtemplate}
class CacheClient {
  /// {@macro cache_client}
  CacheClient() : _storage = const FlutterSecureStorage();

  late final FlutterSecureStorage _storage;

  /// Writes the provide [key], [value] pair to the in-memory cache.
  Future<void> write<T extends BaseModel>({
    required String key,
    required T value,
  }) async {
    // final cacheString =
    //     await _storage.read(key: key);
    // _cache = cacheString != null
    //     ? jsonDecode(cacheString) as Map<String, dynamic>
    //     : <String, dynamic>{};
    // _cache[key] = jsonEncode(value.toJson());
    await _storage.write(
      key: key,
      value: jsonEncode(value.toJson()),
    );
  }

  /// Looks up the value for the provided [key].
  /// Defaults to `null` if no value exists for the provided key.
  Future<T?> read<T extends BaseModel>({required String key}) async {
    final cacheString = await _storage.read(key: key);
    if (cacheString != null) {
      final cacheDecoded = jsonDecode(cacheString) as Map<String, dynamic>;
      final data = BaseModel.fromJson(cacheDecoded);
      if (data is T) return data;
      return null;
    }
    return null;
  }

  /// Deletes the value for the provided [key].
  /// Returns `true` if the value was deleted, `false` otherwise.
  Future<bool> delete({required String key}) async {
    final cacheString = await _storage.read(key: key);
    if (cacheString != null) {
      await _storage.delete(key: key);
      return true;
    }
    return false;
  }
}
