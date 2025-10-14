import 'package:e_commerce/common/widgets/grid_layout_widget.dart';
import 'package:e_commerce/common/widgets/product_card_vertical.dart';
import 'package:e_commerce/common/widgets/rounded_icon.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../common/widgets/cart_menu_icon.dart';
import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../../utils/helpers/helper_functions.dart';

class WishlistScreen extends StatelessWidget {
  const WishlistScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = RHelperFunctions.isDarkMode(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Wishlist',
          style: Theme.of(context).textTheme.headlineSmall?.copyWith(
            color: isDark ? RColors.onPrimaryDark : RColors.onPrimaryLight,
          ),
        ),
        actions: [
          RRoundedIcon(
            icon: Iconsax.add,
            onPressed: () {},
            backgroundColor: Colors.transparent,
          )
        ],
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(RSizes.defaultSpace),
          child: Column(
            children: [
              GridLayoutWidget(
                itemCount: 4,
                itemBuilder: (context, index) => const ProductCardVertical(),
              ),            ],
          ),
        ),
      ),
    );
  }
}