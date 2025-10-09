import 'app_localization.dart';

class AppLocalizationEn implements AppLocalization {
  @override
  String get appTitle => 'My Products';

  @override
  String get products => 'Products';

  // Empty state
  @override
  String get noProductsYet => 'No Products Yet';

  @override
  String get startByAddingFirstProduct => 'Start by adding your first product';

  @override
  String get addProduct => 'Add Product';

  // Display toggle
  @override
  String get changeToVertical => 'Change to vertical view';

  @override
  String get changeToHorizontal => 'Change to horizontal view';

  // Product details
  @override
  String get productPlaceholderText => 'This is a sample text';

  @override
  String get storeName => 'Store Name';

  @override
  String get currency => 'Dollar';

  // Categories
  @override
  String get categories => 'Categories';

  @override
  String get viewAll => 'View All';

  @override
  String get category1 => 'Category 1';

  @override
  String get category2 => 'Category 2';

  @override
  String get category3 => 'Category 3';

  // Error messages
  @override
  String get errorTitle => 'Oops! Something went wrong';

  @override
  String get errorFallback => 'Something went wrong';

  @override
  String get tryAgain => 'Try Again';

  // Product sample data
  @override
  String get sampleProductName => 'This is a sample text';

  @override
  String get sampleStoreName => 'Store Name';

  @override
  String get sampleCategory => 'Architecture';
}

