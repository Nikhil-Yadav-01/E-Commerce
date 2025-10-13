import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../utils/constants/colors.dart';
import '../../utils/constants/sizes.dart';
import '../../utils/device/device_utility.dart';
import '../../utils/helpers/helper_functions.dart';

class SearchContainer extends StatelessWidget {
  const SearchContainer({
    super.key,
    required this.text,
    this.icon = Iconsax.search_normal,
    this.showBackground = true,
    this.showBorder = true,
  });

  final String text;
  final IconData? icon;
  final bool showBackground, showBorder;

  @override
  Widget build(BuildContext context) {
    bool isDark = RHelperFunctions.isDarkMode(context);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: RSizes.defaultSpace),
      child: Container(
        width: RDeviceUtility.getScreenWidth(context),
        padding: EdgeInsets.all(RSizes.md),
        decoration: BoxDecoration(
          color: showBackground
              ? RColors.white.withValues(alpha: 0.1)
              : Colors.transparent,
          border: showBorder
              ? Border.all(
            color: isDark
                ? RColors.borderNeutralDark
                : RColors.borderNeutralLight,
            width: 0.5,
          )
              : null,
          borderRadius: BorderRadius.circular(RSizes.cardRadiusLg),
        ),
        child: Row(
          children: [
            Icon(
              icon,
              color: RColors.white,
            ),
            const SizedBox(width: RSizes.spaceBtwItems),
            Text(
              text,
              style: Theme.of(context).textTheme.bodySmall?.apply(
                color: RColors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}