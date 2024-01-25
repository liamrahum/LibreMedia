import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:LibreMedia/variables.dart';
import 'package:LibreMedia/classes/settings-manager.dart';
import 'dart:convert';

import 'package:flutter/services.dart';

Future<Map> getSettings() async {
  SettingsManager prefs = SettingsManager();

  return prefs.getAllSettings();
}

Future<List> getAllInstances() async {
  return const JsonCodec()
      .decode(await rootBundle.loadString('lib/assets/instances.json'));
}

class Settings extends StatefulWidget {
  const Settings({super.key});

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: FutureBuilder(
          future: getSettings(),
          builder: (context, snapshot) {
            return ListView(children: [
              Text(
                "Select alternative Invidious server:",
                style: generalTextStyle(bigTitleSize, FontWeight.bold, 1),
              ),
              instancesMenu()
            ]);
          }),
    );
  }

  FutureBuilder<List<dynamic>> instancesMenu() {
    return FutureBuilder(
      future: getAllInstances(),
      builder: (context, snapshot) {
        List<DropdownMenuItem<String>> menuItems = [];
        if (!snapshot.hasData) {
          return const CircularProgressIndicator();
        } else if (snapshot.hasError){
          return const Text("Error loading instances");
        }
        snapshot.data?.forEach((element) =>
            (!element[0].toString().contains('onion') &&
                    !element[0].toString().contains('i2p'))
                ? menuItems.add(DropdownMenuItem(
                    value: "https://${element[0]}/api/v1/",
                    child: Text("${element[1]["flag"]} ${element[0]}"),
                  ))
                : Void);
        return DropdownButton(
          items: menuItems,
          onChanged: (value) async {
            SettingsManager().setInstanceAPI(value!);
          },
        );
      },
    );
  }
}
