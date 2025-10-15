import 'package:flutter/material.dart';

import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/helpers/helper_functions.dart';

class ProductAttributes extends StatelessWidget {
  const ProductAttributes({
    super.key,
    required this.colors,
    required this.sizes,
    required this.selectedColorIndex,
    required this.selectedSizeIndex,
    required this.onColorTap,
    required this.onSizeTap,
  });

  final List<Color> colors;
  final List<String> sizes;
  final int selectedColorIndex;
  final int selectedSizeIndex;
  final Function(int) onColorTap;
  final Function(int) onSizeTap;

  @override
  Widget build(BuildContext context) {
    final isDark = RHelperFunctions.isDarkMode(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Variation:', style: Theme.of(context).textTheme.titleMedium),
                  const SizedBox(height: 4),
                  Row(
                    children: [
                      Text('Price: ', style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: isDark ? RColors.onMutedDark : RColors.onMutedLight)),
                      Text('\$334.0', style: Theme.of(context).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold)),
                    ],
                  ),
                  Row(
                    children: [
                      Text('Stock: ', style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: isDark ? RColors.onMutedDark : RColors.onMutedLight)),
                      Text('Out of Stock', style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: RColors.error)),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
        const SizedBox(height: RSizes.spaceBtwItems),

        Text('Colors', style: Theme.of(context).textTheme.titleMedium),
        const SizedBox(height: RSizes.sm),
        Row(
          children: List.generate(
            colors.length,
            (index) => GestureDetector(
              onTap: () => onColorTap(index),
              child: Container(
                width: 40,
                height: 40,
                margin: const EdgeInsets.only(right: RSizes.sm),
                decoration: BoxDecoration(
                  color: colors[index],
                  shape: BoxShape.circle,
                  border: Border.all(color: selectedColorIndex == index ? RColors.primaryLight : Colors.transparent, width: 3),
                ),
                child: selectedColorIndex == index ? const Icon(Icons.check, color: Colors.white, size: 20) : null,
              ),
            ),
          ),
        ),
        const SizedBox(height: RSizes.spaceBtwItems),
        Text('Size', style: Theme.of(context).textTheme.titleMedium),
        const SizedBox(height: RSizes.sm),
        Row(
          children: List.generate(
            sizes.length,
            (index) => GestureDetector(
              onTap: () => onSizeTap(index),
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: RSizes.lg, vertical: RSizes.sm),
                margin: const EdgeInsets.only(right: RSizes.sm),
                decoration: BoxDecoration(
                  color: selectedSizeIndex == index ? RColors.primaryLight : (isDark ? RColors.cardDark : RColors.cardLight),
                  borderRadius: BorderRadius.circular(RSizes.radiusSmall),
                  border: Border.all(color: isDark ? RColors.borderDark : RColors.borderLight),
                ),
                child: Text(sizes[index], style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: selectedSizeIndex == index ? Colors.white : null)),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
