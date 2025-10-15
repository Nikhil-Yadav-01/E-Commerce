import 'package:e_commerce/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';

import '../../utils/constants/colors.dart';
import '../../utils/constants/sizes.dart';

class ActionSwitchCard extends StatelessWidget {
  const ActionSwitchCard({super.key, required this.icon, required this.title, required this.subtitle, required this.value, required this.onChanged});

  final IconData icon;
  final String title;
  final String subtitle;
  final bool value;
  final void Function(bool) onChanged;

  @override
  Widget build(BuildContext context) {
    final bool isDark = RHelperFunctions.isDarkMode(context);

    return Container(
      margin: const EdgeInsets.only(bottom: RSizes.spaceBtwItems),
      padding: const EdgeInsets.all(RSizes.lg),
      decoration: BoxDecoration(
        color: isDark ? RColors.cardDark : RColors.cardLight,
        borderRadius: BorderRadius.circular(RSizes.cardRadiusMd),
        border: Border.all(
          color: isDark ? RColors.borderDark : RColors.borderLight,
        ),
      ),
      child: Row(
        children: [
          Icon(icon, color: RColors.primaryLight, size: 24),
          const SizedBox(width: RSizes.lg),
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
          Switch(
            value: value,
            onChanged: onChanged,
            activeColor: RColors.primaryLight,
          ),
        ],
      ),
    );
  }
}
