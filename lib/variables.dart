import 'package:flutter/material.dart';

const Color bgColor = Color(0xFF131313);
const Color primaryColor = Color(0xFF596FFF);
const Color textColor = Color(0xFFFFFFFF);

const double menuItemSize = 20;
const double bigTitleSize = 20;
const double pageTitleSize =20;
const double videoTitleSize =20;
const double smallTextSize = 14;

TextStyle generalTextStyle(double size, FontWeight weight) {
  return TextStyle(color: textColor, fontSize: size, fontFamily: "Assistant", fontWeight: weight);
}

ThemeData appTheme = ThemeData(
    colorScheme: const ColorScheme.dark(background: bgColor, brightness: Brightness.dark, primary: primaryColor),
    textTheme: TextTheme(
      bodyLarge: generalTextStyle(pageTitleSize, FontWeight.w700),
      bodyMedium: generalTextStyle(videoTitleSize, FontWeight.w600),
      bodySmall: generalTextStyle(smallTextSize, FontWeight.w400)),
  );