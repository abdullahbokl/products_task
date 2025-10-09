import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/services/service_locator/service_locator.dart';
import '../../../../core/utils/colors.dart';
import '../../../../core/utils/responsive.dart';
import '../cubit/product_cubit.dart';
import '../widgets/app_bar/product_list_app_bar.dart';
import '../widgets/product/product_list_body.dart';

class ProductListScreen extends StatelessWidget {
  const ProductListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Responsive.init(context);

    return BlocProvider(
      create: (context) => getIt<ProductCubit>()..loadProducts(),
      child: const Scaffold(
        backgroundColor: AppColors.white,
        appBar: ProductListAppBar(),
        body: ProductListBody(),
      ),
    );
  }
}
