import 'package:shared_preferences/shared_preferences.dart';

class PreferenciasUsuario {
  ///generar instancia
  static late SharedPreferences _prefs;

  //inicializar las preferencias
  static Future init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  String get token {
    return _prefs.getString('token') ?? '';
  }

  set token(String value) {
    _prefs.setString('token', value);
  }
}
