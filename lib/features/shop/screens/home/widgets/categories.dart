import 'package:flutter/material.dart';

import '../../../../../common/widgets/vertical_image_text.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/images.dart';
import '../../../../../utils/helpers/helper_functions.dart';
import '../../../../../utils/device/device_utility.dart';
import '../../category/category_screen.dart';

class Categories extends StatelessWidget {
  const Categories({super.key});

  @override
  Widget build(BuildContext context) {
    bool isDark = RHelperFunctions.isDarkMode(context);

    return SizedBox(
      height: RDeviceUtils.getCategoryHeight(context),
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: 8,
        scrollDirection: Axis.horizontal,
        itemBuilder: (_, index) {
          final categories = [
            {'name': 'Cosmetics', 'image': RImages.cosmeticsIcon},
            {'name': 'Electronics', 'image': RImages.electronicsIcon},
            {'name': 'Clothing', 'image': RImages.clothIcon},
            {'name': 'Sports', 'image': RImages.sportIcon},
            {'name': 'Furniture', 'image': RImages.furnitureIcon},
            {'name': 'Shoes', 'image': RImages.shoeIcon},
            {'name': 'Jewelry', 'image': RImages.jeweleryIcon},
            {'name': 'Animals', 'image': RImages.animalIcon},
          ];
          
          final category = categories[index % categories.length];
          
          return VerticalImageText(
            image: category['image'] as String,
            title: category['name'] as String,
            backgroundColor: isDark ? RColors.secondaryDark : RColors.secondaryLight,
            textColor: isDark ? RColors.onSecondaryDark : RColors.onSecondaryLight,
            itemSize: RDeviceUtils.getCategoryItemSize(context),
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => CategoryScreen(
                  categoryName: category['name'] as String,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}