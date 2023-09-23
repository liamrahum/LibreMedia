import 'package:flutter/material.dart';

const Color bgColor = Color(0xFF131313);
const Color primaryColor = Color(0xFF596FFF);
const Color textColor = Color(0xFFFFFFFF);

const double menuItemSize = 20;
const double bigTitleSize = 20;
const double pageTitleSize =20;
const double videoTitleSize =20;
const double smallTextSize = 20;

TextStyle generalTextStyle(double size) {
  return TextStyle(color: textColor, fontSize: size);
}

ThemeData appTheme = ThemeData(
    colorScheme: const ColorScheme.dark(background: bgColor, brightness: Brightness.dark, primary: primaryColor),
    textTheme: TextTheme(
      bodyLarge: generalTextStyle(pageTitleSize),
      bodyMedium: generalTextStyle(videoTitleSize),
      bodySmall: generalTextStyle(smallTextSize)),
  );