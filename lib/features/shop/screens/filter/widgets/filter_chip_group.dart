import 'package:flutter/material.dart';
import 'package:e_commerce/utils/helpers/helper_functions.dart';

class FilterChipGroup extends StatelessWidget {
  const FilterChipGroup({
    super.key,
    required this.items,
    required this.selectedItems,
    required this.onSelectionChanged,
    this.isSize = false,
  });

  final List<String> items;
  final Set<String> selectedItems;
  final ValueChanged<Set<String>> onSelectionChanged;
  final bool isSize;

  @override
  Widget build(BuildContext context) {
    final isDark = RHelperFunctions.isDarkMode(context);
    final screenWidth = MediaQuery.of(context).size.width;
    final isSmallScreen = screenWidth < 400;

    return Wrap(
      spacing: isSmallScreen ? 8 : 12,
      runSpacing: isSmallScreen ? 8 : 12,
      children: items.map((item) {
        final isSelected = selectedItems.contains(item);
        return GestureDetector(
          onTap: () {
            final newSelection = Set<String>.from(selectedItems);
            if (isSelected) {
              newSelection.remove(item);
            } else {
              newSelection.add(item);
            }
            onSelectionChanged(newSelection);
          },
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            padding: EdgeInsets.symmetric(
              horizontal: isSize ? (isSmallScreen ? 12 : 16) : (isSmallScreen ? 10 : 14),
              vertical: isSmallScreen ? 8 : 10,
            ),
            decoration: BoxDecoration(
              gradient: isSelected
                  ? LinearGradient(
                      colors: isDark
                          ? [const Color(0xFF4A90E2), const Color(0xFF357ABD)]
                          : [const Color(0xFF6C63FF), const Color(0xFF5A52D5)],
                    )
                  : null,
              color: !isSelected
                  ? (isDark ? const Color(0xFF3A3A3A) : const Color(0xFFF0F0F0))
                  : null,
              borderRadius: BorderRadius.circular(isSize ? 8 : 20),
              border: Border.all(
                color: isSelected
                    ? Colors.transparent
                    : (isDark ? Colors.white.withValues(alpha: 0.1) : Colors.grey.withValues(alpha: 0.2)),
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
            child: Text(
              item,
              style: TextStyle(
                color: isSelected
                    ? Colors.white
                    : (isDark ? Colors.white : const Color(0xFF2D3748)),
                fontWeight: isSelected ? FontWeight.w600 : FontWeight.w500,
                fontSize: isSmallScreen ? 12 : 14,
              ),
            ),
          ),
        );
      }).toList(),
    );
  }
}