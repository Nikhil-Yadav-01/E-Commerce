import 'package:flutter/material.dart';
import '../../utils/constants/colors.dart';
import '../../utils/constants/sizes.dart';
import '../../utils/helpers/helper_functions.dart';

class RRoundedIcon extends StatelessWidget {
  const RRoundedIcon({
    super.key,
    required this.icon,
    this.onPressed,
    this.size,
    this.width,
    this.height,
    this.color,
    this.backgroundColor,
    this.shadow = true,
    this.padding,
    this.gradient,
  });

  final IconData icon;
  final VoidCallback? onPressed;
  final double? size;
  final double? width;
  final double? height;
  final Color? color;
  final Color? backgroundColor;
  final bool shadow;
  final EdgeInsets? padding;
  final Gradient? gradient;

  @override
  Widget build(BuildContext context) {
    final bool isDark = RHelperFunctions.isDarkMode(context);
    final double w = width ?? 44;
    final double h = height ?? 44;
    final double iconSize = size ?? RSizes.iconSizeM;

    // Background color defaults
    final Color bgColor = backgroundColor ??
        (isDark ? RColors.surfaceDark : RColors.surfaceLight);

    // Icon color defaults — ensure visibility
    final Color iconColor = color ??
        (isDark ? RColors.onBackgroundDark : RColors.onBackgroundLight);

    // Slightly lifted look
    final List<BoxShadow> boxShadow = shadow
        ? [
      BoxShadow(
        color: RColors.shadowColor,
        blurRadius: 6,
        offset: const Offset(0, 3),
      ),
    ]
        : [];

    return Material(
      color: Colors.transparent,
      shape: const CircleBorder(),
      clipBehavior: Clip.antiAlias, // ensures ripple stays circular
      child: InkWell(
        onTap: onPressed,
        splashColor: (isDark ? RColors.white : RColors.primaryLight)
            .withOpacity(0.2),
        child: Ink(
          width: w,
          height: h,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            gradient: gradient,
            color: gradient == null ? bgColor : null,
            boxShadow: boxShadow,
          ),
          child: Center(
            child: Icon(
              icon,
              size: iconSize,
              color: iconColor,
            ),
          ),
        ),
      ),
    );
  }
}
