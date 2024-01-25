import 'package:shared_preferences/shared_preferences.dart';
import 'package:LibreMedia/variables.dart';

class WatchHistory {
  static final WatchHistory _instance = WatchHistory._internal();

  factory WatchHistory() {
    return _instance;
  }

  WatchHistory._internal();

  Future<Set<String>> getWatchHistory() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final history = prefs.getStringList(keyWatchHistory) ?? [];
    return history.reversed.toSet();
  }

  Future<void> addToWatchHistory(String videoID) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    Set<String> watchHistory = await getWatchHistory();
    watchHistory.add(videoID);
    prefs.setStringList(keyWatchHistory, watchHistory.toList());
  }

  Future<void> clearWatchHistory() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setStringList(keyWatchHistory, []);
  }
}
