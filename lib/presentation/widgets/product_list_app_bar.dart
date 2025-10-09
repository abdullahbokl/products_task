import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../core/constants/app_dimensions.dart';
import '../../core/utils/colors.dart';
import '../../core/utils/app_strings.dart';
import '../../core/widgets/app_text.dart';
import '../../core/widgets/custom_icon_button.dart';
import '../cubit/product_cubit.dart';

class ProductListAppBar extends StatelessWidget implements PreferredSizeWidget {
  const ProductListAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppColors.white,
      elevation: 0,
      automaticallyImplyLeading: false,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const SizedBox(width: AppDimensions.iconSizeLarge),
          AppText(
            AppStrings.appBarProducts(context),
            style: const TextStyle(
              fontFamily: 'Montserrat',
              fontSize: AppDimensions.spacingXLarge,
              fontWeight: FontWeight.bold,
              color: Color(0xFF3E3E68),
            ),
          ),
          CustomIconButton.appBarAdd(
            onPressed: () {
              context.read<ProductCubit>().addNewProduct();
            },
          ),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
