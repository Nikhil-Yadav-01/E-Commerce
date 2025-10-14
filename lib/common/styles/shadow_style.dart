import 'package:e_commerce/utils/constants/colors.dart';
import 'package:flutter/cupertino.dart';

class RShadowStyle {
  static List<BoxShadow> verticalProductShadow() => [
    BoxShadow(
      color: RColors.shadowColor,
      blurRadius: 50,
      spreadRadius: 7,
      offset: const Offset(0, 2),
    )
  ];

  static List<BoxShadow> horizontalProductShadow() => [
    BoxShadow(
      color: RColors.shadowColor,
      blurRadius: 50,
      spreadRadius: 7,
      offset: const Offset(2, 0),
    )
  ];
}