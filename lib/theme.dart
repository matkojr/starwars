import 'package:flutter/material.dart';

class ThemeColors {
  static Color primaryColor = const Color.fromRGBO(1, 155, 248, 1);
  static Color secondaryColor = const Color.fromRGBO(136, 217, 245, 1);
  static Color grayColor = const Color.fromRGBO(166, 171, 181, 1);
  static Color accentColor = Colors.black;
}

ThemeData theme = ThemeData(
  primaryColor: ThemeColors.primaryColor,
  scaffoldBackgroundColor: ThemeColors.accentColor,
  buttonTheme: ButtonThemeData(
    padding: const EdgeInsets.all(16),
    buttonColor: ThemeColors.secondaryColor,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(0),
    ),
  ),
);