import 'package:e_commerce/utils/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:iconsax/iconsax.dart';

class ProductRatingStars extends StatelessWidget {
  const ProductRatingStars({
    super.key,
    required this.rating,
  });

  final double rating;

  @override
  Widget build(BuildContext context) {
    return RatingBarIndicator(
      rating: rating,
      itemSize: 20.0,
      unratedColor: Colors.grey,
      itemBuilder: (context, index) => const Icon(
        Iconsax.star1,
        color: RColors.primaryLight,
      ),
    );
  }
}