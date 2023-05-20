import 'package:flutter/material.dart';
import '/backend/backend.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:csv/csv.dart';
import 'package:synchronized/synchronized.dart';
import 'flutter_flow/flutter_flow_util.dart';

class FFAppState extends ChangeNotifier {
  static final FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  Future initializePersistedState() async {
    secureStorage = FlutterSecureStorage();
    _cacheOverride =
        await secureStorage.getStringList('ff_cacheOverride') ?? _cacheOverride;
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late FlutterSecureStorage secureStorage;

  List<String> _cacheOverride = [];
  List<String> get cacheOverride => _cacheOverride;
  set cacheOverride(List<String> _value) {
    _cacheOverride = _value;
    secureStorage.setStringList('ff_cacheOverride', _value);
  }

  void deleteCacheOverride() {
    secureStorage.delete(key: 'ff_cacheOverride');
  }

  void addToCacheOverride(String _value) {
    _cacheOverride.add(_value);
    secureStorage.setStringList('ff_cacheOverride', _cacheOverride);
  }

  void removeFromCacheOverride(String _value) {
    _cacheOverride.remove(_value);
    secureStorage.setStringList('ff_cacheOverride', _cacheOverride);
  }

  void removeAtIndexFromCacheOverride(int _index) {
    _cacheOverride.removeAt(_index);
    secureStorage.setStringList('ff_cacheOverride', _cacheOverride);
  }

  void updateCacheOverrideAtIndex(
    int _index,
    Function(String) updateFn,
  ) {
    updateFn(_cacheOverride[_index]);
    secureStorage.setStringList('ff_cacheOverride', _cacheOverride);
  }
}

LatLng? _latLngFromString(String? val) {
  if (val == null) {
    return null;
  }
  final split = val.split(',');
  final lat = double.parse(split.first);
  final lng = double.parse(split.last);
  return LatLng(lat, lng);
}

extension FlutterSecureStorageExtensions on FlutterSecureStorage {
  static final _lock = Lock();

  Future<void> writeSync({required String key, String? value}) async =>
      await _lock.synchronized(() async {
        await write(key: key, value: value);
      });

  void remove(String key) => delete(key: key);

  Future<String?> getString(String key) async => await read(key: key);
  Future<void> setString(String key, String value) async =>
      await writeSync(key: key, value: value);

  Future<bool?> getBool(String key) async => (await read(key: key)) == 'true';
  Future<void> setBool(String key, bool value) async =>
      await writeSync(key: key, value: value.toString());

  Future<int?> getInt(String key) async =>
      int.tryParse(await read(key: key) ?? '');
  Future<void> setInt(String key, int value) async =>
      await writeSync(key: key, value: value.toString());

  Future<double?> getDouble(String key) async =>
      double.tryParse(await read(key: key) ?? '');
  Future<void> setDouble(String key, double value) async =>
      await writeSync(key: key, value: value.toString());

  Future<List<String>?> getStringList(String key) async =>
      await read(key: key).then((result) {
        if (result == null || result.isEmpty) {
          return null;
        }
        return CsvToListConverter()
            .convert(result)
            .first
            .map((e) => e.toString())
            .toList();
      });
  Future<void> setStringList(String key, List<String> value) async =>
      await writeSync(key: key, value: ListToCsvConverter().convert([value]));
}
