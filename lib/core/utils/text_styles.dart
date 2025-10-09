import 'package:flutter/material.dart';
import 'colors.dart';
import 'responsive.dart';

class AppTextStyles {
  // Font family
  static const String fontFamily = 'Montserrat';

  // Base font sizes
  static const double _baseHeading1Size = 24.0;
  static const double _baseHeading2Size = 20.0;
  static const double _baseHeading3Size = 16.0;
  static const double _baseBodyLargeSize = 16.0;
  static const double _baseBodyMediumSize = 14.0;
  static const double _baseBodySmallSize = 12.0;
  static const double _baseButtonSize = 14.0;
  static const double _basePriceSize = 16.0;
  static const double _baseAccentSize = 14.0;
  static const double _baseCaptionSize = 12.0;
  static const double _baseEmptyStateTitleSize = 24.0;
  static const double _baseEmptyStateSubtitleSize = 16.0;
  static const double _baseCategoryTitleSize = 12.0;
  static const double _baseAppBarTitleSize = 24.0;
  static const double _baseWhiteButtonSize = 12.0;

  // Responsive Heading styles
  static TextStyle get heading1 => TextStyle(
    fontFamily: fontFamily,
    fontSize: Responsive.scaleFontSize(_baseHeading1Size),
    fontWeight: FontWeight.bold,
    color: AppColors.darkGray,
  );

  static TextStyle get heading2 => TextStyle(
    fontFamily: fontFamily,
    fontSize: Responsive.scaleFontSize(_baseHeading2Size),
    fontWeight: FontWeight.bold,
    color: AppColors.darkGray,
  );

  static TextStyle get heading3 => TextStyle(
    fontFamily: fontFamily,
    fontSize: Responsive.scaleFontSize(_baseHeading3Size),
    fontWeight: FontWeight.bold,
    color: AppColors.darkGray,
  );

  // Responsive Body text styles
  static TextStyle get bodyLarge => TextStyle(
    fontFamily: fontFamily,
    fontSize: Responsive.scaleFontSize(_baseBodyLargeSize),
    fontWeight: FontWeight.w500,
    color: AppColors.darkGray,
  );

  static TextStyle get bodyMedium => TextStyle(
    fontFamily: fontFamily,
    fontSize: Responsive.scaleFontSize(_baseBodyMediumSize),
    fontWeight: FontWeight.w400,
    color: AppColors.darkGray,
  );

  static TextStyle get bodySmall => TextStyle(
    fontFamily: fontFamily,
    fontSize: Responsive.scaleFontSize(_baseBodySmallSize),
    fontWeight: FontWeight.w400,
    color: AppColors.mediumGray,
  );

  // Responsive Button text styles
  static TextStyle get button => TextStyle(
    fontFamily: fontFamily,
    fontSize: Responsive.scaleFontSize(_baseButtonSize),
    fontWeight: FontWeight.w500,
    color: AppColors.white,
  );

  // Responsive Price/special emphasis
  static TextStyle get price => TextStyle(
    fontFamily: fontFamily,
    fontSize: Responsive.scaleFontSize(_basePriceSize),
    fontWeight: FontWeight.bold,
    color: AppColors.primaryGreen,
  );

  // Responsive Accent text
  static TextStyle get accent => TextStyle(
    fontFamily: fontFamily,
    fontSize: Responsive.scaleFontSize(_baseAccentSize),
    fontWeight: FontWeight.w500,
    color: AppColors.accentRed,
  );

  // Responsive Caption/label text
  static TextStyle get caption => TextStyle(
    fontFamily: fontFamily,
    fontSize: Responsive.scaleFontSize(_baseCaptionSize),
    fontWeight: FontWeight.w400,
    color: AppColors.mediumGray,
  );

  // Responsive Empty state title
  static TextStyle get emptyStateTitle => TextStyle(
    fontFamily: fontFamily,
    fontSize: Responsive.scaleFontSize(_baseEmptyStateTitleSize),
    fontWeight: FontWeight.bold,
    color: AppColors.darkGray,
  );

  // Responsive Empty state subtitle
  static TextStyle get emptyStateSubtitle => TextStyle(
    fontFamily: fontFamily,
    fontSize: Responsive.scaleFontSize(_baseEmptyStateSubtitleSize),
    fontWeight: FontWeight.w400,
    color: AppColors.mediumGray,
  );

  // Responsive Category title
  static TextStyle get categoryTitle => TextStyle(
    fontFamily: fontFamily,
    fontSize: Responsive.scaleFontSize(_baseCategoryTitleSize),
    fontWeight: FontWeight.w500,
    color: AppColors.darkGray,
  );

  // Responsive App bar title
  static TextStyle get appBarTitle => TextStyle(
    fontFamily: fontFamily,
    fontSize: Responsive.scaleFontSize(_baseAppBarTitleSize),
    fontWeight: FontWeight.bold,
    color: const Color(0xFF2C3E50),
  );

  // Responsive White text variations
  static TextStyle get whiteButton => TextStyle(
    fontFamily: fontFamily,
    fontSize: Responsive.scaleFontSize(_baseWhiteButtonSize),
    fontWeight: FontWeight.bold,
    color: AppColors.white,
  );
}
