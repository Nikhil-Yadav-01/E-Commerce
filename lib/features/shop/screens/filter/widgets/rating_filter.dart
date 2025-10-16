import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:e_commerce/utils/helpers/helper_functions.dart';

class RatingFilter extends StatelessWidget {
  const RatingFilter({
    super.key,
    required this.rating,
    required this.onChanged,
  });

  final double rating;
  final ValueChanged<double> onChanged;

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
            Row(
              children: List.generate(5, (index) {
                return Icon(
                  index < rating ? Iconsax.star1 : Iconsax.star,
                  color: index < rating
                      ? Colors.amber
                      : Colors.grey.withValues(alpha: 0.3),
                  size: isSmallScreen ? 20 : 24,
                );
              }),
            ),
            Container(
              padding: EdgeInsets.symmetric(
                horizontal: isSmallScreen ? 8 : 12,
                vertical: isSmallScreen ? 4 : 6,
              ),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: isDark
                      ? [const Color(0xFF4A90E2), const Color(0xFF357ABD)]
                      : [const Color(0xFF6C63FF), const Color(0xFF5A52D5)],
                ),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Text(
                '${rating.toStringAsFixed(1)} & above',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                  fontSize: isSmallScreen ? 11 : 12,
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 16),
        SliderTheme(
          data: SliderTheme.of(context).copyWith(
            activeTrackColor: Colors.amber,
            inactiveTrackColor: isDark
                ? const Color(0xFF3A3A3A)
                : const Color(0xFFE0E0E0),
            thumbColor: Colors.amber,
            overlayColor: Colors.amber.withValues(alpha: 0.2),
            thumbShape: RoundSliderThumbShape(
              enabledThumbRadius: isSmallScreen ? 10 : 12,
            ),
            overlayShape: RoundSliderOverlayShape(
              overlayRadius: isSmallScreen ? 20 : 24,
            ),
          ),
          child: Slider(
            value: rating,
            min: 1.0,
            max: 5.0,
            divisions: 8,
            onChanged: onChanged,
          ),
        ),
      ],
    );
  }
}