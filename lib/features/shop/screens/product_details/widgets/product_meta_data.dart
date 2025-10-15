import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/helpers/helper_functions.dart';

class ProductMetaData extends StatelessWidget {
  const ProductMetaData({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = RHelperFunctions.isDarkMode(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: RSizes.sm, vertical: 4),
              decoration: BoxDecoration(
                color: RColors.warning.withValues(alpha: 0.2),
                borderRadius: BorderRadius.circular(RSizes.radiusMicro),
              ),
              child: Text('20%', style: Theme.of(context).textTheme.labelMedium?.copyWith(color: RColors.warning)),
            ),
            const SizedBox(width: RSizes.sm),
            Text('\$122.6 - \$334.0', style: Theme.of(context).textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.bold)),
            const Spacer(),
            IconButton(onPressed: () {}, icon: Icon(Icons.share, color: isDark ? RColors.onMutedDark : RColors.onMutedLight)),
          ],
        ),
        const SizedBox(height: RSizes.xs),
        Text('Green Nike sports shoe', style: Theme.of(context).textTheme.titleLarge),
        const SizedBox(height: RSizes.xs),
        Row(
          children: [
            const Icon(Iconsax.star5, color: RColors.warning, size: 16),
            const SizedBox(width: 4),
            Text('5.0 (199)', style: Theme.of(context).textTheme.bodyMedium),
            const SizedBox(width: RSizes.sm),
            Text('Nike', style: Theme.of(context).textTheme.bodyMedium),
            const SizedBox(width: 4),
            const Icon(Iconsax.verify5, color: RColors.primaryLight, size: 16),
          ],
        ),
      ],
    );
  }
}
