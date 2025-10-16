import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:e_commerce/utils/constants/colors.dart';

class BrandRow extends StatelessWidget {
  const BrandRow({super.key, required this.isDark, required this.isSmallScreen});

  final bool isDark;
  final bool isSmallScreen;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          'Nike',
          style: Theme.of(context).textTheme.labelSmall!.copyWith(
            color: isDark ? RColors.onBackgroundDark : RColors.onBackgroundLight,
            fontSize: isSmallScreen ? 10 : 11,
          ),
        ),
        const SizedBox(width: 3),
        Icon(
          Iconsax.verify5,
          color: RColors.primaryLight,
          size: isSmallScreen ? 10 : 12,
        ),
      ],
    );
  }
}