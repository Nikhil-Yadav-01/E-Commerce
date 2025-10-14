import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../utils/constants/colors.dart';
import '../../utils/constants/sizes.dart';
import '../../utils/helpers/helper_functions.dart';

class BrandCard extends StatelessWidget {
  const BrandCard({
    super.key,
    required this.brandName,
    required this.productCount,
    required this.brandLogo,
    this.borderRadius = const BorderRadius.all(Radius.circular(RSizes.cardRadiusMd)),
    this.onTap, this.borderColor, this.backgroundColor,
  });

  final String brandName;
  final String productCount;
  final String brandLogo;
  final BorderRadius borderRadius;
  final Color? borderColor;
  final Color? backgroundColor;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final isDark = RHelperFunctions.isDarkMode(context);
    
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(RSizes.md),
        decoration: BoxDecoration(
          color: backgroundColor ?? (isDark ? RColors.cardDark : RColors.cardLight),
          borderRadius: borderRadius,
          border: Border.all(color: borderColor ?? (isDark ? RColors.dividerDark : RColors.dividerLight)),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  width: 40,
                  height: 40,
                  padding: EdgeInsets.all(RSizes.sm),
                  decoration: BoxDecoration(
                    color: isDark ? RColors.surfaceDark : RColors.surfaceLight,
                    borderRadius: BorderRadius.circular(RSizes.radiusSmall),
                  ),
                  child: Image.asset(
                    brandLogo,
                    width: 24,
                    height: 24,
                  ),
                ),
                const SizedBox(width: RSizes.sm),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(
                            brandName,
                            style: Theme.of(context).textTheme.titleMedium,
                          ),
                          const SizedBox(width: RSizes.xs),
                          const Icon(
                            Iconsax.verify5,
                            color: RColors.primaryLight,
                            size: 16,
                          ),
                        ],
                      ),
                      Text(
                        '$productCount Products',
                        style: Theme.of(context).textTheme.bodySmall?.apply(
                          color: isDark ? RColors.onMutedDark : RColors.onMutedLight,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}