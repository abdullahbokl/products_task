import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/common/widgets/app_text.dart';
import '../../../../../core/common/widgets/custom_icon_button.dart';
import '../../../../../core/services/navigation/navigation_service.dart';
import '../../../../../core/services/service_locator/service_locator.dart';
import '../../../../../core/utils/app_dimensions.dart';
import '../../../../../core/utils/app_strings.dart';
import '../../../../../core/utils/colors.dart';
import '../../../../../core/utils/text_styles.dart';
import '../../cubit/product_cubit.dart';
import '../../pages/add_product_screen.dart';

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
          SizedBox(width: AppDimensions.iconSizeLarge),
          AppText(
            AppStrings.appBarProducts(context),
            style: AppTextStyles.heading2.copyWith(
              color: AppColors.titleColor,
            ),
          ),
          CustomIconButton(
            onPressed: () {
              getIt<NavigationService>().pushPage(
                BlocProvider.value(
                  value: context.read<ProductCubit>(),
                  child: const AddProductScreen(),
                ),
              );
            },
            icon: Icon(
              Icons.add,
              color: Colors.black,
              size: AppDimensions.iconSizeSmall,
            ),
            size: AppDimensions.iconSizeLarge,
            backgroundColor: AppColors.white,
            borderColor: AppColors.borderGray,
            borderWidth: AppDimensions.cardBorderWidth,
            borderRadius: AppDimensions.radiusLarge,
            padding: EdgeInsets.zero,
          ),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
