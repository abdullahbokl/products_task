import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/common/widgets/app_loader.dart';
import '../../../../../core/utils/app_strings.dart';
import '../../../../../core/widgets/error_widget.dart';
import '../../cubit/product_cubit.dart';
import '../empty_states/empty_products_widget.dart';
import 'product_list_content.dart';

class ProductListBody extends StatefulWidget {
  const ProductListBody({super.key});

  @override
  State<ProductListBody> createState() => _ProductListBodyState();
}

class _ProductListBodyState extends State<ProductListBody> {
  bool _isHorizontal = false;

  void _toggleLayout() {
    setState(() {
      _isHorizontal = !_isHorizontal;
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductCubit, ProductState>(
      builder: (context, state) {
        return state.getProductsStatus.when(
          success: (products) {
            // Get filtered products based on selected category
            final filteredProducts = context.read<ProductCubit>().getFilteredProducts();

            // Always show ProductListContent (which includes categories)
            // Even if filteredProducts is empty, the content will handle the empty state
            return ProductListContent(
              products: filteredProducts,
              isHorizontal: _isHorizontal,
              onToggle: _toggleLayout,
            );
          },
          failure: (error, data) => AppErrorWidget(
            message: error ?? AppStrings.errorFallback(context),
            onRetry: () => context.read<ProductCubit>().loadProducts(),
          ),
          loading: () => const AppLoader(),
          empty: () => const EmptyProductsWidget(),
        );
      },
    );
  }
}
