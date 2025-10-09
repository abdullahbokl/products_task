import 'package:flutter/material.dart';
import 'colors.dart';
import 'responsive.dart';

class AppThemes {
  static final ThemeData staticLightTheme = ThemeData(
    primaryColor: AppColors.primaryGreen,
    scaffoldBackgroundColor: AppColors.lightGray,
    appBarTheme: const AppBarTheme(
      backgroundColor: AppColors.white,
      foregroundColor: AppColors.darkGray,
      elevation: 0,
      titleTextStyle: TextStyle(
        color: AppColors.darkGray,
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
    ),
    textTheme: const TextTheme(
      displayLarge: TextStyle(
        color: AppColors.darkGray,
        fontSize: 24,
        fontWeight: FontWeight.bold,
      ),
      displayMedium: TextStyle(
        color: AppColors.darkGray,
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
      bodyLarge: TextStyle(
        color: AppColors.darkGray,
        fontSize: 16,
        fontWeight: FontWeight.w500,
      ),
      bodyMedium: TextStyle(color: AppColors.mediumGray, fontSize: 14),
      bodySmall: TextStyle(color: AppColors.lightText, fontSize: 12),
      labelLarge: TextStyle(
        color: AppColors.white,
        fontSize: 16,
        fontWeight: FontWeight.bold,
      ),
      labelMedium: TextStyle(
        color: AppColors.primaryBlue,
        fontSize: 14,
        fontWeight: FontWeight.w500,
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.primaryGreen,
        foregroundColor: AppColors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
      ),
    ),
    inputDecorationTheme: const InputDecorationTheme(
      filled: true,
      fillColor: AppColors.white,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(8)),
        borderSide: BorderSide(color: AppColors.borderGray),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(8)),
        borderSide: BorderSide(color: AppColors.borderGray),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(8)),
        borderSide: BorderSide(color: AppColors.primaryGreen, width: 2),
      ),
      hintStyle: TextStyle(color: AppColors.mediumGray),
      contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
    ),
    cardTheme: CardThemeData(
      color: AppColors.white,
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
    ),
    colorScheme: const ColorScheme.light(
      primary: AppColors.primaryGreen,
      secondary: AppColors.primaryBlue,
      error: AppColors.accentRed,
      surface: AppColors.white,
    ),
  );

  /// Responsive theme (used after Responsive is initialized)
  static ThemeData get lightTheme => ThemeData(
    primaryColor: AppColors.primaryGreen,
    scaffoldBackgroundColor: AppColors.lightGray,
    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.white,
      foregroundColor: AppColors.darkGray,
      elevation: 0,
      titleTextStyle: TextStyle(
        color: AppColors.darkGray,
        fontSize: Responsive.scaleFontSize(20),
        fontWeight: FontWeight.bold,
      ),
    ),
    textTheme: TextTheme(
      displayLarge: TextStyle(
        color: AppColors.darkGray,
        fontSize: Responsive.scaleFontSize(24),
        fontWeight: FontWeight.bold,
      ),
      displayMedium: TextStyle(
        color: AppColors.darkGray,
        fontSize: Responsive.scaleFontSize(20),
        fontWeight: FontWeight.bold,
      ),
      bodyLarge: TextStyle(
        color: AppColors.darkGray,
        fontSize: Responsive.scaleFontSize(16),
        fontWeight: FontWeight.w500,
      ),
      bodyMedium: TextStyle(
        color: AppColors.mediumGray,
        fontSize: Responsive.scaleFontSize(14),
      ),
      bodySmall: TextStyle(
        color: AppColors.lightText,
        fontSize: Responsive.scaleFontSize(12),
      ),
      labelLarge: TextStyle(
        color: AppColors.white,
        fontSize: Responsive.scaleFontSize(16),
        fontWeight: FontWeight.bold,
      ),
      labelMedium: TextStyle(
        color: AppColors.primaryBlue,
        fontSize: Responsive.scaleFontSize(14),
        fontWeight: FontWeight.w500,
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.primaryGreen,
        foregroundColor: AppColors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(Responsive.scaleRadius(8)),
        ),
        padding: EdgeInsets.symmetric(
          horizontal: Responsive.scaleSpacing(24),
          vertical: Responsive.scaleSpacing(12),
        ),
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: AppColors.white,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(Responsive.scaleRadius(8)),
        borderSide: BorderSide(color: AppColors.borderGray),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(Responsive.scaleRadius(8)),
        borderSide: BorderSide(color: AppColors.borderGray),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(Responsive.scaleRadius(8)),
        borderSide: BorderSide(color: AppColors.primaryGreen, width: 2),
      ),
      hintStyle: TextStyle(color: AppColors.mediumGray),
      contentPadding: EdgeInsets.symmetric(
        horizontal: Responsive.scaleSpacing(16),
        vertical: Responsive.scaleSpacing(12),
      ),
    ),
    cardTheme: CardThemeData(
      color: AppColors.white,
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(Responsive.scaleRadius(12)),
      ),
    ),
    colorScheme: ColorScheme.light(
      primary: AppColors.primaryGreen,
      secondary: AppColors.primaryBlue,
      error: AppColors.accentRed,
      surface: AppColors.white,
    ),
  );
}
