import 'package:shared_preferences/shared_preferences.dart';
import 'package:LibreMedia/variables.dart';

class History {
  static final History _instance = History._internal();

  factory History() {
    return _instance;
  }

  History._internal();

  Future<List<String>> getWatchHistory() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    //Allow for fallback with instances
    return prefs.getStringList(keyWatchHistory) ?? [];
  }

  Future<void> addToWatchHistory(String videoID) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    //Allow for fallback with instances
    List<String> watchHistory = await getWatchHistory();
    watchHistory.add(videoID);
    prefs.setStringList(keyWatchHistory, watchHistory);
  }

  Future<void> clearWatchHistory() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setStringList(keyWatchHistory, []);
  }
}
