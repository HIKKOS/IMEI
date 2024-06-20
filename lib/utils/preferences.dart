import 'package:shared_preferences/shared_preferences.dart';

class Preferences {
  static SharedPreferences? _prefs;
  static Future<void> init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  static SharedPreferences? get instance => _prefs;

  static set isUserLogged(bool value) {
    _prefs?.setBool('isUserLogged', value);
  }

  static set servidor(String value) {
    _prefs?.setString('servidor', value);
  }

  static String get servidor => _prefs?.getString('servidor') ?? '';

  static set databaseId(int? value) {
    _prefs?.setInt('database_id', value!);
  }

  static int? get databaseId => _prefs?.getInt('database_id');

  static set contactoId(int? value) {
    _prefs?.setInt('contacto_id', value!);
  }

  static int? get contactoId => _prefs?.getInt('contacto_id');

  static set userId(String? value) {
    _prefs?.setString('user_id', value!);
  }

  static String? get userId => _prefs?.getString('user_id');

  static set apiKey(String? value) {
    _prefs?.setString('api_key', value!);
  }

  static String? get apiKey => _prefs?.getString('api_key');

  static set idViajeIniciado(int? value) {
    if (value == null) {
      _prefs?.remove('idViajeIniciado');
    } else {
      _prefs?.setInt('idViajeIniciado', value);
    }
  }

  static int? get idViajeIniciado => _prefs?.getInt('idViajeIniciado');

  static bool get isUserLogged => _prefs?.getBool('isUserLogged') ?? false;
  static Future<void> limpiarPreferencias() async {
    await _prefs?.clear();
  }
}
