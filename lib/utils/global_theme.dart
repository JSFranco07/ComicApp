import 'package:flutter/material.dart';

/// Global App Theme
ThemeData globalTheme() {
  TextTheme _globalTextTheme(TextTheme textTheme) {
    return textTheme.copyWith(
      headline2: textTheme.headline2?.copyWith(
        fontFamily: 'Joan',
        fontWeight: FontWeight.w700,
        fontSize: 24.0,
        color: Colors.black,
        letterSpacing: 0.0,
      ),
      headline3: textTheme.headline3?.copyWith(
        fontFamily: 'Joan',
        fontWeight: FontWeight.w600,
        fontSize: 22.0,
        color: Colors.white,
        letterSpacing: 0.0,
      ),
      bodyText1: textTheme.bodyText1?.copyWith(
        fontFamily: 'Joan',
        fontWeight: FontWeight.w500,
        fontSize: 16.0,
        color: Colors.black,
        letterSpacing: 0.0,
      ),
      subtitle1: textTheme.subtitle1?.copyWith(
        fontFamily: 'Joan',
        fontWeight: FontWeight.w400,
        fontSize: 14.0,
        color: Colors.black,
        letterSpacing: 0.0,
      ),
    );
  }

  ColorScheme _colorSchemeTheme(ColorScheme themeColor) {
    return themeColor.copyWith(
      primary: const Color.fromRGBO(255, 96, 94, 1),
      primaryContainer: const Color.fromRGBO(93, 50, 255, 1),
      secondary: const Color.fromRGBO(169, 188, 201, 1),
    );
  }

  final ThemeData theme = ThemeData.light();

  return theme.copyWith(
    primaryColor: const Color.fromRGBO(255, 96, 94, 1),
    shadowColor: Colors.red.withOpacity(0.5),
    colorScheme: _colorSchemeTheme(theme.colorScheme),
    scaffoldBackgroundColor: const Color.fromRGBO(255, 255, 255, 1),
    textTheme: _globalTextTheme(theme.textTheme),
    appBarTheme: const AppBarTheme(
      iconTheme: IconThemeData(
        color: Colors.white,
      ),
    ),
  );
}
