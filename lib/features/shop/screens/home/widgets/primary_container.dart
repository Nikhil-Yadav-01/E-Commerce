import 'package:flutter/material.dart';

import '../../../../../common/widgets/circular_container.dart';
import '../../../../../common/widgets/curved_edges_widget.dart';
import '../../../../../utils/constants/colors.dart';

class HomePrimaryContainer extends StatelessWidget {
  const HomePrimaryContainer({
    super.key,
    required this.isDark,
    required this.child,
  });

  final bool isDark;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return RCurvedEdgesWidget(
      isDark: isDark,
      child: Container(
        color: isDark ? RColors.primaryDark : RColors.primaryLight,
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
              child,
            ],
          ),
        ),
      ),
    );
  }
}