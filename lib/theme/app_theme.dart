import 'package:flutter/material.dart';

const Color lightThemeDividerColor = Color(0xFFEEF1F9);
const Color lightTHemeSecondTextColor = Color(0xFF717D96);
final ThemeData lightTheme = ThemeData.light().copyWith(
    listTileTheme: const ListTileThemeData(
      shape: Border(
        bottom: BorderSide(color: Colors.transparent), // Set to transparent
      ),
    ),
    brightness: Brightness.light,
    primaryColor: const Color(0xFF00A1BD),
    colorScheme: const ColorScheme.light(
        secondary: Color(0xFFB71E00),
        primaryContainer: Color(0xFFEEF1F9),
        secondaryContainer: Color(0xFF92E8F6),
        onSecondaryContainer: Color(0xFFEEF1F9)),
    appBarTheme: const AppBarTheme(
        backgroundColor: Colors.white,
        elevation: 0,
        shadowColor: Colors.transparent,
        surfaceTintColor: Colors.transparent),
    scaffoldBackgroundColor: Colors.white,
    iconTheme: const IconThemeData(color: lightTHemeSecondTextColor),
    dividerColor: lightThemeDividerColor,
    textTheme: const TextTheme(
        titleLarge: TextStyle(
            fontSize: 22, color: Colors.black, fontWeight: FontWeight.bold),
        titleSmall: TextStyle(
            fontSize: 14, color: Colors.black, fontWeight: FontWeight.bold),
        titleMedium: TextStyle(
            fontSize: 16, color: Colors.black, fontWeight: FontWeight.bold),
        labelMedium: TextStyle(
            fontSize: 12, color: Colors.black, fontWeight: FontWeight.w600),
        labelSmall: TextStyle(
            fontSize: 10,
            color: lightTHemeSecondTextColor,
            fontWeight: FontWeight.w500),
        labelLarge: TextStyle(
            fontSize: 15,
            color: Color(0xFF00A1BD),
            fontWeight: FontWeight.w500),
        bodyLarge: TextStyle(color: Colors.black, fontSize: 18),
        bodyMedium: TextStyle(color: Colors.black, fontSize: 13),
        bodySmall: TextStyle(fontSize: 12, color: Colors.black)));

final ThemeData darkTheme = ThemeData.dark().copyWith(
    brightness: Brightness.light,
    primaryColor: const Color(0xFF00A1BD),
    colorScheme: const ColorScheme.light(
        secondary: Color(0xFFB71E00), secondaryContainer: Color(0xFF92E8F6)));
