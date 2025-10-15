import 'package:e_commerce/common/widgets/circular_container.dart';
import 'package:e_commerce/features/shop/screens/product_reviews/widgets/rating_stars.dart';
import 'package:e_commerce/utils/constants/colors.dart';
import 'package:e_commerce/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';

import '../../../../../utils/constants/images.dart';
import '../../../../../utils/constants/sizes.dart';

class UserReviewCard extends StatelessWidget {
  const UserReviewCard({super.key});

  @override
  Widget build(BuildContext context) {
    final bool isDark = RHelperFunctions.isDarkMode(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // User Info and More Button
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                const CircleAvatar(
                  radius: 20,
                  backgroundImage: AssetImage(RImages.user),
                ),
                const SizedBox(width: RSizes.spaceBtwItems),
                Text(
                  'John Doe',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
              ],
            ),
            IconButton(onPressed: () {}, icon: const Icon(Icons.more_vert)),
          ],
        ),
        const SizedBox(height: RSizes.spaceBtwItems),

        // Review Rating and Date
        Row(
          children: [
            const ProductRatingStars(rating: 4), // Assuming this is your custom widget
            const SizedBox(width: RSizes.spaceBtwItems),
            Text(
              '01 Oct, 2025',
              style: Theme.of(context).textTheme.bodySmall,
            ),
          ],
        ),
        const SizedBox(height: RSizes.spaceBtwItems),

        // Review Text
        ReadMoreText(
          'The user experience was top-notch! The product arrived in perfect condition and the delivery was incredibly fast. I highly recommend this seller!',
          trimLines: 2,
          trimMode: TrimMode.Line,
          trimCollapsedText: ' Show more',
          trimExpandedText: ' Show less',
          moreStyle: TextStyle(
            fontWeight: FontWeight.bold,
            color: isDark ? RColors.tertiaryLight : RColors.tertiaryDark,
          ),
          lessStyle: TextStyle(
            fontWeight: FontWeight.bold,
            color: isDark ? RColors.tertiaryLight : RColors.tertiaryDark,
          ),
        ),
        const SizedBox(height: RSizes.spaceBtwItems),

        // Company Review Response
        const CompanyReviewResponse(),

        const SizedBox(height: RSizes.spaceBtwSections), // Add space after the entire card
      ],
    );
  }
}

class CompanyReviewResponse extends StatelessWidget {
  const CompanyReviewResponse({super.key});

  @override
  Widget build(BuildContext context) {
    final bool isDark = RHelperFunctions.isDarkMode(context);

    return RoundedContainer( // Assuming this is your custom widget
      backgroundColor: isDark ? RColors.cardDark : RColors.cardLight,
      child: Padding(
        padding: const EdgeInsets.all(RSizes.md),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'E-Store',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                Text(
                  '02 Oct, 2025',
                  style: Theme.of(context).textTheme.bodyMedium,
                )
              ],
            ),
            const SizedBox(height: RSizes.spaceBtwItems),
            ReadMoreText(
              'Thank you for your feedback! We are delighted to hear that you had a positive experience with the delivery and product quality. We look forward to serving you again.',
              trimLines: 2,
              trimMode: TrimMode.Line,
              trimCollapsedText: ' Show more',
              trimExpandedText: ' Show less',
              moreStyle: TextStyle(
                fontWeight: FontWeight.bold,
                color: isDark ? RColors.tertiaryLight : RColors.tertiaryDark,
              ),
              lessStyle: TextStyle(
                fontWeight: FontWeight.bold,
                color: isDark ? RColors.tertiaryLight : RColors.tertiaryDark,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
