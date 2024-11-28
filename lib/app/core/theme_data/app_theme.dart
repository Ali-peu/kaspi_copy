import 'package:flutter/material.dart';

class AppThemeData {
  static const Color primaryColor = Color(0xFFF14635); // Основной цвет
  static const Color secondaryColor =
      Color(0xFFF97E76); // Дополнительный интерактивный
  static const Color mainTextColor = Color(0xFF333333); // Основной текст
  static const Color additionalTextColor =
      Color(0xFF7F7F7F); // Дополнительный текст
  static const Color supportTextColor =
      Color(0xFFB7B7B7); // Вспомогательный текст
  static const Color dividerColor = Color(0xFFDDDDDD); // Линии и фон
  static const Color backgroundColor = Color(0xFFFFFFFF); // Фон на цветном фоне
  static const Color creditHighlight = Color(0xFFFFD300); // Плашки для кредитов

  static ThemeData get lightTheme {
    return ThemeData(
      brightness: Brightness.light,
      primaryColor: primaryColor,
      scaffoldBackgroundColor: backgroundColor,
      dividerColor: dividerColor,
      textTheme: const TextTheme(
        bodyLarge: TextStyle(color: mainTextColor, fontSize: 18.0),
        bodyMedium: TextStyle(color: additionalTextColor, fontSize: 16.0),
        bodySmall: TextStyle(color: supportTextColor, fontSize: 14.0),
      ),
      appBarTheme: const AppBarTheme(
        backgroundColor: primaryColor,
        iconTheme:  IconThemeData(color: backgroundColor),
        titleTextStyle:  TextStyle(color: backgroundColor, fontSize: 20.0),
      ),
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
        backgroundColor: primaryColor,
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: primaryColor,
          textStyle: const TextStyle(color: backgroundColor),
        ),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          foregroundColor: primaryColor,
          side:const BorderSide(color: primaryColor),
        ),
      ),
      colorScheme: ColorScheme.fromSwatch().copyWith(
        secondary: secondaryColor, // Используется для акцентов
      ),
    );
  }
}
