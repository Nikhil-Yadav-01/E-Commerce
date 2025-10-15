import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../utils/constants/colors.dart';
import '../../utils/constants/sizes.dart';
import '../../utils/helpers/helper_functions.dart';

class RActionCard extends StatelessWidget {
  const RActionCard({super.key, required this.icon, required this.title, required this.subtitle, this.onTap, this.isDestructive = false,});

  final IconData icon;
  final String title;
  final String subtitle;
  final VoidCallback? onTap;
  final bool isDestructive;

  @override
  Widget build(BuildContext context) {
    final bool isDark = RHelperFunctions.isDarkMode(context);

    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(bottom: RSizes.spaceBtwItems),
        padding: const EdgeInsets.all(RSizes.spaceBtwItems),
        decoration: BoxDecoration(
          color: isDark ? RColors.cardDark : RColors.cardLight,
          borderRadius: BorderRadius.circular(RSizes.cardRadiusMd),
          border: Border.all(
            color: isDestructive ? RColors.error : (isDark ? RColors.borderDark : RColors.borderLight),
          ),
        ),
        child: Row(
          children: [
            Icon(icon, color: RColors.primaryLight, size: 24),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title, style: Theme.of(context).textTheme.titleMedium),
                  Text(
                    subtitle,
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: isDark ? RColors.onMutedDark : RColors.onMutedLight,
                    ),
                  ),
                ],
              ),
            ),
            Icon(
              Iconsax.arrow_right_3,
              color: isDark ? RColors.onMutedDark : RColors.onMutedLight,
              size: 16,
            ),
          ],
        ),
      ),
    );
  }
}

