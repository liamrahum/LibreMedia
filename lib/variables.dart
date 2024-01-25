import 'package:flutter/material.dart';

const Color bgColor = Color(0xFF131313);
const Color primaryColor = Color(0xFF596FFF);
const Color textColor = Color(0xFFFFFFFF);

const double menuItemSize = 20;
const double bigTitleSize = 20;
const double pageTitleSize = 20;
const double videoTitleSize = 20;
const double smallTextSize = 14;

TextStyle generalTextStyle(double size, FontWeight weight, double opacity) {
  return TextStyle(
      color: textColor.withOpacity(opacity),
      fontSize: size,
      fontFamily: "Assistant",
      fontWeight: weight);
}

ThemeData appTheme = ThemeData(
  colorScheme: const ColorScheme.dark(
      background: bgColor, brightness: Brightness.dark, primary: primaryColor),
  textTheme: TextTheme(
      bodyLarge: generalTextStyle(pageTitleSize, FontWeight.w700, 1),
      bodyMedium: generalTextStyle(videoTitleSize, FontWeight.w600, 1),
      bodySmall: generalTextStyle(smallTextSize, FontWeight.w400, 1)),
);


/*----KEYS----*/ 
String keyInstanceUsed = 'invidious_instnace';
String keySaveHistory = 'saveHistory';
String keyMaxTime = 'maxWatchTime';
String keyDisableShorts = "disableShorts";
String keyWatchHistory = 'watchHistory';