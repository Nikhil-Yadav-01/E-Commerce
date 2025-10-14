import 'package:e_commerce/utils/constants/colors.dart';
import 'package:flutter/cupertino.dart';

class RShadowStyle {
  static verticalProductShadow() => BoxShadow(
    color: RColors.shadowColor,
    blurRadius: 50,
    spreadRadius: 7,
    offset: Offset(0, 2),
  );

  static horizontalProductShadow() => BoxShadow(
    color: RColors.shadowColor,
    blurRadius: 50,
    spreadRadius: 7,
    offset: Offset(2, 0),
  );
}