import 'package:e_commerce/common/widgets/primary_container.dart';
import 'package:e_commerce/common/widgets/product_card_vertical.dart';
import 'package:e_commerce/features/shop/screens/home/widgets/carousel_widget.dart';
import 'package:e_commerce/features/shop/screens/home/widgets/categories.dart';
import 'package:e_commerce/features/shop/screens/home/widgets/heading_section.dart';
import 'package:e_commerce/features/shop/screens/home/widgets/home_app_bar.dart';
import 'package:e_commerce/utils/constants/images.dart';
import 'package:flutter/material.dart';

import '../../../../common/widgets/grid_layout_widget.dart';
import '../../../../common/widgets/search_container.dart';
import '../../../../utils/constants/sizes.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            RPrimaryContainer(
              child: Column(
                children: [
                  HomeAppBar(name: "Nikhil Yadav"),
                  const SizedBox(height: RSizes.spaceBtwSections),

                  // Search Bar
                  SearchContainer(text: 'Search in store'),
                  const SizedBox(height: RSizes.spaceBtwSections),

                  // Categories section
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: RSizes.defaultSpace,
                    ),
                    child: Column(
                      children: [
                        RSectionHeading(title: 'Categories'),
                        const SizedBox(height: RSizes.spaceBtwItems),
                        Categories(),
                      ],
                    ),
                  ),
                  const SizedBox(height: RSizes.spaceBtwSections),
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
                  GridLayoutWidget(
                    itemCount: 6,
                    itemBuilder: (context, index) =>
                        const ProductCardVertical(),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
