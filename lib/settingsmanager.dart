import 'package:shared_preferences/shared_preferences.dart';
import 'package:LibreMedia/variables.dart';

class SettingsManager{
  static final SettingsManager _instance = SettingsManager._internal();

  factory SettingsManager() {
    return _instance;
  }

  SettingsManager._internal();

  Future<String> getInstanceAPI() async
  {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    //Allow for fallback with instances
    return prefs.getString(keyInstanceUsed) ?? "https://invidious.lunar.icu/api/v1/";
  }

  Future<void> setInstanceAPI(String instanceURL) async
  {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(keyInstanceUsed, instanceURL);
  }
  
  //Function below returns settings in Json form
  Future<Map> getAllSettings() async
  {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    Map items = {};
    items[keyInstanceUsed] = prefs.getString(keyInstanceUsed) ?? "https://invidious.lunar.icu/api/v1/";
    items[keySaveHistory] = prefs.getBool(keySaveHistory) ?? true;
    items[keyDisableShorts] = prefs.getBool(keyDisableShorts) ?? false;
    items[keyMaxTime] = prefs.getInt(keyMaxTime) ?? 60;

    return items; 
  }
  Future<void> setAllSettings(Map settings) async
  {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(keyInstanceUsed, settings[keyInstanceUsed]);
    prefs.setBool(keySaveHistory, settings[keySaveHistory]);
    prefs.setBool(keyDisableShorts, settings[keyDisableShorts]);
    prefs.setInt(keyMaxTime, settings[keyMaxTime]);
  }
}
