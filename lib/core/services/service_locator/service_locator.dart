import 'dart:async';

import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:products_task/core/services/service_locator/service_locator.config.dart'
    show $initGetIt;

import 'package:products_task/core/services/navigation/navigation_service.dart';
import 'package:products_task/features/products/data/datasources/local_product_datasource.dart';
import 'package:products_task/features/products/data/repositories/product_repository_impl.dart';
import 'package:products_task/features/products/domain/repositories/product_repository.dart';
import 'package:products_task/features/products/domain/usecases/get_products.dart';
import 'package:products_task/features/products/domain/usecases/add_product.dart';
import 'package:products_task/features/products/domain/usecases/delete_product.dart';
import 'package:products_task/features/products/presentation/cubit/product_cubit.dart';

final GetIt getIt = GetIt.I;

@InjectableInit(
  initializerName: r'$initGetIt',
  preferRelativeImports: true,
  asExtension: false,
)
Future<GetIt> configureDependencies() async {
  // call generated registrations (if any)
  $initGetIt(getIt);

  // Register NavigationService as a singleton
  if (!getIt.isRegistered<NavigationService>()) {
    getIt.registerLazySingleton<NavigationService>(() => NavigationService());
  }

  // Manual registrations (guarded to avoid duplicate registration when codegen is used)
  if (!getIt.isRegistered<LocalProductDataSource>()) {
    getIt.registerLazySingleton<LocalProductDataSource>(
      () => LocalProductDataSourceImpl(),
    );
  }

  if (!getIt.isRegistered<ProductRepository>()) {
    getIt.registerLazySingleton<ProductRepository>(
      () => ProductRepositoryImpl(getIt<LocalProductDataSource>()),
    );
  }

  if (!getIt.isRegistered<GetProducts>()) {
    getIt.registerLazySingleton<GetProducts>(
      () => GetProducts(getIt<ProductRepository>()),
    );
  }

  if (!getIt.isRegistered<AddProduct>()) {
    getIt.registerLazySingleton<AddProduct>(
      () => AddProduct(getIt<ProductRepository>()),
    );
  }

  if (!getIt.isRegistered<DeleteProduct>()) {
    getIt.registerLazySingleton<DeleteProduct>(
      () => DeleteProduct(getIt<ProductRepository>()),
    );
  }

  // Register ProductCubit as a factory so every BlocProvider gets a fresh instance
  if (!getIt.isRegistered<ProductCubit>()) {
    getIt.registerFactory<ProductCubit>(
      () => ProductCubit(
        getProducts: getIt<GetProducts>(),
        addProduct: getIt<AddProduct>(),
        deleteProduct: getIt<DeleteProduct>(),
      ),
    );
  }

  return getIt;
}
