import 'package:e_commerce/features/shop/screens/brands/brand_screen.dart';
import 'package:e_commerce/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';

class BrandCard extends StatelessWidget {
  const BrandCard({super.key, required this.brand, required this.index});

  final Map<String, String> brand;
  final int index;

  @override
  Widget build(BuildContext context) {
    final isDark = RHelperFunctions.isDarkMode(context);
    final screenWidth = RHelperFunctions.screenWidth();
    final isSmallScreen = screenWidth < 400;

    return GestureDetector(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (_) => BrandScreen(
            brandName: brand['name']!,
            brandBannerImage: brand['banner']!,
          ),
        ),
      ),
      child: Container(
        padding: EdgeInsets.all(isSmallScreen ? 12 : 16),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: isDark
                ? [const Color(0xFF2A2A2A), const Color(0xFF1E1E1E)]
                : [Colors.white, const Color(0xFFF8F9FA)],
          ),
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: isDark
                ? Colors.white.withValues(alpha: 0.1)
                : Colors.grey.withValues(alpha: 0.2),
          ),
          boxShadow: [
            BoxShadow(
              color: isDark
                  ? Colors.black.withValues(alpha: 0.3)
                  : Colors.grey.withValues(alpha: 0.1),
              blurRadius: 8,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Row(
          children: [
            // Brand Icon
            Container(
              width: isSmallScreen ? 40 : 48,
              height: isSmallScreen ? 40 : 48,
              decoration: BoxDecoration(
                color: _getBrandColor(index).withValues(alpha: 0.1),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Icon(
                _getBrandIcon(brand['category']!),
                color: _getBrandColor(index),
                size: isSmallScreen ? 20 : 24,
              ),
            ),

            const SizedBox(width: 12),

            // Brand Details
            Flexible(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    brand['name']!,
                    style: TextStyle(
                      fontSize: isSmallScreen ? 16 : 18,
                      fontWeight: FontWeight.w600,
                      color: isDark ? Colors.white : const Color(0xFF2D3748),
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 4),
                  Text(
                    '${brand['products']}+ Products',
                    style: TextStyle(
                      fontSize: isSmallScreen ? 12 : 14,
                      color: isDark ? Colors.white70 : Colors.black54,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),

            const SizedBox(width: 8),

            // Category Badge
            Flexible(
              child: Container(
                padding: EdgeInsets.symmetric(
                  horizontal: isSmallScreen ? 6 : 8,
                  vertical: isSmallScreen ? 4 : 6,
                ),
                decoration: BoxDecoration(
                  color: _getBrandColor(index).withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Text(
                  brand['category']!,
                  style: TextStyle(
                    fontSize: isSmallScreen ? 9 : 11,
                    fontWeight: FontWeight.w600,
                    color: _getBrandColor(index),
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Color _getBrandColor(int index) {
    final colors = [
      const Color(0xFF6C63FF),
      const Color(0xFF4ECDC4),
      const Color(0xFFFF6B6B),
      const Color(0xFFFFB347),
      const Color(0xFF9B59B6),
    ];
    return colors[index % colors.length];
  }

  IconData _getBrandIcon(String category) {
    switch (category.toLowerCase()) {
      case 'sports':
        return Icons.sports_soccer;
      case 'electronics':
        return Icons.devices;
      case 'fashion':
        return Icons.checkroom;
      case 'beauty':
        return Icons.face_retouching_natural;
      case 'furniture':
        return Icons.chair;
      default:
        return Icons.store;
    }
  }
}
