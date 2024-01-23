import 'package:flutter/material.dart';
import 'package:off_the_hook/variables.dart';
import 'package:off_the_hook/settingsmanager.dart';

Future<Map> getSettings() async {
  SettingsManager prefs = SettingsManager();

  return prefs.getAllSettings();
}

class Settings extends StatefulWidget {
  const Settings({super.key});

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  List<DropdownMenuItem<String>> get dropdownItems {
    List<DropdownMenuItem<String>> menuItems = [
      const DropdownMenuItem(
          value: "https://invidious.lunar.icu/api/v1/",
          child: Text("invidious.lunar.icu")),
      const DropdownMenuItem(
          value: "https://invidious.nerdvpn.de/api/v1/",
          child: Text("invidious.nerdvpn.de")),
      const DropdownMenuItem(
          value: "https://iv.melmac.space/api/v1/",
          child: Text("iv.melmac.space"))
    ];
    return menuItems;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: FutureBuilder(
          future: getSettings(),
          builder: (context, snapshot) {
            return ListView(
              
              children: [
                /*  //This was only for displaying the settingsr
                Text(snapshot.data![keyInstanceUsed]),
                Text(snapshot.data![keySaveHistory].toString()),
                Text(snapshot.data![keyMaxTime].toString()),
                */
                Text("Select alternative Invidious server:", style: generalTextStyle(bigTitleSize, FontWeight.bold, 1),),
                DropdownButton(
                  items: dropdownItems,
                  onChanged: (value) async {
                    SettingsManager().setInstanceAPI(value!);
                  },
                )
              ]
            );
          }),
    );
  }
}
