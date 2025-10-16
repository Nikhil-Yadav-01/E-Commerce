import 'package:flutter/material.dart';
import '../product_card_components/wishlist_button.dart';
import '../product_card_components/sale_tag.dart';
import '../product_card_components/thumbnail_image.dart';

class ProductImageSection extends StatelessWidget {
  const ProductImageSection({
    super.key,
    required this.isDark,
    required this.isFavorite,
    required this.onFavoriteToggle,
  });

  final bool isDark;
  final bool isFavorite;
  final VoidCallback onFavoriteToggle;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        RThumbnailImage(isDark: isDark),
        const Positioned(
          top: 8,
          left: 8,
          child: OffSaleTag(text: '20% OFF'),
        ),
        Positioned(
          top: 8,
          right: 8,
          child: WishlistButton(
            isFavorite: isFavorite,
            onToggle: onFavoriteToggle,
          ),
        ),
      ],
    );
  }
}