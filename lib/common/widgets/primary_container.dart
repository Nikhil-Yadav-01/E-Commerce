import 'package:e_commerce/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';

import 'circular_container.dart';
import 'curved_edges_widget.dart';
import '../../utils/constants/colors.dart';

class RPrimaryContainer extends StatelessWidget {
  const RPrimaryContainer({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    final bool isDark = RHelperFunctions.isDarkMode(context);

    return RCurvedEdgesWidget(
      child: Container(
        color: isDark ? RColors.primaryDark : RColors.primaryLight,
        padding: const EdgeInsets.all(0),
        child: Stack(
          children: [
            Positioned(
              top: -150,
              right: -250,
              child: RoundedContainer(
                width: 400,
                height: 400,
                radius: 400,
                backgroundColor: RColors.white.withValues(alpha: 0.1),
              ),
            ),
            Positioned(
              top: 100,
              right: -300,
              child: RoundedContainer(
                width: 400,
                height: 400,
                radius: 400,
                backgroundColor: RColors.white.withValues(alpha: 0.1),
              ),
            ),
            child,
          ],
        ),
      ),
    );
  }
}