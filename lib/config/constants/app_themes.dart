import 'package:flutter/material.dart';
import 'constants.dart';

normalTheme(BuildContext context) {
  return ThemeData(
    fontFamily: FONT_ROBOTO_MONO,
    primaryColor: Colors.white,
    disabledColor: Colors.grey,
    cardColor: Colors.white,
    canvasColor: Colors.white,
    brightness: Brightness.light,
    buttonTheme: Theme.of(context).buttonTheme.copyWith(
        colorScheme: const ColorScheme.light(),
        buttonColor: Colors.blue,
        splashColor: Colors.white),
    appBarTheme: const AppBarTheme(
      elevation: 0.0,
    ),
  );
}

lightTheme(BuildContext context) {
  return ThemeData(
    fontFamily: FONT_ROBOTO_MONO,
    primarySwatch: Colors.blue,
    primaryColor: Colors.white,
    disabledColor: Colors.grey,
    cardColor: Colors.white,
    canvasColor: Colors.white,
    brightness: Brightness.light,
    buttonTheme: Theme.of(context).buttonTheme.copyWith(
        colorScheme: const ColorScheme.light(),
        buttonColor: Colors.blue,
        splashColor: Colors.white),
    appBarTheme: const AppBarTheme(
      elevation: 0.0,
    ),
  );
}

darkTheme(BuildContext context) {
  return ThemeData(
    fontFamily: FONT_ROBOTO_MONO,
    primarySwatch: Colors.blue,
    primaryColor: Colors.black,
    disabledColor: Colors.grey,
    cardColor: const Color(0xff1f2124),
    canvasColor: Colors.black,
    brightness: Brightness.dark,
    buttonTheme: Theme.of(context).buttonTheme.copyWith(
        colorScheme: const ColorScheme.dark(),
        buttonColor: Colors.blue,
        splashColor: Colors.black),
    appBarTheme: const AppBarTheme(
      elevation: 0.0,
    ),
  );
}
