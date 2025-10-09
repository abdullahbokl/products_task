import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../core/common/widgets/app_loader.dart';
import '../../core/utils/app_strings.dart';
import '../../core/widgets/error_widget.dart';
import '../cubit/product_cubit.dart';
import 'empty_products_widget.dart';
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
        return state.status.when(
          success: (products) {
            final list = products ?? [];
            if (list.isEmpty) return const EmptyProductsWidget();
            return ProductListContent(
              products: list,
              isHorizontal: _isHorizontal,
              onToggle: _toggleLayout,
            );
          },
          failure: (error, data) => AppErrorWidget(
            message: error ?? AppStrings.errorFallback,
            onRetry: () => context.read<ProductCubit>().loadProducts(),
          ),
          loading: () => const AppLoader(),
          empty: () => const EmptyProductsWidget(),
        );
      },
    );
  }
}

