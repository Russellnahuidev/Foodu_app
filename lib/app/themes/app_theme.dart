import 'package:flutter/material.dart';
import 'package:foodu_app/app/themes/dark_theme.dart';
import 'package:foodu_app/app/themes/ligh_theme.dart';

class AppTheme {
  AppTheme._();

  static ThemeData get lightTheme => LightTheme.theme;
  static ThemeData get darkTheme => DarkTheme.theme;
}
