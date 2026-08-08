import 'package:flutter/material.dart';
import 'package:my_portfolio2/core/app_colors.dart';

enum AppTheme {
  todoLight("الوضع الفاتح"),
  todoDark("الوضع المظلم");

  const AppTheme(this.name);
  final String name;
}

final appThemeData = {
  // 🌞 Light Theme
  AppTheme.todoLight: ThemeData(
    fontFamily: 'Cairo',
    useMaterial3: true,
    brightness: Brightness.light,
    colorScheme: ColorScheme.light(
      primary: AppColors.lightPrimary,
      onPrimary: Colors.white,
      secondary: AppColors.lightSecondary,
      onSecondary: Colors.white,
      surface: const Color(0xFFFFFFFF), // card/background فاتح
      onSurface: AppColors.lightTextSecondary,
      error: AppColors.error,
      onError: Colors.white,
    ),
    scaffoldBackgroundColor: const Color(0xFFF2F4F7), // 👈 مش أبيض صريح
    // ✅ AppBar بلون رمادي خفيف مش pure white
    appBarTheme: const AppBarTheme(
      backgroundColor: Color(0xFFF9FAFB), // off-white
      foregroundColor: Colors.black87,
      elevation: 1,
      centerTitle: true,
      titleTextStyle: TextStyle(
        color: Colors.black87,
        fontSize: 18,
        fontWeight: FontWeight.bold,
      ),
    ),

    listTileTheme: const ListTileThemeData(
      tileColor: Colors.white, // card-style
      textColor: AppColors.lightTextPrimary,
      iconColor: AppColors.lightSecondary,
    ),

    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: Colors.white,
      selectedItemColor: AppColors.lightPrimary,
      unselectedItemColor: AppColors.lightTextSecondary,
      showUnselectedLabels: true,
      elevation: 10,
    ),

    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        foregroundColor: AppColors.lightPrimary,
        textStyle: const TextStyle(fontWeight: FontWeight.bold),
      ),
    ),

    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.lightPrimary,
        foregroundColor: Colors.white,
        elevation: 3,
        textStyle: const TextStyle(fontWeight: FontWeight.bold),
      ),
    ),

    textTheme: const TextTheme(
      bodyMedium: TextStyle(color: AppColors.lightTextPrimary),
      titleMedium: TextStyle(color: AppColors.lightTextPrimary),
    ),

    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        foregroundColor: AppColors.lightBackground,
        side: const BorderSide(color: AppColors.lightSecondary, width: 1.5),
        textStyle: const TextStyle(fontWeight: FontWeight.bold),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
      ),
    ),
  ),

  // 🌙 Dark Theme
  AppTheme.todoDark: ThemeData(
    fontFamily: 'Cairo',
    useMaterial3: true,
    brightness: Brightness.dark,
    colorScheme: ColorScheme.dark(
      primary: AppColors.darkPrimary,
      onPrimary: Colors.white, // لازم فاتح يبان فوق الأزرق الغامق
      secondary: AppColors.darkSecondary,
      onSecondary: Colors.black,
      surface: AppColors.darkSurface,
      onSurface: AppColors.darkTextSecondary,
      error: AppColors.error,
      onError: Colors.white,
    ),
    scaffoldBackgroundColor: AppColors.darkBackground,
    appBarTheme: const AppBarTheme(
      backgroundColor: AppColors.darkSurface,
      foregroundColor: Colors.white,
      elevation: 0,
      centerTitle: true,
      titleTextStyle: TextStyle(
        color: Colors.white,
        fontSize: 18,
        fontWeight: FontWeight.bold,
      ),
    ),
    listTileTheme: const ListTileThemeData(
      tileColor: AppColors.darkSurface,
      textColor: AppColors.darkTextPrimary,
      iconColor: AppColors.darkSecondary,
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: AppColors.darkSurface,
      selectedItemColor: AppColors.darkPrimary,
      unselectedItemColor: AppColors.darkTextSecondary,
      showUnselectedLabels: true,
      elevation: 10,
    ),
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        foregroundColor: AppColors.darkSecondary,
        textStyle: const TextStyle(fontWeight: FontWeight.bold),
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.darkPrimary,
        foregroundColor: Colors.white,
        elevation: 3,
        textStyle: const TextStyle(fontWeight: FontWeight.bold),
      ),
    ),
    textTheme: const TextTheme(
      bodyMedium: TextStyle(color: AppColors.darkTextPrimary),
      titleMedium: TextStyle(color: AppColors.darkTextPrimary),
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        foregroundColor: Colors.white, // يخلي النص و الأيقونة تبان
        side: const BorderSide(color: Colors.white, width: 1.5),
        textStyle: const TextStyle(fontWeight: FontWeight.bold),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
      ),
    ),
  ),
};
