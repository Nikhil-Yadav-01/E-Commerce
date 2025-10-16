import 'package:e_commerce/features/shop/screens/home/widgets/heading_section.dart';
import 'package:e_commerce/utils/constants/images.dart';
import 'package:e_commerce/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';

import '../../brands/all_brands_screen.dart';

class BrandShowcase extends StatelessWidget {
  const BrandShowcase({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = RHelperFunctions.isDarkMode(context);
    final screenWidth = MediaQuery.of(context).size.width;
    final isSmallScreen = screenWidth < 400;

    final brands = [
      {'name': 'Nike', 'image': RImages.nikeLogo, 'products': '265'},
      {'name': 'Adidas', 'image': RImages.zaraLogo, 'products': '95'},
      {'name': 'Apple', 'image': RImages.appleLogo, 'products': '36'},
      {'name': 'Samsung', 'image': RImages.appleLogo, 'products': '208'},
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: isSmallScreen ? 12 : 16),
          child: RSectionHeading(
            icon: Icons.verified,
            title: 'Featured Brands',
            onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => const AllBrandsScreen()),
            ),
          ),
        ),
        const SizedBox(height: 16),
        SizedBox(
          height: isSmallScreen ? 100 : 120,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            padding: EdgeInsets.symmetric(horizontal: isSmallScreen ? 12 : 16),
            itemCount: brands.length,
            itemBuilder: (context, index) {
              final brand = brands[index];
              return Container(
                width: isSmallScreen ? 140 : 160,
                margin: const EdgeInsets.only(right: 12),
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
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Container(
                          width: isSmallScreen ? 24 : 28,
                          height: isSmallScreen ? 24 : 28,
                          decoration: BoxDecoration(
                            color: Colors.grey.withValues(alpha: 0.2),
                            borderRadius: BorderRadius.circular(6),
                          ),
                          child: Icon(
                            Icons.store,
                            size: isSmallScreen ? 14 : 16,
                            color: isDark ? Colors.white70 : Colors.black54,
                          ),
                        ),
                        const Spacer(),
                        Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: isSmallScreen ? 6 : 8,
                            vertical: 2,
                          ),
                          decoration: BoxDecoration(
                            color:
                                (isDark
                                        ? const Color(0xFF4A90E2)
                                        : const Color(0xFF6C63FF))
                                    .withValues(alpha: 0.1),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Text(
                            '${brand['products']}+',
                            style: TextStyle(
                              fontSize: isSmallScreen ? 10 : 11,
                              fontWeight: FontWeight.w600,
                              color: isDark
                                  ? const Color(0xFF4A90E2)
                                  : const Color(0xFF6C63FF),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Text(
                      brand['name'] as String,
                      style: TextStyle(
                        fontSize: isSmallScreen ? 14 : 16,
                        fontWeight: FontWeight.w600,
                        color: isDark ? Colors.white : const Color(0xFF2D3748),
                      ),
                    ),
                    Text(
                      'Products',
                      style: TextStyle(
                        fontSize: isSmallScreen ? 11 : 12,
                        color: isDark ? Colors.white70 : Colors.black54,
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
