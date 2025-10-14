import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import 'package:e_commerce/common/widgets/rounded_icon.dart';
import 'package:e_commerce/common/widgets/rounded_image.dart';
import 'package:e_commerce/utils/constants/colors.dart';
import 'package:e_commerce/utils/constants/images.dart';
import 'package:e_commerce/utils/constants/sizes.dart';
import 'package:e_commerce/utils/helpers/helper_functions.dart';
import '../styles/shadow_style.dart';
import 'circular_container.dart';

class ProductCardVertical extends StatelessWidget {
  const ProductCardVertical({super.key, this.onPressed});

  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    final bool isDark = RHelperFunctions.isDarkMode(context);
    final Color cardColor =
    isDark ? RColors.cardDark : Theme.of(context).cardColor;

    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: RSizes.productCardHeight,
        // margin: const EdgeInsets.symmetric(vertical: 6, horizontal: 4),
        padding: const EdgeInsets.all(RSizes.xs),
        decoration: BoxDecoration(
          color: cardColor,
          borderRadius: BorderRadius.circular(RSizes.radiusMedium),
          boxShadow: RShadowStyle.verticalProductShadow(),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// ---------- Product Image Section ----------
            Stack(
              clipBehavior: Clip.none,
              children: [
                /// Image background
                RThumbnailImage(isDark: isDark),

                /// Sale Tag (top-left)
                const Positioned(
                  top: 10,
                  left: 10,
                  child: OffSaleTag(text: '20% OFF'),
                ),

                /// Favorite Icon (top-right)
                Positioned(
                  top: 10,
                  right: 10,
                  child: RRoundedIcon(
                    icon: Iconsax.heart5,
                    color: Colors.redAccent,
                    backgroundColor: Colors.white,
                    size: 18,
                    shadow: true,
                    onPressed: () {},
                  ),
                ),
              ],
            ),

            const SizedBox(height: RSizes.spaceBtwItems),

            /// ---------- Product Details ----------
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: RSizes.spaceBtwItems / 4,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  /// Title
                  const RProductTitleText(
                    title: 'Green Nike Air Shoes',
                    smallSize: true,
                  ),

                  const SizedBox(height: RSizes.xs),

                  /// Brand + Verified icon
                  Row(
                    children: [
                      Text(
                        'Nike',
                        style: Theme.of(context).textTheme.labelMedium!.copyWith(
                          color: isDark
                              ? RColors.onBackgroundDark
                              : RColors.onBackgroundLight,
                        ),
                      ),
                      const SizedBox(width: 4),
                      const Icon(
                        Iconsax.verify5,
                        color: RColors.primaryLight,
                        size: RSizes.iconSizeS,
                      ),
                    ],
                  ),

                  const SizedBox(height: RSizes.spaceBtwItems),

                  /// Price & Add button
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '\$250.00',
                        style:
                        Theme.of(context).textTheme.headlineSmall!.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Container(
                        width: 30,
                        height: 30,
                        decoration: BoxDecoration(
                          color: isDark
                              ? RColors.primaryDark
                              : RColors.primaryLight,
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(RSizes.cardRadiusMd),
                            bottomRight: Radius.circular(RSizes.cardRadiusMd),
                          ),
                        ),
                        child: const Icon(
                          Iconsax.add,
                          color: Colors.white,
                          size: 24,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/// ---------- Sale Tag ----------
class OffSaleTag extends StatelessWidget {
  const OffSaleTag({
    super.key,
    required this.text,
  });

  final String text;

  @override
  Widget build(BuildContext context) {
    final bool isDark = RHelperFunctions.isDarkMode(context);

    return RoundedContainer(
      height: 26,
      radius: RSizes.radiusSmall,
      backgroundColor:
      isDark ? RColors.secondaryDark : RColors.secondaryLight,
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      child: Center(
        child: Text(
          text,
          style: Theme.of(context).textTheme.labelSmall!.copyWith(
            color: isDark
                ? RColors.onSecondaryDark
                : RColors.onSecondaryLight,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}

/// ---------- Product Image ----------
class RThumbnailImage extends StatelessWidget {
  const RThumbnailImage({
    super.key,
    required this.isDark,
  });

  final bool isDark;

  @override
  Widget build(BuildContext context) {
    return RoundedContainer(
      height: 170, // Increased height for better balance
      width: double.infinity,
      radius: RSizes.cardRadiusMd,
      backgroundColor: isDark ? RColors.surfaceDark : RColors.surfaceLight,
      padding: EdgeInsets.zero,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(RSizes.cardRadiusMd),
        child: RoundedImage(
          imageUrl: RImages.productImage1,
          fit: BoxFit.cover,
          width: double.infinity,
          height: 170,
        ),
      ),
    );
  }
}

/// ---------- Product Title ----------
class RProductTitleText extends StatelessWidget {
  const RProductTitleText({
    super.key,
    required this.title,
    this.smallSize = false,
    this.maxLines = 2,
    this.textAlign = TextAlign.left,
  });

  final String title;
  final bool smallSize;
  final int maxLines;
  final TextAlign? textAlign;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      maxLines: maxLines,
      overflow: TextOverflow.ellipsis,
      textAlign: textAlign,
      style: smallSize
          ? Theme.of(context)
          .textTheme
          .labelLarge!
          .copyWith(fontWeight: FontWeight.w600)
          : Theme.of(context)
          .textTheme
          .titleSmall!
          .copyWith(fontWeight: FontWeight.bold),
    );
  }
}
