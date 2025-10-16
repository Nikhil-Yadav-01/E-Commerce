import 'package:flutter/material.dart';
import 'package:e_commerce/utils/helpers/helper_functions.dart';

class AnimatedTabBar extends StatelessWidget {
  const AnimatedTabBar({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = RHelperFunctions.isDarkMode(context);
    final screenWidth = MediaQuery.of(context).size.width;
    final isSmallScreen = screenWidth < 400;

    final categories = [
      {'name': 'Sports', 'icon': Icons.sports_soccer},
      {'name': 'Furniture', 'icon': Icons.chair},
      {'name': 'Electronics', 'icon': Icons.devices},
      {'name': 'Clothes', 'icon': Icons.checkroom},
      {'name': 'Cosmetics', 'icon': Icons.face_retouching_natural},
    ];

    return TabBar(
        isScrollable: true,
        padding: EdgeInsets.symmetric(horizontal: isSmallScreen ? 8 : 12),
        indicatorColor: isDark ? const Color(0xFF4A90E2) : const Color(0xFF6C63FF),
        indicatorWeight: 3,
        labelColor: isDark ? const Color(0xFF4A90E2) : const Color(0xFF6C63FF),
        unselectedLabelColor: isDark ? Colors.white70 : Colors.black54,
        labelStyle: TextStyle(
          fontWeight: FontWeight.w600,
          fontSize: isSmallScreen ? 12 : 14,
        ),
        unselectedLabelStyle: TextStyle(
          fontWeight: FontWeight.w500,
          fontSize: isSmallScreen ? 12 : 14,
        ),
        tabs: categories.map((category) {
          return Tab(
            child: Container(
              padding: EdgeInsets.symmetric(
                horizontal: isSmallScreen ? 8 : 12,
                vertical: isSmallScreen ? 6 : 8,
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    category['icon'] as IconData,
                    size: isSmallScreen ? 16 : 18,
                  ),
                  const SizedBox(width: 6),
                  Text(category['name'] as String),
                ],
              ),
            ),
          );
        }).toList(),
    );
  }
}