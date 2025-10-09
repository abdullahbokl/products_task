import 'dart:async';

import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:products_task/core/services/service_locator/service_locator.config.dart' show $initGetIt;

// use package imports for project files
import 'package:products_task/data/datasources/local_product_datasource.dart';
import 'package:products_task/data/repositories/product_repository_impl.dart';
import 'package:products_task/domain/repositories/product_repository.dart';
import 'package:products_task/domain/usecases/get_products.dart';
import 'package:products_task/domain/usecases/delete_product.dart';
import 'package:products_task/presentation/cubit/product_cubit.dart';

final GetIt getIt = GetIt.I;

@InjectableInit(
  initializerName: r'$initGetIt',
  preferRelativeImports: true,
  asExtension: false,
)
Future<GetIt> configureDependencies() async {
  // call generated registrations (if any)
  $initGetIt(getIt);

  // Manual registrations (guarded to avoid duplicate registration when codegen is used)
  if (!getIt.isRegistered<LocalProductDataSource>()) {
    getIt.registerLazySingleton<LocalProductDataSource>(() => LocalProductDataSourceImpl());
  }

  if (!getIt.isRegistered<ProductRepository>()) {
    getIt.registerLazySingleton<ProductRepository>(() => ProductRepositoryImpl(getIt<LocalProductDataSource>()));
  }

  if (!getIt.isRegistered<GetProducts>()) {
    getIt.registerLazySingleton<GetProducts>(() => GetProducts(getIt<ProductRepository>()));
  }

  if (!getIt.isRegistered<DeleteProduct>()) {
    getIt.registerLazySingleton<DeleteProduct>(() => DeleteProduct(getIt<ProductRepository>()));
  }

  // Register ProductCubit as a factory so every BlocProvider gets a fresh instance
  if (!getIt.isRegistered<ProductCubit>()) {
    getIt.registerFactory<ProductCubit>(() => ProductCubit(
          getProducts: getIt<GetProducts>(),
          deleteProduct: getIt<DeleteProduct>(),
        ));
  }

  return getIt;
}

@module
abstract class AppModule {}
