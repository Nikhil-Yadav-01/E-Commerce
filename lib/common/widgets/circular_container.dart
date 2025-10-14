import 'package:flutter/material.dart';
import '../../utils/constants/colors.dart';

class RoundedContainer extends StatelessWidget {
  const RoundedContainer({
    super.key,
    this.child,
    this.width,
    this.margin,
    this.backgroundColor,
    this.height,
    this.radius = 12,
    this.clip = true,
    this.padding = const EdgeInsets.all(8),
  });

  final double? width;
  final double? height;
  final double radius;
  final EdgeInsets? margin;
  final EdgeInsets padding;
  final Widget? child;
  final Color? backgroundColor; // now optional, can fallback to theme
  final bool clip; // allow optional clipping

  @override
  Widget build(BuildContext context) {
    final Color bgColor = backgroundColor ?? Theme.of(context).cardColor;

    return Container(
      width: width,  // flexible
      height: height, // flexible
      margin: margin,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(radius),
        color: bgColor,
      ),
      clipBehavior: clip ? Clip.hardEdge : Clip.none,
      child: Padding(
        padding: padding,
        child: child,
      ),
    );
  }
}
