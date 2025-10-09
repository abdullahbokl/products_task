import 'package:flutter/material.dart';

/// Responsive utility class to handle screen size adaptations
class Responsive {
  static late double _screenWidth;
  static late double _screenHeight;

  /// Initialize responsive system with context
  static void init(BuildContext context) {
    final MediaQueryData mediaQuery = MediaQuery.of(context);
    _screenWidth = mediaQuery.size.width;
    _screenHeight = mediaQuery.size.height;
  }

  /// Get screen width
  static double get screenWidth => _screenWidth;

  /// Get screen height
  static double get screenHeight => _screenHeight;

  /// Calculate scale factor based on screen width (375 is base width - iPhone 11)
  static double getScaleFactor() {
    const double baseWidth = 375.0;
    return _screenWidth / baseWidth;
  }

  /// Scale font size responsively with limits
  static double scaleFontSize(double fontSize) {
    double scaleFactor = getScaleFactor();
    double responsiveFontSize = fontSize * scaleFactor;

    double lowerLimit = fontSize * 0.9;
    double upperLimit = fontSize * 1.2;

    return responsiveFontSize.clamp(lowerLimit, upperLimit);
  }

  /// Scale width responsively
  static double scaleWidth(double width) {
    double scaleFactor = getScaleFactor();
    double responsiveWidth = width * scaleFactor;

    double lowerLimit = width * 0.85;
    double upperLimit = width * 1.3;

    return responsiveWidth.clamp(lowerLimit, upperLimit);
  }

  /// Scale height responsively
  static double scaleHeight(double height) {
    double scaleFactor = getScaleFactor();
    double responsiveHeight = height * scaleFactor;

    double lowerLimit = height * 0.85;
    double upperLimit = height * 1.3;

    return responsiveHeight.clamp(lowerLimit, upperLimit);
  }

  /// Scale size (used for square dimensions like icons, borders)
  static double scaleSize(double size) {
    double scaleFactor = getScaleFactor();
    double responsiveSize = size * scaleFactor;

    double lowerLimit = size * 0.9;
    double upperLimit = size * 1.15;

    return responsiveSize.clamp(lowerLimit, upperLimit);
  }

  /// Scale radius
  static double scaleRadius(double radius) {
    double scaleFactor = getScaleFactor();
    double responsiveRadius = radius * scaleFactor;

    double lowerLimit = radius * 0.9;
    double upperLimit = radius * 1.2;

    return responsiveRadius.clamp(lowerLimit, upperLimit);
  }

  /// Scale spacing/padding
  static double scaleSpacing(double spacing) {
    double scaleFactor = getScaleFactor();
    double responsiveSpacing = spacing * scaleFactor;

    double lowerLimit = spacing * 0.85;
    double upperLimit = spacing * 1.25;

    return responsiveSpacing.clamp(lowerLimit, upperLimit);
  }
}
