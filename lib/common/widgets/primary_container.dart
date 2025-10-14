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
      isDark: isDark,
      child: Container(
        color: isDark ? RColors.primaryDark : RColors.primaryLight,
        child: SizedBox(
          child: Stack(
            children: [
              Positioned(
                top: -150,
                right: -250,
                child: RoundedContainer(
                  backgroundColor: RColors.white.withValues(alpha: 0.1),
                ),
              ),
              Positioned(
                top: 100,
                right: -300,
                child: RoundedContainer(
                  backgroundColor: RColors.white.withValues(alpha: 0.1),
                ),
              ),
              child,
            ],
          ),
        ),
      ),
    );
  }
}