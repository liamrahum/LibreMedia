import 'package:LibreMedia/variables.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Subscriptions {
  static final Subscriptions _instance = Subscriptions._internal();

  factory Subscriptions() {
    return _instance;
  }

  Subscriptions._internal();

  Future<Set<String>> getSubscriptions() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final subs = prefs.getStringList(keySubscriptions) ?? [];
    return subs.reversed.toSet();
  }

  Future<void> addToSubscriptions(String channelID) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    Set<String> subs = await getSubscriptions();
    subs.add(channelID);
    prefs.setStringList(keySubscriptions, subs.toList());
  }

  Future<void> removeSubscription(String channelID) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    Set<String> subs = await getSubscriptions();
    subs.remove(channelID);
    prefs.setStringList(keySubscriptions, subs.toList());
  }

  Future<void> clearSubscriptions() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setStringList(keySubscriptions, []);
  }
}
