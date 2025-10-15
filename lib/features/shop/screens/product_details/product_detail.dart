import 'package:e_commerce/common/widgets/horizontal_divider.dart';
import 'package:e_commerce/features/shop/screens/home/widgets/heading_section.dart';
import 'package:e_commerce/features/shop/screens/product_reviews/product_reviews.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:readmore/readmore.dart';

import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/images.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../../utils/helpers/helper_functions.dart';
import 'widgets/bottom_add_to_cart.dart';
import 'widgets/product_attributes.dart';
import 'widgets/product_image_slider.dart';
import 'widgets/product_meta_data.dart';

class ProductDetail extends StatefulWidget {
  const ProductDetail({super.key});

  @override
  State<ProductDetail> createState() => _ProductDetailState();
}

class _ProductDetailState extends State<ProductDetail> {
  int _selectedImageIndex = 0;
  int _selectedColorIndex = 0;
  int _selectedSizeIndex = 2;
  int _quantity = 0;

  final List<String> _images = [
    RImages.productImage70,
    RImages.productImage8,
    RImages.productImage9,
    RImages.productImage1,
    RImages.productImage7,
    RImages.productImage8,
    RImages.productImage9,
    RImages.productImage1,
  ];
  final List<String> _colorNames = ['Green', 'Red', 'Blue', 'Black'];
  final List<String> _sizes = ['EU 30', 'EU 32', 'EU 34'];

  @override
  Widget build(BuildContext context) {
    final isDark = RHelperFunctions.isDarkMode(context);

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ProductImageSlider(
              images: _images,
              selectedIndex: _selectedImageIndex,
              onImageTap: (index) => setState(() => _selectedImageIndex = index),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: RSizes.defaultSpace),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const ProductMetaData(),
                  const SizedBox(height: RSizes.spaceBtwItems),

                  ProductAttributes(
                    colors: _colorNames.map((color) => RHelperFunctions.getColor(color)).toList(),
                    sizes: _sizes,
                    selectedColorIndex: _selectedColorIndex,
                    selectedSizeIndex: _selectedSizeIndex,
                    onColorTap: (index) => setState(() => _selectedColorIndex = index),
                    onSizeTap: (index) => setState(() => _selectedSizeIndex = index),
                  ),
                  const SizedBox(height: RSizes.spaceBtwSections),

                  SizedBox(
                    width: double.infinity,
                    height: 50,
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: RColors.primaryLight,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(RSizes.cardRadiusMd)),
                      ),
                      child: const Text('Checkout', style: TextStyle(color: Colors.white, fontSize: 16)),
                    ),
                  ),
                  const SizedBox(height: RSizes.spaceBtwSections,),

                  RSectionHeading(title: 'Description'),
                  const SizedBox(height: RSizes.sm),
                  ReadMoreText(
                    'Green Nike sports shoe',
                    trimLines: 2,
                    trimMode: TrimMode.Line,
                    trimCollapsedText: 'Show more',
                    trimExpandedText: 'Show less',
                    moreStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.w800),
                    lessStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.w800),
                  ),
                  const HorizontalDivider(),

                  GestureDetector(
                    onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const ProductReviews())),
                    child: Container(
                      padding: const EdgeInsets.all(RSizes.lg),
                      decoration: BoxDecoration(
                        color: isDark ? RColors.cardDark : RColors.cardLight,
                        borderRadius: BorderRadius.circular(RSizes.cardRadiusMd),
                        border: Border.all(color: isDark ? RColors.borderDark : RColors.borderLight),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Reviews (199)', style: Theme.of(context).textTheme.titleMedium),
                          Icon(Iconsax.arrow_right_3, color: isDark ? RColors.onMutedDark : RColors.onMutedLight),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: RSizes.spaceBtwSections),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomAddToCart(
        quantity: _quantity,
        onIncrement: () => setState(() => _quantity++),
        onDecrement: () => setState(() => _quantity = _quantity > 0 ? _quantity - 1 : 0),
      ),
    );
  }
}
