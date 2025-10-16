import 'package:e_commerce/features/shop/screens/popular_products/popular_products.dart';
import 'package:e_commerce/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';

import 'category_product_card.dart';

class CategorySection extends StatelessWidget {
  const CategorySection({
    super.key,
    required this.title,
    required this.categoryName,
    required this.sectionKey,
  });

  final String title;
  final String categoryName;
  final String sectionKey;

  @override
  Widget build(BuildContext context) {
    final isDark = RHelperFunctions.isDarkMode(context);
    final screenWidth = MediaQuery.of(context).size.width;
    final isSmallScreen = screenWidth < 400;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Section Header
        Padding(
          padding: EdgeInsets.symmetric(horizontal: isSmallScreen ? 12 : 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: TextStyle(
                  fontSize: isSmallScreen ? 16 : 18,
                  fontWeight: FontWeight.w600,
                  color: isDark ? Colors.white : const Color(0xFF2D3748),
                ),
              ),
              TextButton(
                onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => PopularProductsScreen(
                      screenName: '$categoryName - $title',
                    ),
                  ),
                ),
                child: Text(
                  'View all',
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
          ),
        ),

        const SizedBox(height: 12),

        // Product List
        SizedBox(
          height: isSmallScreen ? 120 : 140,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            padding: EdgeInsets.symmetric(horizontal: isSmallScreen ? 12 : 16),
            itemCount: 3,
            itemBuilder: (context, index) {
              return Container(
                width: screenWidth * 0.85,
                margin: const EdgeInsets.only(right: 12),
                child: CategoryProductCard(
                  categoryName: categoryName,
                  sectionKey: sectionKey,
                  productIndex: index,
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
