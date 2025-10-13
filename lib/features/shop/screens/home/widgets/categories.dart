import 'package:flutter/material.dart';

import '../../../../../common/widgets/vertical_image_text.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/images.dart';
import '../../../../../utils/helpers/helper_functions.dart';

class Categories extends StatelessWidget {
  const Categories({super.key});

  @override
  Widget build(BuildContext context) {
    bool isDark = RHelperFunctions.isDarkMode(context);

    return SizedBox(
      height: 90,
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: 8,
        scrollDirection: Axis.horizontal,
        itemBuilder: (_, index) {
          return VerticalImageText(
            image: RImages.cosmeticsIcon,
            title: 'Cosmetics',
            backgroundColor: isDark ? RColors.secondaryDark : RColors.secondaryLight,
            textColor: isDark ? RColors.onSecondaryDark : RColors.onSecondaryLight,
            onTap: () {},
          );
        },
      ),
    );
  }
}