import 'package:flutter/material.dart';

import '../../../../../common/widgets/app_bar.dart';
import '../../../../../common/widgets/cart_menu_icon.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/texts.dart';
import '../../../../../utils/helpers/helper_functions.dart';

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({super.key, required this.name});

  final String name;

  @override
  Widget build(BuildContext context) {
    bool isDark = RHelperFunctions.isDarkMode(context);

    return RAppBar(
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            RTexts.homeAppbarTitle,
            style: Theme.of(context).textTheme.labelMedium?.apply(
              color: isDark ? RColors.onSecondaryDark: RColors.onPrimaryLight,
            ),
          ),
          Text(
            name,
            style: Theme.of(context).textTheme.headlineMedium?.apply(
              color: isDark ? RColors.onSecondaryDark: RColors.onPrimaryLight,
            ),
          ),
        ],
      ),
      actions: [
        RCartCounterIcon(iconColor: Color(0xFFFFFFFF))
      ],
    );
  }
}
