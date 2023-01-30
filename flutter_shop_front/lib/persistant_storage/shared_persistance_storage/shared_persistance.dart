import 'package:shared_preferences/shared_preferences.dart';

class SharedPreference {
  const SharedPreference();

  savePreference(String key, String value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    prefs.setString(key, value);
  }

  void removePreference(String key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    prefs.remove(key);
  }

  Future<String> getPreference(String key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    String? savedPreference = prefs.getString(key);
    if (savedPreference == null) {
      return "";
    } else {
      return savedPreference;
    }
  }
}
