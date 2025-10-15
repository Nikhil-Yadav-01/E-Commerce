import 'package:e_commerce/utils/constants/colors.dart';
import 'package:e_commerce/utils/constants/sizes.dart';
import 'package:e_commerce/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';


class SingleAddress extends StatelessWidget {
  const SingleAddress({
    super.key,
    this.selectedAddress = false,
    this.onTap,
  });

  final bool selectedAddress;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final bool isDark = RHelperFunctions.isDarkMode(context);
    final textTheme = Theme.of(context).textTheme;

    /// Color scheme awareness
    final Color baseBackground =
    isDark ? RColors.backgroundDark : RColors.backgroundLight;
    final Color activeColor =
    isDark ? RColors.primaryDark : RColors.primaryLight;
    final Color borderColor = selectedAddress
        ? (isDark ? RColors.primaryLight : RColors.primaryDark)
        : (isDark
        ? RColors.borderDark.withValues(alpha: 0.6)
        : RColors.borderLight.withValues(alpha: 0.6));

    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(RSizes.lg),
      splashColor: activeColor.withValues(alpha: 0.2),
      highlightColor: Colors.transparent,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        width: double.infinity,
        padding: const EdgeInsets.all(RSizes.md),
        margin: const EdgeInsets.only(bottom: RSizes.spaceBtwItems),
        decoration: BoxDecoration(
          color: selectedAddress
              ? activeColor.withValues(alpha: 0.12)
              : baseBackground,
          borderRadius: BorderRadius.circular(RSizes.lg),
          border: Border.all(color: borderColor, width: 1.4),
          boxShadow: [
            if (!selectedAddress)
              BoxShadow(
                color: (isDark
                    ? Colors.black
                    : Colors.grey)
                    .withValues(alpha: isDark ? 0.25 : 0.15),
                blurRadius: 6,
                offset: const Offset(0, 3),
              ),
          ],
        ),
        child: Stack(
          children: [
            /// Tick Icon (Top Right)
            Positioned(
              right: 6,
              top: 6,
              child: AnimatedSwitcher(
                duration: const Duration(milliseconds: 250),
                child: selectedAddress
                    ? Icon(
                  Iconsax.tick_circle5,
                  key: const ValueKey("selected"),
                  color: isDark
                      ? RColors.primaryLight
                      : RColors.primaryDark,
                  size: 22,
                )
                    : const SizedBox(key: ValueKey("unselected")),
              ),
            ),

            /// Address Information
            Padding(
              padding: const EdgeInsets.only(right: 28.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'John Doe',
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.w600,
                      color: isDark ? Colors.white : Colors.black,
                    ),
                  ),
                  const SizedBox(height: RSizes.spaceBtwItems / 3),
                  Text(
                    '(+92) 123 4567 890',
                    style: textTheme.bodyMedium?.copyWith(
                      color: isDark
                          ? Colors.grey[300]
                          : Colors.grey[700],
                    ),
                  ),
                  const SizedBox(height: RSizes.spaceBtwItems / 3),
                  Text(
                    '12, Line 1, Downtown Street',
                    style: textTheme.bodyMedium?.copyWith(
                      color: isDark
                          ? Colors.grey[300]
                          : Colors.grey[700],
                    ),
                  ),
                  const SizedBox(height: RSizes.spaceBtwItems / 3),
                  Text(
                    'Agra, Uttar Pradesh, India - 282001',
                    style: textTheme.bodyMedium?.copyWith(
                      color: isDark
                          ? Colors.grey[300]
                          : Colors.grey[700],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
