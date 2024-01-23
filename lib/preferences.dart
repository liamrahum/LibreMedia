import 'package:shared_preferences/shared_preferences.dart';

class Preferences{
  static final Preferences _instance = Preferences._internal();

  factory Preferences() {
    return _instance;
  }

  Preferences._internal();

  /*----KEYS----*/
  static const String _keyInstanceUsed = 'invidious_instnace';

  Future<String> getInstanceAPI() async
  {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(_keyInstanceUsed)!;
  }

  Future<void> setInstanceAPI(String instanceURL) async
  {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(_keyInstanceUsed, instanceURL);
  }
}
