import 'package:e_commerce/utils/constants/images.dart';
import 'package:flutter/material.dart';
import 'package:e_commerce/common/widgets/app_bar.dart';
import 'package:e_commerce/features/shop/screens/home/widgets/animated_section.dart';
import 'package:e_commerce/utils/helpers/helper_functions.dart';
import 'widgets/brand_card.dart';

class AllBrandsScreen extends StatefulWidget {
  const AllBrandsScreen({super.key});

  @override
  State<AllBrandsScreen> createState() => _AllBrandsScreenState();
}

class _AllBrandsScreenState extends State<AllBrandsScreen>
    with TickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _fadeAnimation;

  final List<Map<String, String>> brands = [
    {'name': 'Nike', 'products': '265', 'category': 'Sports', 'banner': RImages.banner2},
    {'name': 'Adidas', 'products': '95', 'category': 'Sports', 'banner': RImages.banner2},
    {'name': 'Apple', 'products': '36', 'category': 'Electronics', 'banner': RImages.banner2},
    {'name': 'Samsung', 'products': '208', 'category': 'Electronics', 'banner': RImages.banner2},
    {'name': 'Zara', 'products': '156', 'category': 'Fashion', 'banner': RImages.banner2},
    {'name': 'H&M', 'products': '89', 'category': 'Fashion', 'banner': RImages.banner3},
    {'name': 'L\'Oreal', 'products': '124', 'category': 'Beauty', 'banner': RImages.banner2},
    {'name': 'Maybelline', 'products': '67', 'category': 'Beauty', 'banner': RImages.banner2},
    {'name': 'IKEA', 'products': '234', 'category': 'Furniture', 'banner': RImages.banner2},
    {'name': 'Ashley', 'products': '145', 'category': 'Furniture', 'banner': RImages.banner4},
  ];

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 800),
      vsync: this,
    );
    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeOut),
    );
    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isDark = RHelperFunctions.isDarkMode(context);
    final screenWidth = MediaQuery.of(context).size.width;
    final isSmallScreen = screenWidth < 560;

    return Scaffold(
      backgroundColor: isDark ? const Color(0xFF121212) : const Color(0xFFF8F9FA),
      appBar: RAppBar(
        title: Text(
          'All Brands',
          style: TextStyle(
            fontSize: isSmallScreen ? 18 : 20,
            fontWeight: FontWeight.w600,
            color: isDark ? Colors.white : Colors.black87,
          ),
        ),
        showBackArrow: true,
      ),
      body: FadeTransition(
        opacity: _fadeAnimation,
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          padding: EdgeInsets.all(isSmallScreen ? 12 : 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header Section
              AnimatedSection(
                child: Container(
                  padding: EdgeInsets.all(isSmallScreen ? 16 : 20),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: isDark
                          ? [const Color(0xFF4A90E2), const Color(0xFF357ABD)]
                          : [const Color(0xFF6C63FF), const Color(0xFF5A52D5)],
                    ),
                    borderRadius: BorderRadius.circular(16),
                    boxShadow: [
                      BoxShadow(
                        color: (isDark ? const Color(0xFF4A90E2) : const Color(0xFF6C63FF))
                            .withValues(alpha: 0.3),
                        blurRadius: 12,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  child: Row(
                    children: [
                      Flexible(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Discover Brands',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: isSmallScreen ? 20 : 24,
                                fontWeight: FontWeight.bold,
                              ),
                              overflow: TextOverflow.ellipsis,
                            ),
                            const SizedBox(height: 8),
                            Text(
                              'Shop from ${brands.length}+ trusted brands',
                              style: TextStyle(
                                color: Colors.white.withValues(alpha: 0.9),
                                fontSize: isSmallScreen ? 12 : 14,
                              ),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(width: 12),
                      Container(
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: Colors.white.withValues(alpha: 0.2),
                          shape: BoxShape.circle,
                        ),
                        child: Icon(
                          Icons.verified,
                          color: Colors.white,
                          size: isSmallScreen ? 24 : 28,
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              SizedBox(height: isSmallScreen ? 20 : 24),

              // Brands Grid
              AnimatedSection(
                delay: const Duration(milliseconds: 200),
                child: GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: isSmallScreen ? 1 : 2,
                    crossAxisSpacing: 12,
                    mainAxisSpacing: 12,
                    mainAxisExtent: isSmallScreen ? 100 : 120,
                  ),
                  itemCount: brands.length,
                  itemBuilder: (context, index) {
                    return BrandCard(
                      brand: brands[index],
                      index: index,
                    );
                  },
                ),
              ),

              SizedBox(height: isSmallScreen ? 20 : 24),
            ],
          ),
        ),
      ),
    );
  }
}