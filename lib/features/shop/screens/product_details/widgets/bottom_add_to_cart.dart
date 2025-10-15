import 'package:e_commerce/common/widgets/rounded_icon.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/helpers/helper_functions.dart';

class BottomAddToCart extends StatelessWidget {
  const BottomAddToCart({
    super.key,
    required this.quantity,
    required this.onIncrement,
    required this.onDecrement,
  });

  final int quantity;
  final VoidCallback onIncrement;
  final VoidCallback onDecrement;

  @override
  Widget build(BuildContext context) {
    final isDark = RHelperFunctions.isDarkMode(context);

    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: RSizes.defaultSpace,
        vertical: RSizes.sm,
      ),
      decoration: BoxDecoration(
        color: isDark ? RColors.cardDark : RColors.cardLight,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(RSizes.cardRadiusLg),
          bottomRight: Radius.circular(RSizes.cardRadiusLg),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.1),
            blurRadius: 10,
            offset: const Offset(0, -2),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              RRoundedIcon(
                icon: Iconsax.minus,
                backgroundColor: isDark
                    ? RColors.surfaceDark
                    : RColors.surfaceLight,
                onPressed: onDecrement,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: RSizes.lg),
                child: Text(
                  '$quantity',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
              ),
              RRoundedIcon(
                icon: Iconsax.add,
                backgroundColor: Colors.black,
                onPressed: onIncrement,
              ),
            ],
          ),

          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.all(RSizes.md),
              backgroundColor: isDark
                  ? RColors.tertiaryDark
                  : RColors.tertiaryLight,
              side: BorderSide(
                color: isDark
                    ? RColors.borderDark
                    : RColors.borderLight,
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(RSizes.sm),
              child: Row(
                children: [const Icon(Iconsax.bag_2), const Text('Add to Bag')],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
