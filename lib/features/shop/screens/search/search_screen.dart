import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:e_commerce/common/widgets/app_bar.dart';
import 'package:e_commerce/utils/helpers/helper_functions.dart';
import 'package:e_commerce/features/shop/screens/filter/filter.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({
    super.key,
    this.initialQuery = '',
  });

  final String initialQuery;

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  late TextEditingController _searchController;
  Map<String, dynamic>? _appliedFilters;

  @override
  void initState() {
    super.initState();
    _searchController = TextEditingController(text: widget.initialQuery);
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  void _openFilter() async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => const FilterScreen()),
    );
    if (result != null) {
      setState(() => _appliedFilters = result);
    }
  }

  @override
  Widget build(BuildContext context) {
    final isDark = RHelperFunctions.isDarkMode(context);
    final screenWidth = MediaQuery.of(context).size.width;
    final isSmallScreen = screenWidth < 400;

    return Scaffold(
      backgroundColor: isDark ? const Color(0xFF121212) : const Color(0xFFF8F9FA),
      appBar: RAppBar(
        title: Container(
          height: 40,
          decoration: BoxDecoration(
            color: isDark ? const Color(0xFF2A2A2A) : Colors.white,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(
              color: isDark
                  ? Colors.white.withValues(alpha: 0.1)
                  : Colors.grey.withValues(alpha: 0.2),
            ),
          ),
          child: TextField(
            controller: _searchController,
            autofocus: true,
            decoration: InputDecoration(
              hintText: 'Search products, brands...',
              hintStyle: TextStyle(
                color: isDark ? Colors.white54 : Colors.black54,
                fontSize: isSmallScreen ? 14 : 16,
              ),
              prefixIcon: Icon(
                Iconsax.search_normal,
                color: isDark ? Colors.white54 : Colors.black54,
                size: isSmallScreen ? 18 : 20,
              ),
              border: InputBorder.none,
              contentPadding: const EdgeInsets.symmetric(vertical: 8),
            ),
            style: TextStyle(
              color: isDark ? Colors.white : Colors.black87,
              fontSize: isSmallScreen ? 14 : 16,
            ),
          ),
        ),
        showBackArrow: true,
        actions: [
          IconButton(
            onPressed: _openFilter,
            icon: Stack(
              children: [
                Icon(
                  Iconsax.filter,
                  color: isDark ? Colors.white : Colors.black87,
                  size: isSmallScreen ? 20 : 24,
                ),
                if (_appliedFilters != null)
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
            ),
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(isSmallScreen ? 12 : 16),
        child: Column(
          children: [
            Expanded(
              child: Center(
                child: Text(
                  'Start typing to search...',
                  style: TextStyle(
                    color: isDark ? Colors.white54 : Colors.black54,
                    fontSize: isSmallScreen ? 14 : 16,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}