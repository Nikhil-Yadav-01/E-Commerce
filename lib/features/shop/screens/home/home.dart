import 'package:e_commerce/common/widgets/product_card_vertical.dart';
import 'package:e_commerce/features/shop/screens/home/widgets/carousel_widget.dart';
import 'package:e_commerce/features/shop/screens/home/widgets/categories.dart';
import 'package:e_commerce/features/shop/screens/home/widgets/heading_section.dart';
import 'package:e_commerce/features/shop/screens/home/widgets/home_app_bar.dart';
import 'package:e_commerce/features/shop/screens/home/widgets/primary_container.dart';
import 'package:e_commerce/utils/constants/colors.dart';
import 'package:e_commerce/utils/constants/images.dart';
import 'package:flutter/material.dart';

import '../../../../common/widgets/search_container.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../../utils/helpers/helper_functions.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = RHelperFunctions.isDarkMode(context);

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            HomePrimaryContainer(
              isDark: isDark,
              child: Column(
                children: [
                  HomeAppBar(name: "Nikhil Yadav"),
                  const SizedBox(height: RSizes.spaceBtwSections),

                  // Search Bar
                  SearchContainer(text: 'Search in store'),
                  const SizedBox(height: RSizes.spaceBtwSections),

                  // Heading
                  RSectionHeading(
                    textColor: RColors.white,
                    title: 'Popular Categories',
                  ),
                  const SizedBox(height: RSizes.spaceBtwItems),

                  // Categories
                  Categories(),
                ],
              ),
            ),

            // Content
            Padding(
              padding: const EdgeInsets.all(RSizes.defaultSpace),
              child: Column(
                children: [
                  // Carousel
                  RCarouselWidget(
                    banners: [
                      RImages.promoBanner1,
                      RImages.promoBanner2,
                      RImages.promoBanner3,
                    ],
                  ),
                  const SizedBox(height: RSizes.spaceBtwSections),

                  // Popular Products
                  GridView.builder(
                    itemCount: 6,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: RSizes.gridViewSpacing,
                      mainAxisSpacing: RSizes.gridViewSpacing,
                      mainAxisExtent: 288,
                    ),
                    itemBuilder: (_, index) => ProductCardVertical(

                    ),
                  ),
                ],
              )
            ),
          ],
        ),
      ),
    );
  }
}
