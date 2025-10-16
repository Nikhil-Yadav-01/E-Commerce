import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:e_commerce/common/widgets/app_bar.dart';
import 'package:e_commerce/utils/helpers/helper_functions.dart';
import 'widgets/filter_section.dart';
import 'widgets/price_range_slider.dart';
import 'widgets/rating_filter.dart';
import 'widgets/filter_chip_group.dart';
import 'widgets/filter_bottom_bar.dart';

class FilterScreen extends StatefulWidget {
  const FilterScreen({super.key});

  @override
  State<FilterScreen> createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen>
    with TickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _fadeAnimation;
  
  // Filter States
  RangeValues _priceRange = const RangeValues(50, 500);
  double _rating = 3.0;
  Set<String> _selectedCategories = {};
  Set<String> _selectedBrands = {};
  Set<String> _selectedSizes = {};
  final Set<String> _selectedColors = {};
  String _sortBy = 'popularity';

  // Filter Data
  final List<String> _categories = ['Shoes', 'Clothing', 'Accessories', 'Electronics', 'Sports'];
  final List<String> _brands = ['Nike', 'Adidas', 'Puma', 'Apple', 'Samsung', 'Sony'];
  final List<String> _sizes = ['XS', 'S', 'M', 'L', 'XL', 'XXL'];
  final List<Color> _colors = [Colors.red, Colors.blue, Colors.green, Colors.black, Colors.white, Colors.orange];
  final List<String> _sortOptions = ['Popularity', 'Price: Low to High', 'Price: High to Low', 'Rating', 'Newest'];

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

  void _clearAllFilters() {
    setState(() {
      _priceRange = const RangeValues(50, 500);
      _rating = 3.0;
      _selectedCategories.clear();
      _selectedBrands.clear();
      _selectedSizes.clear();
      _selectedColors.clear();
      _sortBy = 'popularity';
    });
  }

  void _applyFilters() {
    Navigator.pop(context, {
      'priceRange': _priceRange,
      'rating': _rating,
      'categories': _selectedCategories,
      'brands': _selectedBrands,
      'sizes': _selectedSizes,
      'colors': _selectedColors,
      'sortBy': _sortBy,
    });
  }

  int get _activeFiltersCount {
    int count = 0;
    if (_priceRange.start != 50 || _priceRange.end != 500) count++;
    if (_rating > 3.0) count++;
    count += _selectedCategories.length;
    count += _selectedBrands.length;
    count += _selectedSizes.length;
    count += _selectedColors.length;
    if (_sortBy != 'popularity') count++;
    return count;
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
          'Filters',
          style: TextStyle(
            fontSize: isSmallScreen ? 18 : 20,
            fontWeight: FontWeight.w600,
            color: isDark ? Colors.white : Colors.black87,
          ),
        ),
        showBackArrow: true,
        actions: [
          if (_activeFiltersCount > 0)
            TextButton(
              onPressed: _clearAllFilters,
              child: Text(
                'Clear All',
                style: TextStyle(
                  color: isDark ? const Color(0xFF4A90E2) : const Color(0xFF6C63FF),
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
        ],
      ),
      body: FadeTransition(
        opacity: _fadeAnimation,
        child: Column(
          children: [
            if (_activeFiltersCount > 0)
              Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(
                  horizontal: isSmallScreen ? 12 : 16,
                  vertical: 8,
                ),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: isDark
                        ? [const Color(0xFF2A2A2A), const Color(0xFF1E1E1E)]
                        : [const Color(0xFF6C63FF), const Color(0xFF5A52D5)],
                  ),
                ),
                child: Text(
                  '$_activeFiltersCount filter${_activeFiltersCount > 1 ? 's' : ''} applied',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                    fontSize: isSmallScreen ? 12 : 14,
                  ),
                ),
              ),
            Expanded(
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                padding: EdgeInsets.all(isSmallScreen ? 12 : 16),
                child: Column(
                  children: [
                    // Price Range
                    FilterSection(
                      title: 'Price Range',
                      icon: Iconsax.money,
                      child: PriceRangeSlider(
                        values: _priceRange,
                        onChanged: (values) => setState(() => _priceRange = values),
                      ),
                    ),

                    SizedBox(height: isSmallScreen ? 16 : 20),

                    // Rating
                    FilterSection(
                      title: 'Minimum Rating',
                      icon: Iconsax.star1,
                      child: RatingFilter(
                        rating: _rating,
                        onChanged: (rating) => setState(() => _rating = rating),
                      ),
                    ),

                    SizedBox(height: isSmallScreen ? 16 : 20),

                    // Categories
                    FilterSection(
                      title: 'Categories',
                      icon: Iconsax.category,
                      child: FilterChipGroup(
                        items: _categories,
                        selectedItems: _selectedCategories,
                        onSelectionChanged: (selected) => setState(() => _selectedCategories = selected),
                      ),
                    ),

                    SizedBox(height: isSmallScreen ? 16 : 20),

                    // Brands
                    FilterSection(
                      title: 'Brands',
                      icon: Iconsax.tag,
                      child: FilterChipGroup(
                        items: _brands,
                        selectedItems: _selectedBrands,
                        onSelectionChanged: (selected) => setState(() => _selectedBrands = selected),
                      ),
                    ),

                    SizedBox(height: isSmallScreen ? 16 : 20),

                    // Sizes
                    FilterSection(
                      title: 'Sizes',
                      icon: Iconsax.size,
                      child: FilterChipGroup(
                        items: _sizes,
                        selectedItems: _selectedSizes,
                        onSelectionChanged: (selected) => setState(() => _selectedSizes = selected),
                        isSize: true,
                      ),
                    ),

                    SizedBox(height: isSmallScreen ? 16 : 20),

                    // Colors
                    FilterSection(
                      title: 'Colors',
                      icon: Iconsax.colorfilter,
                      child: Wrap(
                        spacing: 12,
                        runSpacing: 12,
                        children: _colors.map((color) {
                          final colorName = _getColorName(color);
                          final isSelected = _selectedColors.contains(colorName);
                          return GestureDetector(
                            onTap: () {
                              setState(() {
                                if (isSelected) {
                                  _selectedColors.remove(colorName);
                                } else {
                                  _selectedColors.add(colorName);
                                }
                              });
                            },
                            child: Container(
                              width: isSmallScreen ? 32 : 36,
                              height: isSmallScreen ? 32 : 36,
                              decoration: BoxDecoration(
                                color: color,
                                shape: BoxShape.circle,
                                border: Border.all(
                                  color: isSelected
                                      ? (isDark ? const Color(0xFF4A90E2) : const Color(0xFF6C63FF))
                                      : Colors.grey.withValues(alpha: 0.3),
                                  width: isSelected ? 3 : 1,
                                ),
                                boxShadow: isSelected
                                    ? [
                                        BoxShadow(
                                          color: (isDark ? const Color(0xFF4A90E2) : const Color(0xFF6C63FF))
                                              .withValues(alpha: 0.3),
                                          blurRadius: 8,
                                          offset: const Offset(0, 2),
                                        ),
                                      ]
                                    : null,
                              ),
                              child: isSelected
                                  ? Icon(
                                      Icons.check,
                                      color: color == Colors.white ? Colors.black : Colors.white,
                                      size: isSmallScreen ? 16 : 18,
                                    )
                                  : null,
                            ),
                          );
                        }).toList(),
                      ),
                    ),

                    SizedBox(height: isSmallScreen ? 16 : 20),

                    // Sort By
                    FilterSection(
                      title: 'Sort By',
                      icon: Iconsax.sort,
                      child: Column(
                        children: _sortOptions.map((option) {
                          final value = option.toLowerCase().replaceAll(' ', '_').replaceAll(':', '');
                          final isSelected = _sortBy == value;
                          return Container(
                            margin: const EdgeInsets.only(bottom: 8),
                            child: InkWell(
                              onTap: () => setState(() => _sortBy = value),
                              borderRadius: BorderRadius.circular(8),
                              child: Container(
                                padding: EdgeInsets.symmetric(
                                  horizontal: isSmallScreen ? 12 : 16,
                                  vertical: isSmallScreen ? 10 : 12,
                                ),
                                decoration: BoxDecoration(
                                  color: isSelected
                                      ? (isDark ? const Color(0xFF4A90E2) : const Color(0xFF6C63FF))
                                          .withValues(alpha: 0.1)
                                      : Colors.transparent,
                                  borderRadius: BorderRadius.circular(8),
                                  border: Border.all(
                                    color: isSelected
                                        ? (isDark ? const Color(0xFF4A90E2) : const Color(0xFF6C63FF))
                                        : Colors.grey.withValues(alpha: 0.2),
                                  ),
                                ),
                                child: Row(
                                  children: [
                                    Icon(
                                      isSelected ? Icons.radio_button_checked : Icons.radio_button_unchecked,
                                      color: isSelected
                                          ? (isDark ? const Color(0xFF4A90E2) : const Color(0xFF6C63FF))
                                          : Colors.grey,
                                      size: isSmallScreen ? 18 : 20,
                                    ),
                                    const SizedBox(width: 12),
                                    Text(
                                      option,
                                      style: TextStyle(
                                        color: isSelected
                                            ? (isDark ? const Color(0xFF4A90E2) : const Color(0xFF6C63FF))
                                            : (isDark ? Colors.white : Colors.black87),
                                        fontWeight: isSelected ? FontWeight.w600 : FontWeight.normal,
                                        fontSize: isSmallScreen ? 13 : 14,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        }).toList(),
                      ),
                    ),

                    SizedBox(height: isSmallScreen ? 80 : 100),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: FilterBottomBar(
        onApply: _applyFilters,
        onClear: _clearAllFilters,
        activeFiltersCount: _activeFiltersCount,
      ),
    );
  }

  String _getColorName(Color color) {
    if (color == Colors.red) return 'Red';
    if (color == Colors.blue) return 'Blue';
    if (color == Colors.green) return 'Green';
    if (color == Colors.black) return 'Black';
    if (color == Colors.white) return 'White';
    if (color == Colors.orange) return 'Orange';
    return 'Unknown';
  }
}