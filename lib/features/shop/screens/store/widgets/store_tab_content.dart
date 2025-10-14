import 'package:e_commerce/common/widgets/grid_layout_widget.dart';
import 'package:e_commerce/common/widgets/product_card_vertical.dart';
import 'package:e_commerce/features/shop/screens/home/widgets/heading_section.dart';
import 'package:flutter/material.dart';
import '../../../../../common/widgets/brand_showcase.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/images.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/helpers/helper_functions.dart';

class CategoryTabContent extends StatelessWidget {
  const CategoryTabContent({super.key, required this.tabKey});

  final String tabKey; // unique key per tab (for PageStorage)

  @override
  Widget build(BuildContext context) {
    final bool isDark = RHelperFunctions.isDarkMode(context);

    return ListView(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      children: [
        Padding(
          padding: EdgeInsets.all(RSizes.defaultSpace),
          child: Column(
            children: [
              const SizedBox(
                height: RSizes.spaceBtwSections*3,
              ),
              ..._getBrandTabContent(tabKey),
              SizedBox(height: RSizes.spaceBtwSections),

              // Products Suggestions
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  RSectionHeading(title: "You might also like", onPressed: (){},),
                  TextButton(onPressed: (){}, child: const Text("See All")),
                ],
              ),
              const SizedBox(height: RSizes.spaceBtwItems,),
              GridLayoutWidget(
                itemCount: 4,
                itemBuilder: (context, index) => const ProductCardVertical(),
              ),
              SizedBox(height: RSizes.spaceBtwSections),
            ],
          ),
        )
      ],
    );
    /*Builder(
      builder: (BuildContext innerContext) {
        return Container(
          color: isDark ? RColors.backgroundDark : RColors.backgroundLight,
          child: CustomScrollView(
            key: PageStorageKey('StoreTabContent_$tabKey'),

            // Connect inner scroll with NestedScrollView overlap
            slivers: <Widget>[
              SliverOverlapInjector(
                handle: NestedScrollView.sliverOverlapAbsorberHandleFor(innerContext),
              ),

              // Actual scrollable content
              SliverPadding(
                padding: const EdgeInsets.all(RSizes.defaultSpace),
                sliver: SliverList(
                  delegate: SliverChildListDelegate(
                    _getBrandTabContent(tabKey),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );*/
  }

  /// Builds brand showcase lists per tab
  List<Widget> _getBrandTabContent(String tabKey) {
    switch (tabKey) {
      case 'sports':
        return [
          BrandShowcase(
            brandName: 'Nike',
            brandLogo: RImages.nikeLogo,
            productCount: '256',
            images: [RImages.productImage7, RImages.productImage8, RImages.productImage9],
          ),
          BrandShowcase(
            brandName: 'Adidas',
            brandLogo: RImages.appleLogo,
            productCount: '95',
          ),
        ];

      case 'furniture':
        return [
          BrandShowcase(
            brandName: 'IKEA',
            brandLogo: RImages.appleLogo,
            productCount: '36',
          ),
          BrandShowcase(
            brandName: 'Herman Miller',
            brandLogo: RImages.nikeLogo,
            productCount: '12',
          ),
        ];

      case 'electronics':
        return [
          BrandShowcase(
            brandName: 'Apple',
            brandLogo: RImages.appleLogo,
            productCount: '68',
          ),
          BrandShowcase(
            brandName: 'Samsung',
            brandLogo: RImages.nikeLogo,
            productCount: '45',
          ),
        ];

      case 'clothes':
        return [
          BrandShowcase(
            brandName: 'Zara',
            brandLogo: RImages.zaraLogo,
            productCount: '154',
          ),
          BrandShowcase(
            brandName: 'H&M',
            brandLogo: RImages.appleLogo,
            productCount: '89',
          ),
        ];

      case 'cosmetics':
        return [
          BrandShowcase(
            brandName: 'L\'Oreal',
            brandLogo: RImages.nikeLogo,
            productCount: '78',
          ),
          BrandShowcase(
            brandName: 'Maybelline',
            brandLogo: RImages.appleLogo,
            productCount: '52',
          ),
        ];

      default:
        return const [SizedBox.shrink()];
    }
  }
}
