import 'dart:io';

import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';

abstract class LocalStorage {
  bool contains(String key);
  Future put<T>(String key, T value);
  T? get<T>(String key);
  Future delete(String key);
  Future clear();
}

class LocalStorageImpl implements LocalStorage {
  static LocalStorageImpl? _instance;
  static const String _boxName = 'AppLocalStorage';
  late Box _box;

  LocalStorageImpl._();

  static Future<LocalStorage> get instance async {
    if (_instance == null) {
      _instance = LocalStorageImpl._();
      await _instance!._init();
    }

    return _instance!;
  }

  Future _init() async {
    Directory dir = await getApplicationDocumentsDirectory();
    Hive.init(dir.path);
    _box = await Hive.openBox(_boxName);
    return;
  }

  @override
  bool contains(String key) {
    return _box.containsKey(key);
  }

  @override
  T? get<T>(String key) {
    final value = _box.get(key);
    if (value == null) return null;

    return _box.get(key) as T;
  }

  @override
  Future put<T>(String key, T value) async {
    return await _box.put(key, value);
  }

  @override
  Future delete(String key) async {
    return await _box.delete(key);
  }

  @override
  Future clear() async {
    await _box.deleteFromDisk();
    _instance = null;
    return;
  }
}
