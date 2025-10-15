import 'package:e_commerce/features/shop/screens/product_reviews/widgets/overall_product_rating.dart';
import 'package:e_commerce/features/shop/screens/product_reviews/widgets/rating_stars.dart';
import 'package:e_commerce/features/shop/screens/product_reviews/widgets/user_review_card.dart';
import 'package:flutter/material.dart';

import '../../../../common/widgets/app_bar.dart';
import '../../../../utils/constants/sizes.dart';

class ProductReviews extends StatelessWidget {
  const ProductReviews({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: RAppBar(title: Text('Reviews & Ratings'), showBackArrow: true),

      // Body
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(RSizes.defaultSpace),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Ratings and Reviews are verified and from people who use the same type of product you are viewing.',
              ),
              SizedBox(height: RSizes.spaceBtwItems),

              // Overall Product Rating
              OverallProductRating(),
              ProductRatingStars(rating: 3.8),

              Text(
                '12.5k Reviews',
                style: Theme.of(context).textTheme.bodySmall,
              ),
              SizedBox(height: RSizes.spaceBtwSections),

              // User reviews list
              UserReviewCard(),
              UserReviewCard(),
              UserReviewCard(),
              UserReviewCard(),

            ],
          ),
        ),
      ),
    );
  }
}
