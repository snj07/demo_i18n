import 'package:flutter/material.dart';

ThemeData buildLightTheme() {
  final ThemeData base = ThemeData.light();
  return base.copyWith(
    brightness: Brightness.light,
    backgroundColor: Colors.white,
    primaryColor: Colors.blue,
    accentColor: Colors.black,
    textTheme: TextTheme(headline1: TextStyle(color: Colors.white)),
    accentIconTheme: IconThemeData(color: Colors.white),
    dividerColor: Colors.white54,
  );
}

ThemeData buildDarkTheme() {
  final ThemeData base = ThemeData.light();
  return base.copyWith(
    brightness: Brightness.dark,
    backgroundColor: Colors.black,
    primaryColor: Colors.blue,
    textTheme: TextTheme(headline1: TextStyle(color: Colors.white)),
  );
}
