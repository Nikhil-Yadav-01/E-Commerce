import 'package:flutter/material.dart';

import '../../../../../common/widgets/brand_card.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/images.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/helpers/helper_functions.dart';

class FeaturedBrandsSection extends StatelessWidget {
  const FeaturedBrandsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final bool isDark = RHelperFunctions.isDarkMode(context);
    
    return Container(
      color: isDark ? RColors.backgroundDark : RColors.backgroundLight,
      padding: const EdgeInsets.symmetric(horizontal: RSizes.defaultSpace),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Featured Brands', style: Theme.of(context).textTheme.headlineSmall),
              TextButton(onPressed: () {}, child: const Text('View all')),
            ],
          ),
          const SizedBox(height: RSizes.spaceBtwItems / 1.5),
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: RSizes.gridViewSpacing,
              crossAxisSpacing: RSizes.gridViewSpacing,
              mainAxisExtent: 80,
            ),
            itemCount: 4,
            itemBuilder: (_, index) {
              final brands = [
                {'name': 'Nike', 'count': '256', 'logo': RImages.nikeLogo},
                {'name': 'Adidas', 'count': '95', 'logo': RImages.appleLogo},
                {'name': 'Jordan', 'count': '36', 'logo': RImages.nikeLogo},
                {'name': 'Puma', 'count': '16', 'logo': RImages.appleLogo},
              ];
              return BrandCard(
                brandName: brands[index]['name']!,
                productCount: brands[index]['count']!,
                brandLogo: brands[index]['logo']!,
              );
            },
          ),
        ],
      ),
    );
  }
}