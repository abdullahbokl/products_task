import 'responsive.dart';

/// App-wide dimension constants to avoid magic numbers
/// All dimensions are now responsive and scale based on screen size
class AppDimensions {
  // Base values (at 375px width)
  static const double _baseSpacingXSmall = 4.0;
  static const double _baseSpacingSmall = 8.0;
  static const double _baseSpacingMedium = 12.0;
  static const double _baseSpacingLarge = 16.0;
  static const double _baseSpacingXLarge = 24.0;

  static const double _basePaddingXSmall = 4.0;
  static const double _basePaddingSmall = 6.0;
  static const double _basePaddingMedium = 8.0;
  static const double _basePaddingLarge = 12.0;
  static const double _basePaddingXLarge = 16.0;

  static const double _baseRadiusSmall = 6.0;
  static const double _baseRadiusMedium = 8.0;
  static const double _baseRadiusLarge = 12.0;

  static const double _baseIconSizeSmall = 24.0;
  static const double _baseIconSizeMedium = 32.0;
  static const double _baseIconSizeLarge = 48.0;

  static const double _baseCardBorderWidth = 1.0;
  static const double _baseCategoryCardBorderWidth = 2.0;

  static const double _baseProductCardImageWidth = 114.0;
  static const double _baseProductCardImageHeight = 115.0;
  static const double _baseProductCardImageWidthCompact = 100.0;
  static const double _baseProductCardImageHeightCompact = 100.0;

  static const double _baseImagePickerGridHeight = 120.0;
  static const double _baseImagePickerButtonHeight = 60.0;

  static const double _baseCategoryCardWidth = 100.0;
  static const double _baseCategoryCardHeight = 120.0;
  static const double _baseCategoryCardInnerPaddingTop = 7.0;
  static const double _baseCategoryCardInnerPaddingHorizontal = 7.0;
  static const double _baseCategoryCardInnerPaddingBottom = 12.0;

  static const double _baseShadowBlurRadius = 4.0;
  static const double _baseShadowOffsetY = 2.0;
  static const double _baseShadowOpacity = 0.1;

  // Responsive Spacing
  static double get spacingXSmall => Responsive.scaleSpacing(_baseSpacingXSmall);
  static double get spacingSmall => Responsive.scaleSpacing(_baseSpacingSmall);
  static double get spacingMedium => Responsive.scaleSpacing(_baseSpacingMedium);
  static double get spacingLarge => Responsive.scaleSpacing(_baseSpacingLarge);
  static double get spacingXLarge => Responsive.scaleSpacing(_baseSpacingXLarge);

  // Responsive Padding
  static double get paddingXSmall => Responsive.scaleSpacing(_basePaddingXSmall);
  static double get paddingSmall => Responsive.scaleSpacing(_basePaddingSmall);
  static double get paddingMedium => Responsive.scaleSpacing(_basePaddingMedium);
  static double get paddingLarge => Responsive.scaleSpacing(_basePaddingLarge);
  static double get paddingXLarge => Responsive.scaleSpacing(_basePaddingXLarge);

  // Responsive Border Radius
  static double get radiusSmall => Responsive.scaleRadius(_baseRadiusSmall);
  static double get radiusMedium => Responsive.scaleRadius(_baseRadiusMedium);
  static double get radiusLarge => Responsive.scaleRadius(_baseRadiusLarge);

  // Responsive Icon Sizes
  static double get iconSizeSmall => Responsive.scaleSize(_baseIconSizeSmall);
  static double get iconSizeMedium => Responsive.scaleSize(_baseIconSizeMedium);
  static double get iconSizeLarge => Responsive.scaleSize(_baseIconSizeLarge);

  // Card Dimensions
  static const double cardElevation = 0.0;
  static double get cardBorderWidth => Responsive.scaleSize(_baseCardBorderWidth);
  static double get categoryCardBorderWidth => Responsive.scaleSize(_baseCategoryCardBorderWidth);

  // Responsive Product Card
  static double get productCardImageWidth => Responsive.scaleWidth(_baseProductCardImageWidth);
  static double get productCardImageHeight => Responsive.scaleHeight(_baseProductCardImageHeight);
  static double get productCardImageWidthCompact => Responsive.scaleWidth(_baseProductCardImageWidthCompact);
  static double get productCardImageHeightCompact => Responsive.scaleHeight(_baseProductCardImageHeightCompact);

  // Responsive Image Picker
  static double get imagePickerGridHeight => Responsive.scaleHeight(_baseImagePickerGridHeight);
  static double get imagePickerButtonHeight => Responsive.scaleHeight(_baseImagePickerButtonHeight);

  // Responsive Category Card
  static double get categoryCardWidth => Responsive.scaleWidth(_baseCategoryCardWidth);
  static double get categoryCardHeight => Responsive.scaleHeight(_baseCategoryCardHeight);
  static double get categoryCardInnerPaddingTop => Responsive.scaleSpacing(_baseCategoryCardInnerPaddingTop);
  static double get categoryCardInnerPaddingHorizontal => Responsive.scaleSpacing(_baseCategoryCardInnerPaddingHorizontal);
  static double get categoryCardInnerPaddingBottom => Responsive.scaleSpacing(_baseCategoryCardInnerPaddingBottom);

  // Shadow (keep static as they're already small values)
  static double get shadowBlurRadius => Responsive.scaleSize(_baseShadowBlurRadius);
  static double get shadowOffsetY => Responsive.scaleSize(_baseShadowOffsetY);
  static const double shadowOpacity = _baseShadowOpacity;
}
