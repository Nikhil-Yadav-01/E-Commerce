import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/helpers/helper_functions.dart';

class MyCouponsScreen extends StatelessWidget {
  const MyCouponsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = RHelperFunctions.isDarkMode(context);

    return Scaffold(
      appBar: AppBar(title: const Text('My Coupons')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(RSizes.defaultSpace),
        child: Column(
          children: [
            _buildCoupon(context, isDark, 'SAVE20', '20% Off', 'On orders above \$50', 'Valid until Jan 31, 2024', true),
            _buildCoupon(context, isDark, 'FREESHIP', 'Free Shipping', 'On all orders', 'Valid until Feb 15, 2024', true),
            _buildCoupon(context, isDark, 'WELCOME10', '10% Off', 'First order discount', 'Expired', false),
          ],
        ),
      ),
    );
  }

  Widget _buildCoupon(BuildContext context, bool isDark, String code, String title, String subtitle, String validity, bool isActive) {
    return Container(
      margin: const EdgeInsets.only(bottom: RSizes.spaceBtwItems),
      padding: const EdgeInsets.all(RSizes.lg),
      decoration: BoxDecoration(
        gradient: isActive ? RColors.primaryGradient : null,
        color: isActive ? null : (isDark ? RColors.cardDark : RColors.cardLight),
        borderRadius: BorderRadius.circular(RSizes.cardRadiusLg),
        border: isActive ? null : Border.all(color: isDark ? RColors.borderDark : RColors.borderLight),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(Iconsax.discount_shape, color: isActive ? Colors.white : RColors.primaryLight, size: 28),
              const SizedBox(width: RSizes.md),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(title, style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      color: isActive ? Colors.white : null, fontWeight: FontWeight.bold)),
                    Text(subtitle, style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: isActive ? Colors.white70 : (isDark ? RColors.onMutedDark : RColors.onMutedLight))),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: RSizes.md),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: RSizes.md, vertical: RSizes.sm),
            decoration: BoxDecoration(
              color: isActive ? Colors.white.withValues(alpha: 0.2) : (isDark ? RColors.surfaceDark : RColors.surfaceLight),
              borderRadius: BorderRadius.circular(RSizes.radiusSmall),
            ),
            child: Text(code, style: Theme.of(context).textTheme.titleMedium?.copyWith(
              color: isActive ? Colors.white : RColors.primaryLight, fontWeight: FontWeight.bold, letterSpacing: 2)),
          ),
          const SizedBox(height: RSizes.sm),
          Row(
            children: [
              Icon(Iconsax.calendar, size: 14, color: isActive ? Colors.white70 : (isDark ? RColors.onMutedDark : RColors.onMutedLight)),
              const SizedBox(width: RSizes.xs),
              Text(validity, style: Theme.of(context).textTheme.bodySmall?.copyWith(
                color: isActive ? Colors.white70 : (isDark ? RColors.onMutedDark : RColors.onMutedLight))),
            ],
          ),
        ],
      ),
    );
  }
}
