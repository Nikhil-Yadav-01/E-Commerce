import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../common/widgets/app_bar.dart';
import '../../../../../common/widgets/curved_edges_widget.dart';
import '../../../../../common/widgets/rounded_image.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/helpers/helper_functions.dart';

class ProductImageSlider extends StatelessWidget {
  const ProductImageSlider({
    super.key,
    required this.images,
    required this.selectedIndex,
    required this.onImageTap,
  });

  final List<String> images;
  final int selectedIndex;
  final Function(int) onImageTap;

  @override
  Widget build(BuildContext context) {
    final isDark = RHelperFunctions.isDarkMode(context);

    return RCurvedEdgesWidget(
      child: Container(
        color: isDark ? RColors.surfaceDark : RColors.surfaceLight,
        child: Stack(
          children: [
            SizedBox(
              height: 400,
              child: Center(
                child: RoundedImage(
                  imageUrl: images[selectedIndex],
                  fit: BoxFit.contain,
                  width: double.infinity,
                  height: 400,
                  borderRadius: 0,
                ),
              ),
            ),
            Positioned(
              bottom: RSizes.defaultSpace,
              left: 0,
              right: 0,
              child: Padding(
                padding: const EdgeInsets.all(RSizes.defaultSpace),
                child: SizedBox(
                  height: 80,
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    itemCount: images.length,
                    separatorBuilder: (_, __) => const SizedBox(width: RSizes.spaceBtwItems),
                    itemBuilder: (context, index) => GestureDetector(
                      onTap: () => onImageTap(index),
                      child: Container(
                        width: 80,
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: selectedIndex == index ? RColors.primaryLight : (isDark ? RColors.borderDark : RColors.borderLight),
                            width: 2,
                          ),
                          borderRadius: BorderRadius.circular(RSizes.cardRadiusMd),
                        ),
                        child: RoundedImage(imageUrl: images[index], fit: BoxFit.cover),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            RAppBar(
              showBackArrow: true,
              actions: [
                IconButton(onPressed: () {}, icon: const Icon(Iconsax.heart, color: Colors.red)),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
