import 'package:flutter/material.dart';

import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/helpers/helper_functions.dart';

class StoreTabBar extends StatelessWidget {
  const StoreTabBar({super.key});

  @override
  Widget build(BuildContext context) {
    final bool isDark = RHelperFunctions.isDarkMode(context);
    
    return Container(
      decoration: BoxDecoration(
        color: isDark ? RColors.backgroundDark : RColors.backgroundLight,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(RSizes.cardRadiusLg),
          topRight: Radius.circular(RSizes.cardRadiusLg),
        ),
      ),
      child: TabBar(
        isScrollable: true,
        indicatorColor: RColors.primaryLight,
        labelColor: isDark ? RColors.white : RColors.onPrimaryLight,
        unselectedLabelColor: isDark ? RColors.onMutedDark : RColors.onMutedLight,
        tabs: const [
          Tab(child: Text('Sports')),
          Tab(child: Text('Furniture')),
          Tab(child: Text('Electronics')),
          Tab(child: Text('Clothes')),
          Tab(child: Text('Cosmetics')),
        ],
      ),
    );
  }
}