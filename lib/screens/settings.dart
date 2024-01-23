import 'package:flutter/material.dart';
import 'package:off_the_hook/settingsmanager.dart';

Future<String> getText() async
{
  SettingsManager prefs = SettingsManager();
  return prefs.getInstanceAPI(); 
}

class Settings extends StatelessWidget {
  const Settings({super.key});
  
  @override
  Widget build(BuildContext context) {
    return Center(child: FutureBuilder(
    future: getText(),
    builder: (context, snapshot) => 
    Text(snapshot.data ?? "Null") ),);
  }
}
