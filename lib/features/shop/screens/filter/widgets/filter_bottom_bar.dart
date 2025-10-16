import 'package:flutter/material.dart';
import 'package:e_commerce/utils/helpers/helper_functions.dart';

class FilterBottomBar extends StatelessWidget {
  const FilterBottomBar({
    super.key,
    required this.onApply,
    required this.onClear,
    required this.activeFiltersCount,
  });

  final VoidCallback onApply;
  final VoidCallback onClear;
  final int activeFiltersCount;

  @override
  Widget build(BuildContext context) {
    final isDark = RHelperFunctions.isDarkMode(context);
    final screenWidth = MediaQuery.of(context).size.width;
    final isSmallScreen = screenWidth < 400;

    return Container(
      padding: EdgeInsets.all(isSmallScreen ? 12 : 16),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: isDark
              ? [const Color(0xFF2A2A2A), const Color(0xFF1E1E1E)]
              : [Colors.white, const Color(0xFFF8F9FA)],
        ),
        boxShadow: [
          BoxShadow(
            color: isDark
                ? Colors.black.withValues(alpha: 0.3)
                : Colors.grey.withValues(alpha: 0.1),
            blurRadius: 8,
            offset: const Offset(0, -2),
          ),
        ],
        border: Border(
          top: BorderSide(
            color: isDark
                ? Colors.white.withValues(alpha: 0.1)
                : Colors.grey.withValues(alpha: 0.2),
          ),
        ),
      ),
      child: SafeArea(
        child: Row(
          children: [
            if (activeFiltersCount > 0)
              Expanded(
                flex: 1,
                child: OutlinedButton(
                  onPressed: onClear,
                  style: OutlinedButton.styleFrom(
                    side: BorderSide(
                      color: isDark
                          ? const Color(0xFF4A90E2)
                          : const Color(0xFF6C63FF),
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    padding: EdgeInsets.symmetric(
                      vertical: isSmallScreen ? 12 : 16,
                    ),
                  ),
                  child: Text(
                    'Clear',
                    style: TextStyle(
                      color: isDark
                          ? const Color(0xFF4A90E2)
                          : const Color(0xFF6C63FF),
                      fontWeight: FontWeight.w600,
                      fontSize: isSmallScreen ? 14 : 16,
                    ),
                  ),
                ),
              ),
            if (activeFiltersCount > 0) SizedBox(width: isSmallScreen ? 8 : 12),
            Expanded(
              flex: activeFiltersCount > 0 ? 2 : 1,
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: isDark
                        ? [const Color(0xFF4A90E2), const Color(0xFF357ABD)]
                        : [const Color(0xFF6C63FF), const Color(0xFF5A52D5)],
                  ),
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      color: (isDark ? const Color(0xFF4A90E2) : const Color(0xFF6C63FF))
                          .withValues(alpha: 0.3),
                      blurRadius: 8,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                child: ElevatedButton(
                  onPressed: onApply,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.transparent,
                    shadowColor: Colors.transparent,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    padding: EdgeInsets.symmetric(
                      vertical: isSmallScreen ? 12 : 16,
                    ),
                  ),
                  child: Text(
                    activeFiltersCount > 0
                        ? 'Apply ($activeFiltersCount)'
                        : 'Apply Filters',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                      fontSize: isSmallScreen ? 14 : 16,
                    ),
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