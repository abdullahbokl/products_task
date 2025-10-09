import 'app_localization.dart';

class AppLocalizationAr implements AppLocalization {
  @override
  String get appTitle => 'منتجاتي';

  @override
  String get products => 'المنتجات';

  // Empty state
  @override
  String get noProductsYet => 'لا توجد منتجات بعد';

  @override
  String get startByAddingFirstProduct => 'ابدأ بإضافة منتجك الأول';

  @override
  String get addProduct => 'إضافة منتج';

  // Display toggle
  @override
  String get changeToVertical => 'تغيير عرض المنتجات الى عمودي';

  @override
  String get changeToHorizontal => 'تغيير عرض المنتجات الى افقي';

  // Product details
  @override
  String get productPlaceholderText => 'هذا النص هو مثال لنص';

  @override
  String get storeName => 'اسم المتجر';

  @override
  String get currency => 'دولار';

  // Categories
  @override
  String get categories => 'التصنيفات';

  @override
  String get viewAll => 'عرض الكل';

  @override
  String get category1 => 'تصنيف 1';

  @override
  String get category2 => 'تصنيف 2';

  @override
  String get category3 => 'تصنيف 3';

  // Error messages
  @override
  String get errorTitle => 'عذراً! حدث خطأ ما';

  @override
  String get errorFallback => 'حدث خطأ ما';

  @override
  String get tryAgain => 'حاول مرة أخرى';

  // Product sample data
  @override
  String get sampleProductName => 'هذا النص هو مثال لنص';

  @override
  String get sampleStoreName => 'اسم المتجر';

  @override
  String get sampleCategory => 'معماري';
}

