import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'variables.dart';
import 'widgets/widgets.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});
  
  @override
  Widget build(BuildContext context) {
     SystemChrome.setPreferredOrientations([
        DeviceOrientation.portraitUp,
        DeviceOrientation.portraitDown,
      ]);
    return MaterialApp(
      theme: appTheme,
      home: const NavigationSystem());
  }
}