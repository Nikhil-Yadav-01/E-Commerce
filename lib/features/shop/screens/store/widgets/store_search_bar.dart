import 'package:flutter/material.dart';

import '../../../../../common/widgets/search_bar.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/helpers/helper_functions.dart';

class StoreSearchBar extends StatelessWidget {
  const StoreSearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    final bool isDark = RHelperFunctions.isDarkMode(context);

    return Container(
      color: isDark ? RColors.backgroundDark : RColors.backgroundLight,
      padding: const EdgeInsets.all(RSizes.defaultSpace),
      child: const RSearchBar(text: 'Search in store...'),
    );
  }
}
