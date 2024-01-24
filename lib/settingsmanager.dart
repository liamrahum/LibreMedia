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
    return prefs.getString(keyInstanceUsed) ?? "Null";
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
    items[keyInstanceUsed] = prefs.getString(keyInstanceUsed) ?? "Null";
    items[keySaveHistory] = prefs.getBool(keySaveHistory) ?? true;
    items[keyMaxTime] = prefs.getInt(keyMaxTime) ?? 60;

    return items; 
  }
}
