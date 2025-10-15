
import 'package:flutter/material.dart';

import '../../../../../utils/constants/colors.dart';

class CategoriesTabBar extends StatelessWidget {
  const CategoriesTabBar({
    super.key,
    required this.isDark,
  });

  final bool isDark;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: isDark ? RColors.backgroundDark : RColors.backgroundLight,
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