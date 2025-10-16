import 'package:flutter/material.dart';
import 'package:e_commerce/common/widgets/app_bar.dart';
import 'package:e_commerce/features/shop/screens/home/widgets/animated_section.dart';
import 'package:e_commerce/utils/helpers/helper_functions.dart';
import 'widgets/category_banner.dart';
import 'widgets/category_section.dart';
import 'models/category_data.dart';

class CategoryScreen extends StatefulWidget {
  const CategoryScreen({
    super.key,
    required this.categoryName,
  });

  final String categoryName;

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen>
    with TickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _fadeAnimation;

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
    final isSmallScreen = screenWidth < 400;

    return Scaffold(
      backgroundColor: isDark ? const Color(0xFF121212) : const Color(0xFFF8F9FA),
      appBar: RAppBar(
        title: Text(
          widget.categoryName,
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
          child: Column(
            children: [
              // Category Banner
              AnimatedSection(
                child: CategoryBanner(categoryName: widget.categoryName),
              ),

              SizedBox(height: isSmallScreen ? 16 : 20),

              // Dynamic Category Sections
              ...CategoryData.getCategorySections(widget.categoryName)
                  .entries
                  .map((entry) {
                final index = CategoryData.getCategorySections(widget.categoryName)
                    .keys
                    .toList()
                    .indexOf(entry.key);
                return Column(
                  children: [
                    AnimatedSection(
                      delay: Duration(milliseconds: 200 + (index * 200)),
                      child: CategorySection(
                        title: entry.key,
                        categoryName: widget.categoryName,
                        sectionKey: entry.value,
                      ),
                    ),
                    SizedBox(height: isSmallScreen ? 16 : 20),
                  ],
                );
              }),

              SizedBox(height: isSmallScreen ? 20 : 24),
            ],
          ),
        ),
      ),
    );
  }
}