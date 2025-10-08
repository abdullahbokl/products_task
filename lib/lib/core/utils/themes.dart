import 'package:flutter/material.dart';

import 'colors.dart';

class AppThemes {
  static final ThemeData lightTheme = ThemeData(
    primaryColor: AppColors.primaryGreen,
    scaffoldBackgroundColor: AppColors.lightGray,
    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.white,
      foregroundColor: AppColors.darkGray,
      elevation: 0,
      titleTextStyle: TextStyle(
        color: AppColors.darkGray,
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
    ),
    textTheme: TextTheme(
      displayLarge: TextStyle(
        color: AppColors.darkGray,
        fontSize: 24,
        fontWeight: FontWeight.bold,
      ),
      // Screen Titles
      displayMedium: TextStyle(
        color: AppColors.darkGray,
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
      // Product Names
      bodyLarge: TextStyle(color: AppColors.darkGray, fontSize: 16),
      // General text
      bodyMedium: TextStyle(color: AppColors.mediumGray, fontSize: 14),
      // Placeholder text, secondary info
      labelLarge: TextStyle(
        color: AppColors.white,
        fontSize: 16,
        fontWeight: FontWeight.bold,
      ),
      // Button text
      labelMedium: TextStyle(color: AppColors.blue, fontSize: 14), // Price text
    ),
    buttonTheme: ButtonThemeData(
      buttonColor: AppColors.primaryGreen,
      textTheme: ButtonTextTheme.primary,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
    ),
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: AppColors.white,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: BorderSide.none,
      ),
      hintStyle: TextStyle(color: AppColors.mediumGray),
    ),
    colorScheme: ColorScheme.light(
      primary: AppColors.primaryGreen,
      secondary: AppColors.primaryGreen,
      error: AppColors.accentRed,
    ).copyWith(background: AppColors.lightGray),
  );
}
