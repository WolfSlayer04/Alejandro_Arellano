
import 'package:shared_preferences/shared_preferences.dart';

class Preferences {
  static final Preferences _instance = Preferences._internal();
  factory Preferences() => _instance;
  Preferences._internal();

  static late SharedPreferences _prefs;

  static Future<void> init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  // Tema
  bool get isDarkMode => _prefs.getBool('isDarkMode') ?? false;
  set isDarkMode(bool value) => _prefs.setBool('isDarkMode', value);

  // Otras preferencias que quieras guardar
  String get userName => _prefs.getString('userName') ?? '';
  set userName(String value) => _prefs.setString('userName', value);

  // Limpiar preferencias
  Future<void> clear() async {
    await _prefs.clear();
  }
}