# Products Task

A modern, responsive Flutter application for managing and browsing products with support for multiple categories, bilingual interface (Arabic/English), and a clean, intuitive UI.

## 📱 App Overview

Products Task is a fully-featured product management application built with Flutter, demonstrating best practices in mobile app development including Clean Architecture, state management with BLoC, and responsive design principles.

## 🎯 Features


### Technical Features
- 🏗️ **Clean Architecture** - Separation of concerns with data, domain, and presentation layers
- 🔄 **BLoC State Management** - Predictable state management using flutter_bloc
- 🎨 **Responsive Design** - Fully responsive UI that adapts to all screen sizes
- 🧩 **Reusable Components** - Modular, reusable widgets for consistent UI
- 🌐 **Internationalization** - Full support for Arabic and English languages
- 🎭 **Custom Navigation Service** - Context-independent navigation system
- 📦 **Dependency Injection** - Using GetIt and Injectable for DI
- 💾 **Local Data Storage** - JSON-based local data persistence
- 🔧 **Service Locator Pattern** - Centralized service management
- ⚡ **Performance Optimized** - Efficient state management and rendering
- 🎨 **Custom Themes** - Consistent theming with Material Design 3
- 📐 **AppDimensions System** - No magic numbers, all dimensions centralized
- 🎯 **Type Safety** - Strong typing with Dart
- 🖼️ **Image Loading** - Smart image loading with loaders and error handling
- 📱 **Device Preview** - Testing on multiple device sizes


### Core Features
- ✅ **Product Listing** - Browse products in horizontal or vertical grid layouts
- ✅ **Category Filtering** - Filter products by categories with dynamic category cards
- ✅ **Add Products** - Add new products with multiple images, name, store, price, and category
- ✅ **Delete Products** - Remove products with confirmation
- ✅ **Image Management** - Select and manage multiple product images from gallery
- ✅ **Filter** - Real-time category-based filtering
- ✅ **Display Toggle** - Switch between horizontal and vertical product layouts
- ✅ **Empty States** - Elegant empty state screens with helpful messages

## 🏛️ Architecture

### Clean Architecture Layers

```
lib/
├── core/                       # Core utilities and shared resources
│   ├── common/                 # Shared widgets and components
│   │   └── widgets/           # Reusable UI components
│   ├── constants/             # App constants and enums
│   ├── errors/                # Error handling
│   ├── helpers/               # Helper utilities
│   ├── localization/          # i18n support
│   ├── services/              # Core services
│   │   ├── cache_services/   # Caching logic
│   │   ├── navigation/       # Custom navigation service
│   │   └── service_locator/  # DI configuration
│   └── utils/                 # Utility classes
│       ├── app_dimensions.dart    # Responsive dimensions
│       ├── text_styles.dart       # Typography
│       ├── colors.dart            # Color palette
│       ├── responsive.dart        # Responsive utilities
│       └── themes.dart            # App themes
│
└── features/                   # Feature modules
    └── products/
        ├── data/              # Data layer
        │   ├── datasources/   # Data sources (local/remote)
        │   ├── models/        # Data models
        │   └── repositories/  # Repository implementations
        ├── domain/            # Domain layer
        │   ├── entities/      # Business entities
        │   ├── repositories/  # Repository interfaces
        │   └── usecases/      # Business logic use cases
        └── presentation/      # Presentation layer
            ├── cubit/         # BLoC/Cubit state management
            ├── pages/         # Screen widgets
            └── widgets/       # Feature-specific widgets
```

## 🎨 Design Patterns Used

1. **Clean Architecture** - Clear separation of concerns
2. **Repository Pattern** - Abstraction of data sources
3. **BLoC Pattern** - Unidirectional data flow
4. **Service Locator Pattern** - Dependency management
5. **Factory Pattern** - Object creation
6. **Singleton Pattern** - Single instance services
7. **Observer Pattern** - State change notifications

## 🛠️ Technologies & Packages

### Flutter SDK
- **Version**: 3.35.5
- **Dart SDK**: ^3.9.2

### State Management
- `flutter_bloc: ^9.1.1` - BLoC state management
- `equatable: ^2.0.7` - Value equality

### Dependency Injection
- `get_it: ^8.2.0` - Service locator
- `injectable: ^2.5.2` - Code generation for DI

### UI & UX
- `flutter_spinkit: ^5.2.2` - Loading indicators
- `flutter_animate: ^4.5.2` - Smooth animations
- `google_fonts: ^6.3.2` - Custom fonts
- `device_preview: ^1.3.1` - Multi-device testing

### Utilities
- `image_picker: ^1.0.7` - Image selection
- `uuid: ^4.5.1` - Unique ID generation
- `dartz: ^0.10.1` - Functional programming

### Development
- `injectable_generator: ^2.9.0` - DI code generation
- `build_runner: ^2.9.0` - Code generation
- `flutter_lints: ^5.0.0` - Linting rules

## 📸 Screenshots

### Product List Screen
<img src="screenshots/2025-10-09 18 31 41 105  Gemoo Snap.png" width="250" alt="Product List - Horizontal View">

### Product List - Vertical Layout
<img src="screenshots/2025-10-09 18 31 54 249  Gemoo Snap.png" width="250" alt="Product List - Vertical View">

### Category Filtering
<img src="screenshots/2025-10-09 18 32 13 316  Gemoo Snap.png" width="250" alt="Category Filtering">

### Add Product Screen
<img src="screenshots/2025-10-09 18 37 19 864  Gemoo Snap.png" width="250" alt="Add Product Form">

### Product Management
<img src="screenshots/2025-10-09 18 37 37 404  Gemoo Snap.png" width="250" alt="Product Management">

## 🚀 Getting Started

### Prerequisites
- Flutter SDK 3.35.5 or higher
- Dart SDK 3.9.2 or higher
- Android Studio / VS Code with Flutter extensions
- iOS development tools (for iOS builds)

### Installation

1. **Clone the repository**
```bash
git clone <repository-url>
cd products_task
```

2. **Install dependencies**
```bash
flutter pub get
```

3. **Run code generation** (for dependency injection)
```bash
flutter pub run build_runner build --delete-conflicting-outputs
```

4. **Run the app**
```bash
flutter run
```

### Device Preview Mode
The app includes device preview for testing on multiple screen sizes:
```dart
// In main.dart, set enabled to true
DevicePreview(
  enabled: true, // Set to false for production
  builder: (context) => const MyApp(),
)
```

## 📱 Responsive Design

The app uses a custom responsive system that adapts to different screen sizes:

- **Small phones** (< 360px): UI scales down
- **Standard phones** (375px): Base size
- **Large phones** (> 414px): UI scales up
- **Tablets** (> 600px): Optimized layout

### Responsive Features
- Scalable fonts (0.9x - 1.2x range)
- Adaptive dimensions (0.85x - 1.3x range)
- Dynamic spacing and padding
- Responsive images and icons

## 🌐 Localization

The app supports multiple languages:
- **Arabic (ar_SA)** - Default
- **English (en_US)**

All strings are externalized using `AppStrings` class with context-based localization.

## 🎨 UI Components

### Reusable Widgets
- `AppText` - Consistent text styling
- `AppLoader` - Loading indicators
- `AppSnackBar` - Toast notifications
- `AppErrorWidget` - Error states
- `CustomIconButton` - Styled icon buttons
- `ProductCard` - Product display cards
- `CategoryCard` - Category selection cards
- `MultiImagePickerSection` - Image selection UI
- `CustomTextFormField` - Form inputs

### Custom Components
- Product list with horizontal/vertical toggle
- Category filter with visual feedback
- Form validation and error handling
- Empty state screens
- Loading states with spinners

## 🔧 Configuration

### App Dimensions
All dimensions are centralized in `AppDimensions`:
```dart
AppDimensions.spacingLarge
AppDimensions.paddingXLarge
AppDimensions.radiusLarge
AppDimensions.iconSizeMedium
```

### Colors
Consistent color palette in `AppColors`:
```dart
AppColors.primaryGreen
AppColors.accentRed
AppColors.darkGray
AppColors.borderGray
```

### Text Styles
Typography system in `AppTextStyles`:
```dart
AppTextStyles.heading1
AppTextStyles.bodyMedium
AppTextStyles.button
AppTextStyles.price
```

## 📂 Data Management

### Product Model
```dart
{
  id: String (UUID)
  name: String
  storeName: String
  price: double
  category: ProductCategory
  imageUrls: List<String>
}
```

### Categories
- All Products
- Electronics
- Clothing
- Food & Beverages
- Home & Garden
- Sports & Outdoors

## 🧪 Testing

The app is ready for testing with:
- Device Preview for UI testing
- Clean architecture for unit testing
- BLoC pattern for state testing
- Repository pattern for data testing

## 🔒 Best Practices Implemented

- ✅ Clean Architecture
- ✅ SOLID Principles
- ✅ DRY (Don't Repeat Yourself)
- ✅ Separation of Concerns
- ✅ Dependency Inversion
- ✅ Single Responsibility
- ✅ Type Safety
- ✅ Error Handling
- ✅ Null Safety
- ✅ Immutable State
- ✅ Responsive Design
- ✅ Accessibility

## 📝 Code Style

- Follows official [Flutter style guide](https://dart.dev/guides/language/effective-dart/style)
- Uses `flutter_lints` for code quality
- Consistent naming conventions
- Comprehensive comments and documentation
- No magic numbers or strings

## 🤝 Contributing

Contributions are welcome! Please follow these steps:
1. Fork the repository
2. Create a feature branch
3. Commit your changes
4. Push to the branch
5. Open a pull request

## 📄 License

This project is licensed under the MIT License.

## 👨‍💻 Developer

Developed with ❤️ using Flutter

---

**Built with Flutter 3.35.5** 🚀

