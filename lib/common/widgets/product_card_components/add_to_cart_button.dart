import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class AddToCartButton extends StatelessWidget {
  const AddToCartButton({super.key, required this.isDark, required this.isSmallScreen});

  final bool isDark;
  final bool isSmallScreen;

  @override
  Widget build(BuildContext context) {
    final size = isSmallScreen ? 26.0 : 28.0;
    final iconSize = isSmallScreen ? 14.0 : 16.0;
    
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: isDark
              ? [const Color(0xFF4A90E2), const Color(0xFF357ABD)]
              : [const Color(0xFF6C63FF), const Color(0xFF5A52D5)],
        ),
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: (isDark ? const Color(0xFF4A90E2) : const Color(0xFF6C63FF))
                .withValues(alpha: 0.3),
            blurRadius: 6,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Icon(
        Iconsax.add,
        color: Colors.white,
        size: iconSize,
      ),
    );
  }
}