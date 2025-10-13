import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../../utils/helpers/helper_functions.dart';

class StoreScreen extends StatelessWidget {
  const StoreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = RHelperFunctions.isDarkMode(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Store',
          style: Theme.of(context).textTheme.headlineSmall?.copyWith(
            color: isDark ? RColors.onPrimaryDark : RColors.onPrimaryLight,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              Iconsax.shopping_cart,
              color: isDark ? RColors.onPrimaryDark : RColors.onPrimaryLight,
            ),
          ),
        ],
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(RSizes.defaultSpace),
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                decoration: BoxDecoration(
                  color: isDark ? RColors.cardDark : RColors.cardLight,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Row(
                  children: [
                    Icon(Iconsax.search_normal, color: isDark ? RColors.onMutedDark : RColors.onMutedLight),
                    const SizedBox(width: 8),
                    Text(
                      'Search Products',
                      style: TextStyle(color: isDark ? RColors.onMutedDark : RColors.onMutedLight),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: RSizes.spaceBtwSections),
              Text(
                'Featured Brands',
                style: Theme.of(context).textTheme.headlineSmall,
              ),
              const SizedBox(height: RSizes.spaceBtwItems),
              GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                  childAspectRatio: 1.2,
                ),
                itemCount: 6,
                itemBuilder: (context, index) {
                  return Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: isDark ? RColors.cardDark : RColors.cardLight,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Iconsax.shop,
                          size: 40,
                          color: RColors.primaryLight,
                        ),
                        const SizedBox(height: 8),
                        Text(
                          'Brand ${index + 1}',
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                      ],
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}