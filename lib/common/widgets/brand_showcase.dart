import 'package:flutter/material.dart';

import '../../utils/constants/colors.dart';
import '../../utils/constants/sizes.dart';
import '../../utils/helpers/helper_functions.dart';
import 'brand_card.dart';
import 'circular_container.dart';

class BrandShowcase extends StatelessWidget {
  const BrandShowcase({
    super.key,
    required this.brandName,
    required this.brandLogo,
    required this.productCount,
    this.images = const [],
  });

  final String brandName;
  final String brandLogo;
  final String productCount;
  final List<String> images;

  @override
  Widget build(BuildContext context) {
    final bool isDark = RHelperFunctions.isDarkMode(context);

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(RSizes.cardRadiusMd),
        color: isDark ? RColors.onSecondaryDark : RColors.onSecondaryLight,
      ),
      margin: const EdgeInsets.only(bottom: RSizes.spaceBtwItems),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// --- Brand header ---
          BrandCard(
            brandName: brandName,
            productCount: productCount,
            brandLogo: brandLogo,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(RSizes.cardRadiusMd),
              topRight: Radius.circular(RSizes.cardRadiusMd),
            ),
            backgroundColor: isDark ? RColors.secondaryDark : RColors.secondaryLight,
            borderColor: isDark ? RColors.onSecondaryDark : RColors.onSecondaryLight,
          ),

          /// --- Product image row ---
          Padding(
            padding: const EdgeInsets.all(RSizes.sm),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: images.map((image) {
                return Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: RSizes.sm),
                    child: RoundedContainer(
                      height: 120,
                      radius: RSizes.cardRadiusMd,
                      backgroundColor: isDark ? RColors.backgroundDark : RColors.backgroundLight,
                      padding: EdgeInsets.zero,
                      margin: EdgeInsets.zero,
                      child: ClipRRect(
                        borderRadius:
                        BorderRadius.circular(RSizes.cardRadiusMd),
                        child: Image.asset(
                          image,
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                  ),
                );
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }
}
