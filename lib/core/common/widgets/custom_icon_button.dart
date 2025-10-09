import 'package:flutter/material.dart';
import '../../utils/app_dimensions.dart';
import '../../utils/colors.dart';

/// Reusable custom icon button with consistent styling
class CustomIconButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final Widget icon;
  final double? size;
  final Color? backgroundColor;
  final Color? borderColor;
  final double? borderWidth;
  final double? borderRadius;
  final EdgeInsetsGeometry? padding;

  const CustomIconButton({
    super.key,
    required this.onPressed,
    required this.icon,
    this.size,
    this.backgroundColor,
    this.borderColor,
    this.borderWidth,
    this.borderRadius,
    this.padding,
  });

  /// Factory for app bar add button style
  factory CustomIconButton.appBarAdd({
    required VoidCallback? onPressed,
  }) {
    return CustomIconButton(
      onPressed: onPressed,
      icon: Icon(
        Icons.add,
        color: Colors.black,
        size: AppDimensions.iconSizeSmall,
      ),
      size: AppDimensions.iconSizeLarge,
      backgroundColor: AppColors.white,
      borderColor: AppColors.borderGray,
      borderWidth: AppDimensions.cardBorderWidth,
      borderRadius: AppDimensions.radiusLarge,
      padding: EdgeInsets.zero,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size ?? AppDimensions.iconSizeLarge,
      height: size ?? AppDimensions.iconSizeLarge,
      decoration: BoxDecoration(
        color: backgroundColor ?? AppColors.white,
        borderRadius: BorderRadius.circular(
          borderRadius ?? AppDimensions.radiusLarge,
        ),
        border: borderColor != null
            ? Border.all(
                color: borderColor!,
                width: borderWidth ?? AppDimensions.cardBorderWidth,
              )
            : null,
      ),
      child: IconButton(
        onPressed: onPressed,
        icon: icon,
        padding: padding ?? EdgeInsets.zero,
      ),
    );
  }
}

