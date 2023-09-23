import 'package:flutter/material.dart';

const Color bgColor = Color(0xFF131313);
const Color primaryColor = Color(0xFF596FFF);
const Color textColor = Color(0xFFFFFFFF);

ThemeData appTheme = ThemeData(
    colorScheme: const ColorScheme.dark(background: bgColor, brightness: Brightness.dark, primary: primaryColor),
    textTheme: const TextTheme(
      bodyLarge: TextStyle(color: textColor),
      bodyMedium: TextStyle(color: textColor),
      bodySmall: TextStyle(color: textColor)),
  );

const TextStyle menuItem = TextStyle();
const TextStyle bigTitle = TextStyle();
const TextStyle pageTitle = TextStyle();
const TextStyle videoTitle = TextStyle();
const TextStyle smallText = TextStyle();
