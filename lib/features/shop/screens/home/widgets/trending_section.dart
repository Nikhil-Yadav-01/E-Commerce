import 'package:e_commerce/common/widgets/product_card_vertical.dart';
import 'package:e_commerce/features/shop/screens/home/widgets/heading_section.dart';
import 'package:e_commerce/features/shop/screens/product_details/product_detail.dart';
import 'package:flutter/material.dart';

class TrendingSection extends StatelessWidget {
  const TrendingSection({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isSmallScreen = screenWidth < 400;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: isSmallScreen ? 12 : 16),
          child: RSectionHeading(
            title: "Trending Now",
            icon: Icons.trending_up,
            onPressed: () {},
          ),
        ),
        const SizedBox(height: 16),
        SizedBox(
          height: isSmallScreen ? 240 : 260,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            padding: EdgeInsets.symmetric(horizontal: isSmallScreen ? 12 : 16),
            itemCount: 6,
            itemBuilder: (context, index) {
              return Container(
                width: isSmallScreen ? 150 : 160,
                margin: const EdgeInsets.only(right: 12),
                child: ProductCardVertical(
                  onPressed: () => Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => const ProductDetail()),
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
