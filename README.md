# Products Task - Flutter App

A clean architecture Flutter application for managing products with two main screens: Product List and Add Product.

## Architecture

This project follows Clean Architecture principles with three main layers:

### Domain Layer (`lib/domain/`)
- **Entities**: Core business objects (Product)
- **Repositories**: Abstract interfaces for data access
- **Use Cases**: Business logic operations (GetProducts, AddProduct, DeleteProduct)

### Data Layer (`lib/data/`)
- **Models**: Data transfer objects (ProductModel)
- **Data Sources**: Local data access (LocalProductDataSource)
- **Repository Implementation**: Concrete implementations of domain repositories

### Presentation Layer (`lib/presentation/`)
- **Cubit**: State management using flutter_bloc
- **Pages**: Screen implementations
- **Widgets**: Reusable UI components

## Features

### Product List Screen
- Grid view of products with images
- Product cards showing name, store, and price
- Delete functionality with confirmation dialog
- Empty state with call-to-action
- Loading and error states

### Add Product Screen
- Form with validation for:
  - Product name (required)
  - Store name (required)
  - Price (required, numeric validation)
  - Category (required)
  - Image URL (optional)
- Real-time form validation
- Success/error feedback

## State Management

Uses **Cubit** from flutter_bloc for state management:
- `ProductCubit` handles product operations
- States: Initial, Loading, Loaded, Error
- Actions: Load products, Add product, Delete product

## Data Source

- **Local JSON**: Products stored in `assets/data/products.json`
- **In-memory storage**: Products cached in memory for the session
- **Dummy data**: Pre-populated with sample products

## Dependencies

- `flutter_bloc`: State management
- `equatable`: Value equality for entities
- `get_it`: Dependency injection
- `uuid`: Unique ID generation

## Project Structure

```
lib/
├── core/
│   ├── di/
│   │   └── service_locator.dart
│   ├── utils/
│   │   ├── colors.dart
│   │   └── themes.dart
│   └── widgets/
│       ├── app_text_field.dart
│       ├── loading_widget.dart
│       └── error_widget.dart
├── domain/
│   ├── entities/
│   │   └── product.dart
│   ├── repositories/
│   │   └── product_repository.dart
│   └── usecases/
│       ├── get_products.dart
│       ├── add_product.dart
│       └── delete_product.dart
├── data/
│   ├── models/
│   │   └── product_model.dart
│   ├── datasources/
│   │   └── local_product_datasource.dart
│   └── repositories/
│       └── product_repository_impl.dart
├── presentation/
│   ├── cubit/
│   │   ├── product_cubit.dart
│   │   └── product_state.dart
│   ├── pages/
│   │   ├── product_list_screen.dart
│   │   └── add_product_screen.dart
│   └── widgets/
│       ├── product_card.dart
│       ├── product_list_app_bar.dart
│       ├── empty_products_widget.dart
│       ├── add_product_app_bar.dart
│       └── add_product_form.dart
└── main.dart
```

## Getting Started

1. Install dependencies:
   ```bash
   flutter pub get
   ```

2. Run the app:
   ```bash
   flutter run
   ```

## Design Features

- **Clean UI**: Modern Material Design with consistent colors
- **Responsive**: Grid layout adapts to different screen sizes
- **User-friendly**: Clear navigation and intuitive interactions
- **Error handling**: Graceful error states with retry options
- **Loading states**: Visual feedback during operations

## Color Scheme

- **Primary Green**: #4CAF50
- **Primary Blue**: #2196F3
- **Background**: #F5F5F5
- **Text**: #333333
- **Accent Red**: #F44336