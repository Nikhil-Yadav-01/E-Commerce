import 'package:flutter/material.dart';
import 'package:e_commerce/utils/helpers/helper_functions.dart';

class PriceRangeSlider extends StatelessWidget {
  const PriceRangeSlider({
    super.key,
    required this.values,
    required this.onChanged,
  });

  final RangeValues values;
  final ValueChanged<RangeValues> onChanged;

  @override
  Widget build(BuildContext context) {
    final isDark = RHelperFunctions.isDarkMode(context);
    final screenWidth = MediaQuery.of(context).size.width;
    final isSmallScreen = screenWidth < 400;

    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              padding: EdgeInsets.symmetric(
                horizontal: isSmallScreen ? 8 : 12,
                vertical: isSmallScreen ? 6 : 8,
              ),
              decoration: BoxDecoration(
                color: isDark
                    ? const Color(0xFF3A3A3A)
                    : const Color(0xFFF0F0F0),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Text(
                '\$${values.start.round()}',
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: isSmallScreen ? 12 : 14,
                  color: isDark ? Colors.white : const Color(0xFF2D3748),
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(
                horizontal: isSmallScreen ? 8 : 12,
                vertical: isSmallScreen ? 6 : 8,
              ),
              decoration: BoxDecoration(
                color: isDark
                    ? const Color(0xFF3A3A3A)
                    : const Color(0xFFF0F0F0),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Text(
                '\$${values.end.round()}',
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: isSmallScreen ? 12 : 14,
                  color: isDark ? Colors.white : const Color(0xFF2D3748),
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 16),
        SliderTheme(
          data: SliderTheme.of(context).copyWith(
            activeTrackColor: isDark
                ? const Color(0xFF4A90E2)
                : const Color(0xFF6C63FF),
            inactiveTrackColor: isDark
                ? const Color(0xFF3A3A3A)
                : const Color(0xFFE0E0E0),
            thumbColor: isDark
                ? const Color(0xFF4A90E2)
                : const Color(0xFF6C63FF),
            overlayColor: (isDark
                    ? const Color(0xFF4A90E2)
                    : const Color(0xFF6C63FF))
                .withValues(alpha: 0.2),
            thumbShape: RoundSliderThumbShape(
              enabledThumbRadius: isSmallScreen ? 10 : 12,
            ),
            overlayShape: RoundSliderOverlayShape(
              overlayRadius: isSmallScreen ? 20 : 24,
            ),
          ),
          child: RangeSlider(
            values: values,
            min: 0,
            max: 1000,
            divisions: 100,
            onChanged: onChanged,
          ),
        ),
      ],
    );
  }
}