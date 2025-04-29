import 'dart:convert';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';

/// {@template cache_client}
/// An in-memory cache client.
/// {@endtemplate}
class CacheClient {
  /// {@macro cache_client}
  CacheClient()
      : _storage = const FlutterSecureStorage(),
        _cache = <String, Object>{};

  late final FlutterSecureStorage _storage;

  Map<String, Object> _cache;

  /// Writes the provide [key], [value] pair to the in-memory cache.
  Future<void> write<T extends Object>({
    required String key,
    required T value,
  }) async {
    _cache[key] = value;
    await _storage.write(
      key: 'movie_app_secure_storage',
      value: jsonEncode(_cache),
    );
  }

  /// Looks up the value for the provided [key].
  /// Defaults to `null` if no value exists for the provided key.
  Future<T?> read<T extends Object>({required String key}) async {
    final cacheString = await _storage.read(key: 'movie_app_secure_storage');
    if (cacheString != null) {
      final cacheDecoded = jsonDecode(cacheString);
      _cache = cacheDecoded as Map<String, Object>;
      final value = _cache[key];
      if (value is T) return value;
    }
    return null;
  }
}
