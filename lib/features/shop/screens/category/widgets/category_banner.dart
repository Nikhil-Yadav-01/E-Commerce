import 'package:flutter/material.dart';
import 'package:e_commerce/utils/helpers/helper_functions.dart';

class CategoryBanner extends StatelessWidget {
  const CategoryBanner({
    super.key,
    required this.categoryName,
  });

  final String categoryName;

  @override
  Widget build(BuildContext context) {
    final isDark = RHelperFunctions.isDarkMode(context);
    final screenWidth = MediaQuery.of(context).size.width;
    final isSmallScreen = screenWidth < 400;

    return Container(
      margin: EdgeInsets.all(isSmallScreen ? 12 : 16),
      height: isSmallScreen ? 160 : 180,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: _getCategoryGradient(categoryName, isDark),
        ),
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: _getCategoryGradient(categoryName, isDark)[0].withValues(alpha: 0.3),
            blurRadius: 12,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Stack(
        children: [
          // Background Pattern
          Positioned(
            right: -20,
            top: -20,
            child: Container(
              width: 100,
              height: 100,
              decoration: BoxDecoration(
                color: Colors.white.withValues(alpha: 0.1),
                shape: BoxShape.circle,
              ),
            ),
          ),
          
          // Content
          Padding(
            padding: EdgeInsets.all(isSmallScreen ? 16 : 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: isSmallScreen ? 8 : 12,
                    vertical: isSmallScreen ? 4 : 6,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white.withValues(alpha: 0.2),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    'FASHION SALE',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: isSmallScreen ? 10 : 12,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1.2,
                    ),
                  ),
                ),
                
                const SizedBox(height: 12),
                
                Text(
                  'FASHION\nSALE',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: isSmallScreen ? 24 : 28,
                    fontWeight: FontWeight.bold,
                    height: 1.1,
                  ),
                ),
                
                const SizedBox(height: 8),
                
                Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: Colors.amber,
                    shape: BoxShape.circle,
                  ),
                  child: Text(
                    '30%\nOFF',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: isSmallScreen ? 8 : 10,
                      fontWeight: FontWeight.bold,
                      height: 1.0,
                    ),
                  ),
                ),
              ],
            ),
          ),
          
          // Product Image Placeholder
          Positioned(
            right: isSmallScreen ? 16 : 20,
            bottom: isSmallScreen ? 16 : 20,
            child: Container(
              width: isSmallScreen ? 80 : 100,
              height: isSmallScreen ? 60 : 80,
              decoration: BoxDecoration(
                color: Colors.white.withValues(alpha: 0.2),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Icon(
                _getCategoryIcon(categoryName),
                color: Colors.white,
                size: isSmallScreen ? 30 : 40,
              ),
            ),
          ),
        ],
      ),
    );
  }

  List<Color> _getCategoryGradient(String category, bool isDark) {
    switch (category.toLowerCase()) {
      case 'sports':
        return isDark
            ? [const Color(0xFF4A90E2), const Color(0xFF357ABD)]
            : [const Color(0xFF6C63FF), const Color(0xFF5A52D5)];
      case 'cosmetics':
        return [const Color(0xFFFF6B6B), const Color(0xFFE55353)];
      case 'electronics':
        return [const Color(0xFF4ECDC4), const Color(0xFF44A08D)];
      case 'clothing':
        return [const Color(0xFFFFB347), const Color(0xFFFF8C42)];
      case 'furniture':
        return [const Color(0xFF9B59B6), const Color(0xFF8E44AD)];
      default:
        return isDark
            ? [const Color(0xFF4A90E2), const Color(0xFF357ABD)]
            : [const Color(0xFF6C63FF), const Color(0xFF5A52D5)];
    }
  }

  IconData _getCategoryIcon(String category) {
    switch (category.toLowerCase()) {
      case 'sports':
        return Icons.sports_soccer;
      case 'cosmetics':
        return Icons.face_retouching_natural;
      case 'electronics':
        return Icons.devices;
      case 'clothing':
        return Icons.checkroom;
      case 'furniture':
        return Icons.chair;
      default:
        return Icons.category;
    }
  }
}