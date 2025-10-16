import 'package:e_commerce/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';

class RSectionHeading extends StatelessWidget {
  const RSectionHeading({
    super.key,
    this.icon,
    required this.title,
    this.onPressed,
    this.buttonTitle = 'View All',
  });

  final IconData? icon;
  final String title;
  final String? buttonTitle;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    final bool isDark = RHelperFunctions.isDarkMode(context);
    final screenWidth = MediaQuery.of(context).size.width;
    final isSmallScreen = screenWidth < 400;

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            if (icon != null)
              Container(
                padding: const EdgeInsets.all(6),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: isDark
                        ? [const Color(0xFF4A90E2), const Color(0xFF357ABD)]
                        : [const Color(0xFF6C63FF), const Color(0xFF5A52D5)],
                  ),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Icon(
                  icon,
                  color: Colors.white,
                  size: isSmallScreen ? 16 : 18,
                ),
              ),
            if (icon != null) const SizedBox(width: 12),
            Text(
              title,
              style: TextStyle(
                fontSize: isSmallScreen ? 16 : 18,
                fontWeight: FontWeight.w600,
                color: isDark ? Colors.white : const Color(0xFF2D3748),
              ),
            ),
          ],
        ),

        if (buttonTitle != null)
          TextButton(
            onPressed: onPressed,
            child: Text(
              buttonTitle!,
              style: TextStyle(
                color: isDark
                    ? const Color(0xFF4A90E2)
                    : const Color(0xFF6C63FF),
                fontWeight: FontWeight.w600,
                fontSize: isSmallScreen ? 12 : 14,
              ),
            ),
          ),
      ],
    );
  }
}
