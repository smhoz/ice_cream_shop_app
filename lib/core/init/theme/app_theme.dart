import 'package:flutter/material.dart';

import '../../constants/app/app_constant.dart';

class AppTheme {
  static AppTheme? _instance;
  AppTheme._();
  static AppTheme get instance => _instance ??= AppTheme._();

  ThemeData get theme => ThemeData(
      fontFamily: AppConstants.FONT_FAMILY,
      iconTheme: const IconThemeData(color: Colors.white, size: 20),
      cardColor: Colors.grey.shade200,
      bottomAppBarColor: Colors.yellow,
      colorScheme: ColorScheme.light(
        primary: const Color(0xFFf34282),
        onPrimary: const Color(0xFFf34282),
        secondary: const Color(0xFFfedadc),
        secondaryVariant: Colors.grey.shade500,
      ),
      textTheme: _textTheme());

  TextTheme _textTheme() {
    return TextTheme(
        bodyText1: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        bodyText2: const TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
        headline3: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
            color: Colors.grey.shade600),
        headline5: const TextStyle(
            fontSize: 16, fontWeight: FontWeight.w500, color: Colors.white),
        headline6: const TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w400,
        ),
        headline4: const TextStyle(
            fontSize: 12, fontWeight: FontWeight.w600, color: Colors.black));
  }
}
