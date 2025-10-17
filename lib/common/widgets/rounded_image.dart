import 'package:e_commerce/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';

import '../../utils/constants/colors.dart';
import '../../utils/constants/sizes.dart';

class RoundedImage extends StatelessWidget {
  const RoundedImage({
    super.key,
    this.border,
    this.onPressed,
    this.padding,
    this.width = 150,
    this.height = 150,
    this.applyImageRadius = false,
    this.backgroundColor,
    this.overlayColor,
    this.borderRadius = RSizes.radiusMedium,
    this.fit = BoxFit.contain,
    required this.imagePath,
    this.isNetworkImage = false,
  });

  final double? width, height;
  final String imagePath;
  final bool applyImageRadius;
  final BoxBorder? border;
  final Color? backgroundColor;
  final Color? overlayColor;
  final double borderRadius;
  final BoxFit? fit;
  final EdgeInsetsGeometry? padding;
  final bool isNetworkImage;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    final bool isDark = RHelperFunctions.isDarkMode(context);

    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: width,
        height: height,
        padding: padding,
        decoration: BoxDecoration(
          color:
              backgroundColor ??
              (isDark ? RColors.surfaceDark : RColors.surfaceLight),
          border: border,
          borderRadius: BorderRadius.circular(borderRadius),
        ),
        child: ClipRRect(
          borderRadius: applyImageRadius
              ? BorderRadius.circular(RSizes.md)
              : BorderRadius.zero,
          child: Image(
            fit: fit,
            image: isNetworkImage
                ? NetworkImage(imagePath)
                : AssetImage(imagePath) as ImageProvider,
            color: overlayColor,
          ),
        ),
      ),
    );
  }
}
