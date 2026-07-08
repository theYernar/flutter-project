import 'package:project/src/core/database/shared_preferences/typed_preferences_dao.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract interface class IAuthDao {
  PreferencesEntry<String> get session;
  PreferencesEntry<String> get deviceToken;
}

final class AuthDao extends TypedPreferencesDao implements IAuthDao {
  AuthDao({required SharedPreferencesWithCache sharedPreferences})
    : super(sharedPreferences, name: 'auth');

  @override
  PreferencesEntry<String> get session => stringEntry('session');

  @override
  PreferencesEntry<String> get deviceToken => stringEntry('deviceToken');
}
