import 'package:e_commerce/utils/constants/colors.dart';
import 'package:e_commerce/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';

import '../../utils/constants/sizes.dart';

class RRoundedIcon extends StatelessWidget {
  const RRoundedIcon({
    super.key,
    this.width,
    this.height,
    this.size,
    required this.icon,
    this.color,
    this.backgroundColor,
    this.onPressed,
  });

  final double? width, height, size;
  final IconData icon;
  final Color? color;
  final Color? backgroundColor;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    bool isDark = RHelperFunctions.isDarkMode(context);
    return Container(
      width: width ?? 50,
      height: height ?? 50,
      decoration: BoxDecoration(
        color: backgroundColor ?? (isDark ? RColors.surfaceDark : RColors.surfaceLight),
        borderRadius: BorderRadius.circular(50),
      ),
      child: IconButton(
        onPressed: onPressed,
        icon: Icon(
          icon,
          size: size ?? RSizes.iconSizeS,
          color: color ?? Colors.white,
        ),
      ),
    );
  }
}
