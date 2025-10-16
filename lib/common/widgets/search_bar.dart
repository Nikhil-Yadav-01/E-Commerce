import 'package:e_commerce/utils/helpers/helper_functions.dart';
import 'package:e_commerce/features/shop/screens/filter/filter.dart';
import 'package:e_commerce/features/shop/screens/search/search_screen.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class RSearchBar extends StatefulWidget {
  const RSearchBar({
    super.key,
    this.text = 'Search products, brands...',
    this.showFilter = true,
    this.onFiltersChanged,
    this.onSearchTap,
  });

  final String text;
  final bool showFilter;
  final Function(Map<String, dynamic>?)? onFiltersChanged;
  final VoidCallback? onSearchTap;

  @override
  State<RSearchBar> createState() => _RSearchBarState();
}

class _RSearchBarState extends State<RSearchBar> {
  Map<String, dynamic>? _appliedFilters;

  void _openFilter() async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => const FilterScreen()),
    );
    if (result != null) {
      setState(() => _appliedFilters = result);
      widget.onFiltersChanged?.call(result);
    }
  }

  void _openSearch() {
    if (widget.onSearchTap != null) {
      widget.onSearchTap!();
    } else {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (_) => const SearchScreen()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final isDark = RHelperFunctions.isDarkMode(context);
    final screenWidth = MediaQuery.of(context).size.width;
    final isSmallScreen = screenWidth < 400;

    return GestureDetector(
      onTap: _openSearch,
      child: Container(
      margin: EdgeInsets.symmetric(horizontal: isSmallScreen ? 12 : 16),
      padding: EdgeInsets.symmetric(
        horizontal: isSmallScreen ? 12 : 16,
        vertical: isSmallScreen ? 10 : 12,
      ),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: isDark
              ? [const Color(0xFF3A3A3A), const Color(0xFF2A2A2A)]
              : [Colors.white, const Color(0xFFF0F0F0)],
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
      child: Row(
        children: [
          Icon(
            Iconsax.search_normal,
            color: isDark ? Colors.white70 : Colors.black54,
            size: isSmallScreen ? 18 : 20,
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              widget.text,
              style: TextStyle(
                color: isDark ? Colors.white70 : Colors.black54,
                fontSize: isSmallScreen ? 14 : 16,
              ),
            ),
          ),
          if (widget.showFilter)
            GestureDetector(
              onTap: _openFilter,
              child: FilterIcon(
                isDark: isDark,
                isSmallScreen: isSmallScreen,
                hasFilters: _appliedFilters != null,
              ),
            ),
        ],
      ),
      ),
    );
  }
}

class FilterIcon extends StatelessWidget {
  const FilterIcon({
    super.key,
    required this.isDark,
    required this.isSmallScreen,
    this.hasFilters = false,
  });

  final bool isDark;
  final bool isSmallScreen;
  final bool hasFilters;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          padding: const EdgeInsets.all(6),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: isDark
                  ? [const Color(0xFF4A90E2), const Color(0xFF357ABD)]
                  : [const Color(0xFF6C63FF), const Color(0xFF5A52D5)],
            ),
            borderRadius: BorderRadius.circular(6),
          ),
          child: Icon(
            Iconsax.filter,
            color: Colors.white,
            size: isSmallScreen ? 14 : 16,
          ),
        ),
        if (hasFilters)
          Positioned(
            right: 0,
            top: 0,
            child: Container(
              width: 8,
              height: 8,
              decoration: const BoxDecoration(
                color: Colors.red,
                shape: BoxShape.circle,
              ),
            ),
          ),
      ],
    );
  }
}
