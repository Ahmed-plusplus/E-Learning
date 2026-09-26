import 'dart:convert';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class CacheHelper {
  final FlutterSecureStorage _storage;

  const CacheHelper(this._storage);

  Future<T?> read<T>(String key) async {
    final value = await _storage.read(key: key);
    if (value == null) return null;

    if (T == String) return value as T;
    if (T == bool) return (value == 'true') as T;
    if (T == int) return int.parse(value) as T;
    if (T == double) return double.parse(value) as T;

    return jsonDecode(value) as T;
  }

  Future<void> write<T>(String key, T value) async {
    String encodedValue;
    if (value is String) {
      encodedValue = value;
    } else if (value is bool || value is int || value is double) {
      encodedValue = value.toString();
    } else {
      encodedValue = jsonEncode(value);
    }

    return await _storage.write(key: key, value: encodedValue);
  }

  Future<void> delete(String key) => _storage.delete(key: key);

  Future<void> clear() => _storage.deleteAll();
}
