import 'package:flutter/material.dart';
import 'package:e_commerce/common/widgets/app_bar.dart';
import 'package:e_commerce/common/widgets/product_card_vertical.dart';
import 'package:e_commerce/common/widgets/search_bar.dart';
import 'package:e_commerce/features/shop/screens/product_details/product_detail.dart';
import 'package:e_commerce/utils/helpers/helper_functions.dart';

class BrandScreen extends StatefulWidget {
  const BrandScreen({
    super.key,
    required this.brandName,
    required this.brandBannerImage,
  });

  final String brandName;
  final String brandBannerImage;

  @override
  State<BrandScreen> createState() => _BrandScreenState();
}

class _BrandScreenState extends State<BrandScreen>
    with TickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _fadeAnimation;
  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 600),
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
    final isSmallScreen = screenWidth < 400;

    return Scaffold(
      backgroundColor: isDark ? const Color(0xFF121212) : const Color(0xFFF8F9FA),
      appBar: RAppBar(
        title: Text(
          widget.brandName,
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
        child: Column(
          children: [
            // Search Bar with Filter
            Padding(
              padding: EdgeInsets.all(isSmallScreen ? 12 : 16),
              child: RSearchBar(
                text: 'Search ${widget.brandName} products...',
                onFiltersChanged: (filters) {
                  // Handle filter changes here if needed
                },
              ),
            ),

            // Products Grid
            Expanded(
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                padding: EdgeInsets.all(isSmallScreen ? 12 : 16),
                child: Column(
                  children: [
                    // Brand Banner Image
                    Container(
                      height: isSmallScreen ? 120 : 150,
                      margin: EdgeInsets.only(bottom: isSmallScreen ? 16 : 20),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        boxShadow: [
                          BoxShadow(
                            color: isDark
                                ? Colors.black.withValues(alpha: 0.3)
                                : Colors.grey.withValues(alpha: 0.2),
                            blurRadius: 8,
                            offset: const Offset(0, 2),
                          ),
                        ],
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: Image.asset(
                          widget.brandBannerImage,
                          width: double.infinity,
                          fit: BoxFit.cover,
                          errorBuilder: (context, error, stackTrace) => Container(
                            color: isDark ? const Color(0xFF2A2A2A) : const Color(0xFFF0F0F0),
                            child: Icon(
                              Icons.image_not_supported,
                              color: isDark ? Colors.white54 : Colors.black54,
                              size: isSmallScreen ? 40 : 48,
                            ),
                          ),
                        ),
                      ),
                    ),
                    
                    // Products Grid
                    GridView.builder(
                  itemCount: 24,
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
                      MaterialPageRoute(builder: (_) => const ProductDetail()),
                    ),
                  ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}