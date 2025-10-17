import 'package:e_commerce/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../utils/constants/colors.dart';
import '../../utils/constants/sizes.dart';

class RCartCounterIcon extends StatelessWidget {
  const RCartCounterIcon({super.key, this.onPressed});
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    final bool isDark = RHelperFunctions.isDarkMode(context);

    return Stack(
      children: [
        IconButton(
          onPressed: () {},
          icon: Icon(
            Iconsax.notification,
            color: isDark ? RColors.onPrimaryDark : RColors.onPrimaryLight,
            size: RSizes.iconSizeS,
          ),
        ),
        Positioned(
          right: 0,
          child: Container(
            width: RSizes.spaceBtwItems,
            height: RSizes.spaceBtwItems,
            decoration: BoxDecoration(
              color: Color(0xFF000000),
              borderRadius: BorderRadius.circular(100),
            ),
            child: Center(
              child: Text(
                '3',
                style: Theme.of(context).textTheme.labelLarge?.apply(
                  color: RColors.white,
                  fontSizeFactor: 0.8,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
