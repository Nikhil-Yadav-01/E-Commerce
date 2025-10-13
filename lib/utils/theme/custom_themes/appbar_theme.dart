import 'package:flutter/material.dart';

import '../../constants/sizes.dart';

class RAppBarTheme {
  RAppBarTheme._();

  static final AppBarTheme lightAppBarTheme = AppBarTheme(
    elevation: 0,
    centerTitle: false,
    backgroundColor: Colors.transparent,
    surfaceTintColor: Colors.transparent,
    iconTheme: const IconThemeData(
      color: Colors.black,
      size: RSizes.iconSizeM
    ),
    actionsIconTheme: const IconThemeData(
      color: Colors.black,
      size: RSizes.iconSizeM
    ),
    titleTextStyle: const TextStyle(
      fontSize: 18.0,
      fontWeight: FontWeight.w600,
      color: Colors.black,
    ),
  );

  static final AppBarTheme darkAppBarTheme = AppBarTheme(
    elevation: 0,
      centerTitle: false,
      backgroundColor: Colors.transparent,
      surfaceTintColor: Colors.transparent,
      iconTheme: const IconThemeData(
      color: Colors.white,
          size: RSizes.iconSizeM
      ),
      actionsIconTheme: const IconThemeData(
      color: Colors.white,
          size: RSizes.iconSizeM
      ),
    titleTextStyle: const TextStyle(
      fontSize: 18.0,
      fontWeight: FontWeight.w600,
      color: Colors.white,
    ),
  );
}
