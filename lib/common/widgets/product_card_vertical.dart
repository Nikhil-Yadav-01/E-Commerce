import 'package:e_commerce/common/widgets/circular_container.dart';
import 'package:e_commerce/common/widgets/rounded_icon.dart';
import 'package:e_commerce/common/widgets/rounded_image.dart';
import 'package:e_commerce/utils/constants/colors.dart';
import 'package:e_commerce/utils/constants/images.dart';
import 'package:e_commerce/utils/constants/sizes.dart';
import 'package:e_commerce/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../styles/shadow_style.dart';

class ProductCardVertical extends StatelessWidget {
  const ProductCardVertical({super.key, this.onPressed});

  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    bool isDark = RHelperFunctions.isDarkMode(context);

    return GestureDetector(
      onTap: onPressed,
      child: Container(
          width: 150,
          padding: const EdgeInsets.all(RSizes.md),
          decoration: BoxDecoration(
            boxShadow: RShadowStyle.verticalProductShadow(),
            borderRadius: BorderRadius.circular(RSizes.radiusMedium),
            color: Theme.of(context).cardColor,
          ),
          child: Column(
            children: [
              RoundedContainer(
                height: 100,
                width: 100,
                backgroundColor: isDark ? Colors.grey.shade400 : Colors.grey.shade200,
                child: Stack(
                  children: [
                    // Thumbnail
                    Center(
                      child: RoundedImage(
                        imageUrl: RImages.productImage1,
                        width: 80,
                        height: 80,
                        fit: BoxFit.contain,
                      ),
                    ),

                    // Sale Tag
                    Positioned(
                      top: 12,
                      child: RoundedContainer(
                        radius: RSizes.radiusSmall,
                        backgroundColor: isDark ? RColors.secondaryDark : RColors.secondaryLight,
                        padding: RSizes.sm,
                        child: Text(
                          '25%',
                          style: Theme.of(context).textTheme.labelLarge!.apply(
                            color: isDark ? RColors.onSecondaryDark : RColors.onSecondaryLight
                          ),
                        ),
                      ),
                    ),

                    // Favourite Icon
                    Positioned(
                      top: 0,
                      right: 0,
                      child: RRoundedIcon(
                        icon: Iconsax.heart5,
                        color: Colors.red,
                      )
                    )
                  ],
                ),
              ),
              const SizedBox(height: RSizes.spaceBtwItems),

              // Details
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: RSizes.sm),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    RProductTitleText(
                      title: 'Green Nike Air Shoes',
                      smallSize: true,
                    ),
                    const SizedBox(height: RSizes.spaceBtwItems / 2),

                    Row(
                      children: [
                        Text(
                          'Nike',
                          style: Theme.of(context).textTheme.labelMedium,
                        ),
                        const SizedBox(
                          width: RSizes.spaceBtwItems / 2,
                        ),
                        const Icon(
                          Iconsax.verify5,
                          color: RColors.primaryLight,
                          size: RSizes.iconSizeS,
                        )
                      ],
                    ),

                    const SizedBox(height: RSizes.spaceBtwItems),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          '\$250.00',
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: Theme.of(context).textTheme.headlineMedium,
                        ),
                        const SizedBox(width: RSizes.spaceBtwItems / 2),

                        Container(
                          width: 32,
                          height: 32,
                          decoration: const BoxDecoration(
                            color: RColors.surfaceDark,
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(RSizes.cardRadiusMd),
                              bottomRight: Radius.circular(RSizes.cardRadiusMd),
                            )
                          ),
                          child: const Icon(
                            Iconsax.add,
                            color: RColors.white,
                            size: 20,
                          ),
                        )
                      ],
                    )
                  ],
                )
              )
            ],
          ),
      ),
    );
  }
}

class RProductTitleText extends StatelessWidget {
  const RProductTitleText({
    super.key, required this.title, this.smallSize = false, this.maxLines = 2, this.textAlign = TextAlign.left,
  });

  final String title;
  final bool smallSize;
  final int maxLines;
  final TextAlign? textAlign;

  @override
  Widget build(BuildContext context) {
    return
      Text(
        title,
        maxLines: maxLines,
        overflow: TextOverflow.ellipsis,
        style: smallSize ? Theme.of(context).textTheme.labelLarge : Theme.of(context).textTheme.titleSmall,
        textAlign: textAlign
      );
  }
}

