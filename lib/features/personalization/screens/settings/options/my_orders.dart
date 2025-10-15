import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/helpers/helper_functions.dart';

class MyOrdersScreen extends StatelessWidget {
  const MyOrdersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = RHelperFunctions.isDarkMode(context);

    return Scaffold(
      appBar: AppBar(title: const Text('My Orders')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(RSizes.defaultSpace),
        child: Column(
          children: [
            _buildOrder(context, isDark, '#ORD-2024-001', 'In Progress', RColors.info, 'Jan 15, 2024', 3, '\$125.99'),
            _buildOrder(context, isDark, '#ORD-2024-002', 'Completed', RColors.success, 'Jan 10, 2024', 2, '\$89.50'),
            _buildOrder(context, isDark, '#ORD-2024-003', 'Completed', RColors.success, 'Jan 5, 2024', 1, '\$45.00'),
          ],
        ),
      ),
    );
  }

  Widget _buildOrder(BuildContext context, bool isDark, String id, String status, Color statusColor, String date, int items, String total) {
    return Container(
      margin: const EdgeInsets.only(bottom: RSizes.spaceBtwItems),
      padding: const EdgeInsets.all(RSizes.lg),
      decoration: BoxDecoration(
        color: isDark ? RColors.cardDark : RColors.cardLight,
        borderRadius: BorderRadius.circular(RSizes.cardRadiusMd),
        border: Border.all(color: isDark ? RColors.borderDark : RColors.borderLight),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(id, style: Theme.of(context).textTheme.titleMedium),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: RSizes.md, vertical: RSizes.xs),
                decoration: BoxDecoration(
                  color: statusColor.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(RSizes.radiusSmall),
                ),
                child: Text(status, style: Theme.of(context).textTheme.bodySmall?.copyWith(color: statusColor)),
              ),
            ],
          ),
          const SizedBox(height: RSizes.sm),
          Row(
            children: [
              Icon(Iconsax.calendar, size: 16, color: isDark ? RColors.onMutedDark : RColors.onMutedLight),
              const SizedBox(width: RSizes.xs),
              Text(date, style: Theme.of(context).textTheme.bodySmall?.copyWith(
                color: isDark ? RColors.onMutedDark : RColors.onMutedLight)),
              const SizedBox(width: RSizes.lg),
              Icon(Iconsax.box, size: 16, color: isDark ? RColors.onMutedDark : RColors.onMutedLight),
              const SizedBox(width: RSizes.xs),
              Text('$items items', style: Theme.of(context).textTheme.bodySmall?.copyWith(
                color: isDark ? RColors.onMutedDark : RColors.onMutedLight)),
            ],
          ),
          const SizedBox(height: RSizes.md),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Total: $total', style: Theme.of(context).textTheme.titleMedium?.copyWith(color: RColors.primaryLight)),
              Icon(Iconsax.arrow_right_3, color: isDark ? RColors.onMutedDark : RColors.onMutedLight),
            ],
          ),
        ],
      ),
    );
  }
}
