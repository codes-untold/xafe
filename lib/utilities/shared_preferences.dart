import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesUtil {
  static Future<String?> getString(String key) async {
    SharedPreferences myPrefs = await SharedPreferences.getInstance();
    return myPrefs.getString(key) ?? "";
  }

  static setString(String key, String value) async {
    SharedPreferences myPrefs = await SharedPreferences.getInstance();
    myPrefs.setString(key, value);
  }
}
