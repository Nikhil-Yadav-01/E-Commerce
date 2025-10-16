import 'package:flutter/material.dart';
import 'package:e_commerce/common/widgets/product_card_vertical.dart';
import 'package:e_commerce/features/shop/screens/product_details/product_detail.dart';
import 'package:e_commerce/features/shop/screens/home/widgets/animated_section.dart';
import 'package:e_commerce/utils/helpers/helper_functions.dart';

class RTabContent extends StatelessWidget {
  const RTabContent({
    super.key,
    required this.tabKey,
  });

  final String tabKey;

  @override
  Widget build(BuildContext context) {
    final isDark = RHelperFunctions.isDarkMode(context);
    final screenWidth = MediaQuery.of(context).size.width;
    final isSmallScreen = screenWidth < 400;

    return Builder(
      builder: (context) {
        return CustomScrollView(
          key: PageStorageKey<String>(tabKey),
          slivers: [
            SliverOverlapInjector(
              handle: NestedScrollView.sliverOverlapAbsorberHandleFor(context),
            ),
            SliverPadding(
              padding: EdgeInsets.all(isSmallScreen ? 12 : 16),
              sliver: SliverList(
                delegate: SliverChildListDelegate([
                  // Category Banner
                  AnimatedSection(
                    child: Container(
                      padding: EdgeInsets.all(isSmallScreen ? 16 : 20),
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: _getCategoryGradient(tabKey, isDark),
                        ),
                        borderRadius: BorderRadius.circular(16),
                        boxShadow: [
                          BoxShadow(
                            color: _getCategoryGradient(tabKey, isDark)[0]
                                .withValues(alpha: 0.3),
                            blurRadius: 12,
                            offset: const Offset(0, 4),
                          ),
                        ],
                      ),
                      child: Row(
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  '${_getCategoryName(tabKey)} Collection',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: isSmallScreen ? 18 : 22,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const SizedBox(height: 8),
                                Text(
                                  'Discover amazing products',
                                  style: TextStyle(
                                    color: Colors.white.withValues(alpha: 0.9),
                                    fontSize: isSmallScreen ? 12 : 14,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.all(12),
                            decoration: BoxDecoration(
                              color: Colors.white.withValues(alpha: 0.2),
                              shape: BoxShape.circle,
                            ),
                            child: Icon(
                              _getCategoryIcon(tabKey),
                              color: Colors.white,
                              size: isSmallScreen ? 24 : 28,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  
                  SizedBox(height: isSmallScreen ? 16 : 20),
                  
                  // Products Grid
                  AnimatedSection(
                    delay: const Duration(milliseconds: 200),
                    child: GridView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 12,
                        mainAxisSpacing: 12,
                        mainAxisExtent: isSmallScreen ? 240 : 260,
                      ),
                      itemCount: 12,
                      itemBuilder: (context, index) => ProductCardVertical(
                        onPressed: () => Navigator.push(
                          context,
                          MaterialPageRoute(builder: (_) => const ProductDetail()),
                        ),
                      ),
                    ),
                  ),
                ]),
              ),
            ),
          ],
        );
      },
    );
  }

  List<Color> _getCategoryGradient(String category, bool isDark) {
    switch (category) {
      case 'sports':
        return isDark
            ? [const Color(0xFF4A90E2), const Color(0xFF357ABD)]
            : [const Color(0xFF6C63FF), const Color(0xFF5A52D5)];
      case 'furniture':
        return [const Color(0xFF9B59B6), const Color(0xFF8E44AD)];
      case 'electronics':
        return [const Color(0xFF4ECDC4), const Color(0xFF44A08D)];
      case 'clothes':
        return [const Color(0xFFFFB347), const Color(0xFFFF8C42)];
      case 'cosmetics':
        return [const Color(0xFFFF6B6B), const Color(0xFFE55353)];
      default:
        return isDark
            ? [const Color(0xFF4A90E2), const Color(0xFF357ABD)]
            : [const Color(0xFF6C63FF), const Color(0xFF5A52D5)];
    }
  }

  String _getCategoryName(String key) {
    switch (key) {
      case 'sports': return 'Sports';
      case 'furniture': return 'Furniture';
      case 'electronics': return 'Electronics';
      case 'clothes': return 'Fashion';
      case 'cosmetics': return 'Beauty';
      default: return 'Products';
    }
  }

  IconData _getCategoryIcon(String key) {
    switch (key) {
      case 'sports': return Icons.sports_soccer;
      case 'furniture': return Icons.chair;
      case 'electronics': return Icons.devices;
      case 'clothes': return Icons.checkroom;
      case 'cosmetics': return Icons.face_retouching_natural;
      default: return Icons.category;
    }
  }
}