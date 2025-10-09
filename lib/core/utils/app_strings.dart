import 'package:flutter/material.dart';
import '../localization/app_localization_delegate.dart';

class AppStrings {
  static String appBarProducts(BuildContext context) => context.loc.products;
  static String emptyProductsTitle(BuildContext context) => context.loc.noProductsYet;
  static String emptyProductsSubtitle(BuildContext context) => context.loc.startByAddingFirstProduct;
  static String addProductButton(BuildContext context) => context.loc.addProduct;
  static String toggleToVertical(BuildContext context) => context.loc.changeToVertical;
  static String toggleToHorizontal(BuildContext context) => context.loc.changeToHorizontal;
  static String productPlaceholderText(BuildContext context) => context.loc.productPlaceholderText;
  static String storeName(BuildContext context) => context.loc.storeName;
  static String currencyDollar(BuildContext context) => context.loc.currency;
  static String categoriesTitle(BuildContext context) => context.loc.categories;
  static String viewAllCategories(BuildContext context) => context.loc.viewAll;
  static String category1(BuildContext context) => context.loc.category1;
  static String category2(BuildContext context) => context.loc.category2;
  static String category3(BuildContext context) => context.loc.category3;
  static String errorTitle(BuildContext context) => context.loc.errorTitle;
  static String errorFallback(BuildContext context) => context.loc.errorFallback;
  static String tryAgainButton(BuildContext context) => context.loc.tryAgain;
  static String sampleProductName(BuildContext context) => context.loc.sampleProductName;
  static String sampleStoreName(BuildContext context) => context.loc.sampleStoreName;
  static String sampleCategory(BuildContext context) => context.loc.sampleCategory;

  // Add Product Screen Strings
  static String addProductTitle(BuildContext context) => 'إضافة منتج جديد';
  static String productNameLabel(BuildContext context) => 'اسم المنتج';
  static String productNameHint(BuildContext context) => 'أدخل اسم المنتج';
  static String priceLabel(BuildContext context) => 'السعر';
  static String priceHint(BuildContext context) => 'أدخل سعر المنتج';
  static String storeNameLabel(BuildContext context) => 'اسم المتجر';
  static String storeNameHint(BuildContext context) => 'أدخل اسم المتجر';
  static String categoryLabel(BuildContext context) => 'التصنيف';
  static String categoryHint(BuildContext context) => 'اختر فئة المنتج';
  static String productImagesLabel(BuildContext context) => 'صور المنتج';
  static String addProductImage(BuildContext context) => 'إضافة صورة المنتج';
  static String fieldRequired(BuildContext context) => 'هذا الحقل مطلوب';
  static String invalidPrice(BuildContext context) => 'السعر غير صحيح';
  static String productAddedSuccess(BuildContext context) => 'تم إضافة المنتج بنجاح';

  // Empty Category State
  static String noCategoryProducts(BuildContext context) => 'لا توجد منتجات في هذه الفئة';
  static String noCategoryProductsHint(BuildContext context) => 'اختر فئة أخرى أو أضف منتجات جديدة';

  // Image URLs remain static
  static const String sampleImageUrl = 'https://images.unsplash.com/photo-1486406146926-c627a92ad1ab?w=400';
  static const String categoryImage1 = 'https://images.unsplash.com/photo-1441974231531-c6227db76b6e?w=200';
  static const String categoryImage2 = 'https://images.unsplash.com/photo-1441974231531-c6227db76b6e?w=200';
  static const String categoryImage3 = 'https://images.unsplash.com/photo-1586023492125-27b2c045efd7?w=200';
}
