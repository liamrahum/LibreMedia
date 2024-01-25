import 'package:shared_preferences/shared_preferences.dart';
import 'package:LibreMedia/variables.dart';

class WatchHistory {
  static final WatchHistory _instance = WatchHistory._internal();

  factory WatchHistory() {
    return _instance;
  }

  WatchHistory._internal();

  Future<List<String>> getWatchHistory() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getStringList(keyWatchHistory) ?? [];
  }

  Future<void> addToWatchHistory(String videoID) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> watchHistory = await getWatchHistory();
    watchHistory.add(videoID);
    prefs.setStringList(keyWatchHistory, watchHistory);
  }

  Future<void> clearWatchHistory() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setStringList(keyWatchHistory, []);
  }
}
