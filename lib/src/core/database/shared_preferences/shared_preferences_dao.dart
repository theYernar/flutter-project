import 'package:flutter/foundation.dart';
import 'package:project/src/core/utils/talker_logger_util.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class ISharedPreferencesDao implements SharedPreferencesWithCache {
  String key(String name);
}

abstract class BaseSharedPreferencesDao implements ISharedPreferencesDao {
  final SharedPreferencesWithCache _sharedPreferences;
  final String _name;

  BaseSharedPreferencesDao(
    SharedPreferencesWithCache sharedPreferences, {
    required this._name,
  }) : _sharedPreferences = sharedPreferences;
}

mixin _LoggerMixin on BaseSharedPreferencesDao {
  late final String _logOrigin = kDebugMode
      ? '($_name)'
      : 'SharedPreferencesDao($_name)';

  void _log(void Function(StringBuffer b) buildLog) {
    final buffer = StringBuffer(_logOrigin)..write(' | ');
    buildLog(buffer);
    TalkerLoggerUtil.talker.info(buffer.toString());
  }

  Future<T> _performAsyncLogging<T>(
    String description,
    Future<T> Function() action,
  ) async {
    _log((b) => b..write('Performing "$description".'));
    final result = await action();
    _log((b) => b..write('Successfully performed "$description".'));
    return result;
  }

  T _getLogging<T>(String key, T Function(String key) read) {
    _log((b) => b..write('Reading key "$key" of type $T.'));
    final value = read(key);
    _log((b) => b..write('Successfully read key "$key". Value – $value.'));
    return value;
  }

  Future<void> _setLogging<T>(
    String key,
    T value,
    Future<void> Function(String key, T value) set,
  ) async {
    _log((b) => b..write('Writing key "$key" with value $value.'));
    await set(key, value);
    _log((b) => b..write('Wrote key "$key" successfully.'));
  }
}

mixin _KeyImplementationMixin on BaseSharedPreferencesDao {
  late final String _fullNamespace = 'project.$_name';
  final Map<String, String> _keyCache = {};

  @override
  String key(String name) =>
      _keyCache.putIfAbsent(name, () => '$_fullNamespace.$name');
}

mixin _ActionsImplementationMixin on _LoggerMixin {
  @override
  Future<void> clear() =>
      _performAsyncLogging('clear', _sharedPreferences.clear);

  @override
  Future<void> reloadCache() =>
      _performAsyncLogging('reload', _sharedPreferences.reloadCache);

  @override
  bool containsKey(String key) {
    _log((b) => b..write('Checking if key "$key" exists.'));
    final exists = _sharedPreferences.containsKey(key);
    _log(
      (b) => b..write('Key "$key" ${exists ? 'exists' : 'does not exist'}.'),
    );
    return exists;
  }
}

mixin _GettersImplementationMixin on _LoggerMixin {
  @override
  Object? get(String key) => _getLogging(key, _sharedPreferences.get);

  @override
  bool? getBool(String key) => _getLogging(key, _sharedPreferences.getBool);

  @override
  double? getDouble(String key) =>
      _getLogging(key, _sharedPreferences.getDouble);

  @override
  int? getInt(String key) => _getLogging(key, _sharedPreferences.getInt);

  @override
  String? getString(String key) =>
      _getLogging(key, _sharedPreferences.getString);

  @override
  List<String>? getStringList(String key) =>
      _getLogging(key, _sharedPreferences.getStringList);

  @override
  Set<String> get keys {
    _log((b) => b.write('Getting all keys.'));
    final keys = _sharedPreferences.keys;
    _log((b) => b..write('Successfully got all keys. Keys – $keys.'));
    return keys;
  }
}

mixin _MutationsImplementationMixin on _LoggerMixin {
  @override
  Future<void> setBool(String key, bool value) =>
      _setLogging(key, value, _sharedPreferences.setBool);

  @override
  Future<void> setDouble(String key, double value) =>
      _setLogging(key, value, _sharedPreferences.setDouble);

  @override
  Future<void> setInt(String key, int value) =>
      _setLogging(key, value, _sharedPreferences.setInt);

  @override
  Future<void> setString(String key, String value) =>
      _setLogging(key, value, _sharedPreferences.setString);

  @override
  Future<void> setStringList(String key, List<String> value) =>
      _setLogging(key, value, _sharedPreferences.setStringList);

  @override
  Future<void> remove(String key) async {
    _log((b) => b..write('Removing key "$key".'));
    await _sharedPreferences.remove(key);
    _log((b) => b..write('Removed key "$key" successfully.'));
  }
}

abstract class SharedPreferencesDao = BaseSharedPreferencesDao
    with
        _LoggerMixin,
        _KeyImplementationMixin,
        _ActionsImplementationMixin,
        _GettersImplementationMixin,
        _MutationsImplementationMixin;
