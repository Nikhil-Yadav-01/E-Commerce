import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../common/widgets/app_bar.dart';
import '../../../../../common/widgets/curved_edges_widget.dart';
import '../../../../../common/widgets/rounded_image.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/helpers/helper_functions.dart';

class ProductImageSlider extends StatefulWidget {
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
  State<ProductImageSlider> createState() => _ProductImageSliderState();
}

class _ProductImageSliderState extends State<ProductImageSlider>
    with SingleTickerProviderStateMixin {
  late AnimationController _heartController;
  late Animation<double> _heartAnimation;
  bool _isFavorite = false;

  @override
  void initState() {
    super.initState();
    _heartController = AnimationController(
      duration: const Duration(milliseconds: 150),
      vsync: this,
    );
    _heartAnimation = Tween<double>(begin: 1.0, end: 1.15).animate(
      CurvedAnimation(parent: _heartController, curve: Curves.easeOut),
    );
  }

  @override
  void dispose() {
    _heartController.dispose();
    super.dispose();
  }

  void _toggleFavorite() {
    setState(() => _isFavorite = !_isFavorite);
    _heartController.forward().then((_) => _heartController.reverse());
  }

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
                  imageUrl: widget.images[widget.selectedIndex],
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
                    itemCount: widget.images.length,
                    separatorBuilder: (_, __) => const SizedBox(width: RSizes.spaceBtwItems),
                    itemBuilder: (context, index) => GestureDetector(
                      onTap: () => widget.onImageTap(index),
                      child: Container(
                        width: 80,
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: widget.selectedIndex == index ? RColors.primaryLight : (isDark ? RColors.borderDark : RColors.borderLight),
                            width: 2,
                          ),
                          borderRadius: BorderRadius.circular(RSizes.cardRadiusMd),
                        ),
                        child: RoundedImage(imageUrl: widget.images[index], fit: BoxFit.cover),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            RAppBar(
              showBackArrow: true,
              actions: [
                ScaleTransition(
                  scale: _heartAnimation,
                  child: IconButton(
                    onPressed: _toggleFavorite,
                    icon: Icon(
                      _isFavorite ? Iconsax.heart5 : Iconsax.heart,
                      color: _isFavorite ? Colors.red : (isDark ? Colors.white : Colors.black),
                      size: 20,
                    ),
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
