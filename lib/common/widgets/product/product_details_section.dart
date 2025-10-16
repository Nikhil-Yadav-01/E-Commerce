import 'package:flutter/material.dart';
import '../product_card_components/product_title_text.dart';
import '../product_card_components/brand_row.dart';
import '../product_card_components/add_to_cart_button.dart';

class ProductDetailsSection extends StatelessWidget {
  const ProductDetailsSection({super.key, required this.isDark});

  final bool isDark;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isSmallScreen = screenWidth < 400;
    
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 6),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const RProductTitleText(
                title: 'Green Nike Air Shoes',
                smallSize: true,
              ),
              const SizedBox(height: 2),
              BrandRow(isDark: isDark, isSmallScreen: isSmallScreen),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                '\$250.00',
                style: Theme.of(context).textTheme.titleMedium!.copyWith(
                  fontWeight: FontWeight.bold,
                  fontSize: isSmallScreen ? 14 : 16,
                  color: isDark ? Colors.white : const Color(0xFF2D3748),
                ),
              ),
              AddToCartButton(isDark: isDark, isSmallScreen: isSmallScreen),
            ],
          ),
        ],
      ),
    );
  }
}