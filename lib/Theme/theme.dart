import 'package:flutter/material.dart';

const Color lightColor = Color(0xFFDCFFF5); // Light shade
const Color darkColor = Color(0xFF59A285); // Medium shade
const Color mediumColor = Color(0xFFF2FFFB); //

ThemeData lightTheme = ThemeData(
  scaffoldBackgroundColor: lightColor,
  appBarTheme: const AppBarTheme(
    color: darkColor,
    foregroundColor: lightColor,
  ),
  textTheme: const TextTheme(
    titleLarge: TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 24,
    ),
    titleMedium: TextStyle(fontSize: 18, color: lightColor),
    displayLarge:
        TextStyle(fontWeight: FontWeight.bold, fontSize: 28, color: darkColor),
    bodyLarge:
        TextStyle(fontWeight: FontWeight.bold, fontSize: 18, color: darkColor),
    bodyMedium: TextStyle(fontSize: 16, color: darkColor),
  ),
  listTileTheme: ListTileThemeData(
    iconColor: darkColor,
    shape: Border(
      bottom: BorderSide(
        width: 0.5,
        color: darkColor.withAlpha(120),
      ),
    ),
    titleTextStyle: const TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.bold,
      color: darkColor,
    ),
  ),
  textButtonTheme: TextButtonThemeData(
    style: ButtonStyle(
      foregroundColor: WidgetStateProperty.all(
        darkColor,
      ),
    ),
  ),
  popupMenuTheme: const PopupMenuThemeData(
    color: lightColor,
  ),
);

final InputBorder customBorder = OutlineInputBorder(
  borderRadius: BorderRadius.circular(10),
  borderSide: const BorderSide(
    color: darkColor,
  ),
);

final InputBorder customErrorBorder = OutlineInputBorder(
  borderRadius: BorderRadius.circular(10),
  borderSide: const BorderSide(
    color: Color(0xFFFF4646),
  ),
);

final InputBorder customFocusBorder = OutlineInputBorder(
  borderRadius: BorderRadius.circular(10),
  borderSide: const BorderSide(color: darkColor, width: 2),
);
