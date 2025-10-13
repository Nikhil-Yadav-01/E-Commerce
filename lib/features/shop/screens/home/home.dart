import 'package:e_commerce/common/widgets/app_bar.dart';
import 'package:e_commerce/utils/constants/colors.dart';
import 'package:flutter/material.dart';

import '../../../../common/widgets/cart_menu_icon.dart';
import '../../../../common/widgets/circular_container.dart';
import '../../../../common/widgets/curved_edges_widget.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../../utils/constants/texts.dart';
import '../../../../utils/helpers/helper_functions.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = RHelperFunctions.isDarkMode(context);

    return Scaffold(
      appBar: RAppBar(
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              RTexts.homeAppbarTitle,
              style: Theme.of(context).textTheme.headlineMedium?.apply(color: isDark ? RColors.textPrimaryDark: RColors.textPrimaryLight),
            ),
            Text(
              RTexts.homeAppbarSubTitle,
              style: Theme.of(context).textTheme.labelMedium?.apply(color: isDark ? RColors.textSecondaryDark: RColors.textSecondaryLight),
            ),
          ],
        ),
        actions: [
          RCartCounterIcon(iconColor: Color(0xFFFFFFFF),),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            RCurvedEdgesWidget(
              isDark: isDark,
              child: Container(
                color: RColors.primary,
                padding: const EdgeInsets.all(0),
                child: SizedBox(
                  height: 400,
                  child: Stack(
                    children: [
                      Positioned(
                        top: -150,
                        right: -250,
                        child: RCircularContainer(
                          backgroundColor: RColors.white.withValues(alpha: 0.1),
                        ),
                      ),
                      Positioned(
                        top: 100,
                        right: -300,
                        child: RCircularContainer(
                          backgroundColor: RColors.white.withValues(alpha: 0.1),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(RSizes.defaultSpace),
              child: Column(
                children: [
                  Text('Content below curved section'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}


