import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:e_commerce/utils/helpers/helper_functions.dart';
import 'package:e_commerce/features/shop/screens/product_details/product_detail.dart';

class CategoryProductCard extends StatefulWidget {
  const CategoryProductCard({
    super.key,
    required this.categoryName,
    required this.sectionKey,
    required this.productIndex,
  });

  final String categoryName;
  final String sectionKey;
  final int productIndex;

  @override
  State<CategoryProductCard> createState() => _CategoryProductCardState();
}

class _CategoryProductCardState extends State<CategoryProductCard> {
  bool _isFavorite = false;

  @override
  Widget build(BuildContext context) {
    final isDark = RHelperFunctions.isDarkMode(context);
    final screenWidth = MediaQuery.of(context).size.width;
    final isSmallScreen = screenWidth < 400;

    return GestureDetector(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(builder: (_) => const ProductDetail()),
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
            // Product Image
            Container(
              width: isSmallScreen ? 60 : 80,
              height: isSmallScreen ? 60 : 80,
              decoration: BoxDecoration(
                color: _getProductColor(widget.productIndex).withValues(alpha: 0.1),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Stack(
                children: [
                  Center(
                    child: Icon(
                      _getProductIcon(widget.categoryName),
                      color: _getProductColor(widget.productIndex),
                      size: isSmallScreen ? 30 : 40,
                    ),
                  ),
                  if (widget.productIndex == 0)
                    Positioned(
                      top: 4,
                      left: 4,
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 2),
                        decoration: BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Text(
                          '20% OFF',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: isSmallScreen ? 8 : 10,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                ],
              ),
            ),
            
            const SizedBox(width: 12),
            
            // Product Details
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    _getProductName(widget.categoryName, widget.sectionKey, widget.productIndex),
                    style: TextStyle(
                      fontSize: isSmallScreen ? 14 : 16,
                      fontWeight: FontWeight.w600,
                      color: isDark ? Colors.white : const Color(0xFF2D3748),
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  
                  const SizedBox(height: 4),
                  
                  Text(
                    'Authentic designer footwear\nSizing chart available',
                    style: TextStyle(
                      fontSize: isSmallScreen ? 11 : 12,
                      color: isDark ? Colors.white70 : Colors.black54,
                      height: 1.3,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  
                  const SizedBox(height: 8),
                  
                  Row(
                    children: [
                      Text(
                        _getProductPrice(widget.productIndex),
                        style: TextStyle(
                          fontSize: isSmallScreen ? 16 : 18,
                          fontWeight: FontWeight.bold,
                          color: isDark ? Colors.white : const Color(0xFF2D3748),
                        ),
                      ),
                      const Spacer(),
                      GestureDetector(
                        onTap: () => setState(() => _isFavorite = !_isFavorite),
                        child: Container(
                          padding: const EdgeInsets.all(6),
                          decoration: BoxDecoration(
                            color: _isFavorite
                                ? Colors.red.withValues(alpha: 0.1)
                                : (isDark ? Colors.white.withValues(alpha: 0.1) : Colors.grey.withValues(alpha: 0.1)),
                            shape: BoxShape.circle,
                          ),
                          child: Icon(
                            _isFavorite ? Iconsax.heart5 : Iconsax.heart,
                            color: _isFavorite ? Colors.red : (isDark ? Colors.white70 : Colors.black54),
                            size: isSmallScreen ? 16 : 18,
                          ),
                        ),
                      ),
                      const SizedBox(width: 8),
                      Container(
                        padding: const EdgeInsets.all(6),
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: isDark
                                ? [const Color(0xFF4A90E2), const Color(0xFF357ABD)]
                                : [const Color(0xFF6C63FF), const Color(0xFF5A52D5)],
                          ),
                          borderRadius: BorderRadius.circular(6),
                        ),
                        child: Icon(
                          Iconsax.add,
                          color: Colors.white,
                          size: isSmallScreen ? 14 : 16,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Color _getProductColor(int index) {
    switch (index) {
      case 0: return Colors.red;
      case 1: return Colors.amber;
      case 2: return Colors.blue;
      default: return Colors.grey;
    }
  }

  IconData _getProductIcon(String category) {
    switch (category.toLowerCase()) {
      case 'sports': return Icons.sports_soccer;
      case 'cosmetics': return Icons.face_retouching_natural;
      case 'electronics': return Icons.devices;
      case 'clothing': return Icons.checkroom;
      case 'furniture': return Icons.chair;
      default: return Icons.shopping_bag;
    }
  }

  String _getProductName(String category, String section, int index) {
    switch (category.toLowerCase()) {
      case 'sports':
        switch (section) {
          case 'equipment': return ['Football', 'Basketball', 'Tennis Racket'][index];
          case 'shoes': return ['Nike Air Max', 'Adidas Ultraboost', 'Puma RS-X'][index];
          case 'suits': return ['Nike Tracksuit', 'Adidas Set', 'Puma Outfit'][index];
          default: return ['Sports Item ${index + 1}', 'Gear ${index + 1}', 'Equipment ${index + 1}'][index];
        }
      case 'cosmetics':
        switch (section) {
          case 'makeup': return ['Lipstick Set', 'Foundation Kit', 'Eye Shadow'][index];
          case 'skincare': return ['Face Cream', 'Serum', 'Moisturizer'][index];
          case 'fragrances': return ['Perfume', 'Body Spray', 'Cologne'][index];
          default: return ['Beauty Item ${index + 1}', 'Cosmetic ${index + 1}', 'Product ${index + 1}'][index];
        }
      default:
        return ['Product ${index + 1}', 'Item ${index + 1}', 'Brand ${index + 1}'][index];
    }
  }

  String _getProductPrice(int index) {
    switch (index) {
      case 0: return '\$40.0';
      case 1: return '\$32.8 - \$35.0';
      case 2: return '\$28.5';
      default: return '\$25.0';
    }
  }
}