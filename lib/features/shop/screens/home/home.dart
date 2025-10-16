import 'package:e_commerce/common/widgets/primary_container.dart';
import 'package:e_commerce/common/widgets/product_card_vertical.dart';
import 'package:e_commerce/common/widgets/search_bar.dart';
import 'package:e_commerce/features/shop/screens/home/widgets/animated_section.dart';
import 'package:e_commerce/features/shop/screens/home/widgets/carousel_widget.dart';
import 'package:e_commerce/features/shop/screens/home/widgets/categories.dart';
import 'package:e_commerce/features/shop/screens/home/widgets/featured_banner.dart';
import 'package:e_commerce/features/shop/screens/home/widgets/heading_section.dart';
import 'package:e_commerce/features/shop/screens/home/widgets/home_app_bar.dart';
import 'package:e_commerce/features/shop/screens/home/widgets/quick_actions.dart';
import 'package:e_commerce/features/shop/screens/home/widgets/trending_section.dart';
import 'package:e_commerce/features/shop/screens/popular_products/popular_products.dart';
import 'package:e_commerce/features/shop/screens/product_details/product_detail.dart';
import 'package:e_commerce/utils/constants/images.dart';
import 'package:e_commerce/utils/constants/sizes.dart';
import 'package:e_commerce/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  late AnimationController _headerController;
  late Animation<double> _headerAnimation;

  @override
  void initState() {
    super.initState();
    _headerController = AnimationController(
      duration: const Duration(milliseconds: 800),
      vsync: this,
    );
    _headerAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _headerController, curve: Curves.easeOut),
    );
    _headerController.forward();
  }

  @override
  void dispose() {
    _headerController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isDark = RHelperFunctions.isDarkMode(context);
    final screenWidth = MediaQuery.of(context).size.width;
    final isSmallScreen = screenWidth < 400;

    return Scaffold(
      backgroundColor: isDark
          ? const Color(0xFF121212)
          : const Color(0xFFF8F9FA),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Header Section with Animation
            FadeTransition(
              opacity: _headerAnimation,
              child: RPrimaryContainer(
                child: Column(
                  children: [
                    AnimatedSection(child: HomeAppBar(name: "Nikhil Yadav")),
                    SizedBox(
                      height: isSmallScreen ? 16 : RSizes.spaceBtwSections,
                    ),

                    // Search Bar
                    AnimatedSection(
                      delay: const Duration(milliseconds: 200),
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: isSmallScreen ? 12 : RSizes.defaultSpace,
                        ),
                        child: RSearchBar(showFilter: false),
                      ),
                    ),
                    SizedBox(
                      height: isSmallScreen ? 16 : RSizes.spaceBtwSections,
                    ),

                    // Categories section
                    AnimatedSection(
                      delay: const Duration(milliseconds: 400),
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: isSmallScreen ? 12 : RSizes.defaultSpace,
                        ),
                        child: Column(
                          children: [
                            RSectionHeading(
                              icon: null,
                              title: 'Popular Categories',
                              buttonTitle: null,
                            ),
                            const SizedBox(height: RSizes.spaceBtwItems),
                            const Categories(),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: isSmallScreen ? 20 : RSizes.spaceBtwSections,
                    ),
                  ],
                ),
              ),
            ),

            SizedBox(height: isSmallScreen ? 16 : 20),

            // Featured Banner
            AnimatedSection(
              delay: const Duration(milliseconds: 600),
              child: const FeaturedBanner(),
            ),

            SizedBox(height: isSmallScreen ? 16 : 20),

            // Quick Actions
            AnimatedSection(
              delay: const Duration(milliseconds: 800),
              child: const QuickActions(),
            ),

            SizedBox(height: isSmallScreen ? 20 : 24),

            // Carousel
            AnimatedSection(
              delay: const Duration(milliseconds: 1000),
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: isSmallScreen ? 12 : RSizes.defaultSpace,
                ),
                child: RCarouselWidget(
                  banners: [
                    RImages.promoBanner1,
                    RImages.promoBanner2,
                    RImages.promoBanner3,
                  ],
                ),
              ),
            ),

            SizedBox(height: isSmallScreen ? 20 : 24),

            // Trending Products
            AnimatedSection(
              delay: const Duration(milliseconds: 1200),
              child: const TrendingSection(),
            ),

            SizedBox(height: isSmallScreen ? 20 : 24),

            // Popular Products Grid
            AnimatedSection(
              delay: const Duration(milliseconds: 1400),
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: isSmallScreen ? 12 : RSizes.defaultSpace,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    RSectionHeading(
                      icon: Icons.star,
                      title: 'Popular Products',
                      onPressed: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => PopularProductsScreen(
                            screenName: 'Popular Products',
                          ),
                        ),
                      ),
                    ),

                    SizedBox(height: isSmallScreen ? 12 : 16),
                    GridView.builder(
                      itemCount: 6,
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 12,
                        mainAxisSpacing: 12,
                        mainAxisExtent: isSmallScreen ? 240 : 260,
                      ),
                      itemBuilder: (context, index) => ProductCardVertical(
                        onPressed: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => const ProductDetail(),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            SizedBox(height: isSmallScreen ? 20 : 24),
          ],
        ),
      ),
    );
  }
}
