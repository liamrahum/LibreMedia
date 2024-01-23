import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

class SettingsManager{
  static final SettingsManager _instance = SettingsManager._internal();

  factory SettingsManager() {
    return _instance;
  }

  SettingsManager._internal();

  /*----KEYS----*/ 
  static const String _keyInstanceUsed = 'invidious_instnace';
  static const String _keySaveHistory = 'saveHistory';
  static const String _keyMaxTime = 'maxWatchTime';

  Future<String> getInstanceAPI() async
  {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(_keyInstanceUsed) ?? "Null";
  }

  Future<void> setInstanceAPI(String instanceURL) async
  {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(_keyInstanceUsed, instanceURL);
  }
  
    
  //Function below returns settings in Json form
  Future<String> getAllSettings() async
  {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    Map items = {};
    items[_keyInstanceUsed] = prefs.getString(_keyInstanceUsed);
    items[_keySaveHistory] = prefs.getBool(_keySaveHistory);
    items[_keySaveHistory] = prefs.getInt(_keyMaxTime);

    return const JsonEncoder().convert(items); 
  }
}
