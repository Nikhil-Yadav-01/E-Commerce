import 'package:e_commerce/utils/theme/custom_themes/appbar_theme.dart';
import 'package:e_commerce/utils/theme/custom_themes/bottom_sheet_theme.dart';
import 'package:e_commerce/utils/theme/custom_themes/checkbox_theme.dart';
import 'package:e_commerce/utils/theme/custom_themes/chip_theme.dart';
import 'package:e_commerce/utils/theme/custom_themes/elevated_button_theme.dart';
import 'package:e_commerce/utils/theme/custom_themes/text_field_theme.dart';
import 'package:flutter/material.dart';

import 'custom_themes/custom_theme.dart';

class RAppTheme {
  RAppTheme._();

  static final ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    fontFamily: 'Poppins',
    brightness: Brightness.light,
    primaryColor: Colors.blue,
    scaffoldBackgroundColor: Colors.white,
    appBarTheme: RAppBarTheme.lightAppBarTheme,
    bottomSheetTheme: RBottomSheetTheme.lightBottomSheetTheme,
    inputDecorationTheme: RTextFieldTheme.lightInputDecorationTheme,
    chipTheme: RChipTheme.lightChipTheme,
    checkboxTheme: RCheckboxTheme.lightCheckboxTheme,
    textTheme: RTextTheme.lightTextTheme,
    elevatedButtonTheme: RElevatedButtonTheme.lightElevatedButtonTheme,
  );

  static final ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    fontFamily: 'Poppins',
    brightness: Brightness.dark,
    primaryColor: Colors.blue,
    scaffoldBackgroundColor: Colors.black,
    appBarTheme: RAppBarTheme.darkAppBarTheme,
    bottomSheetTheme: RBottomSheetTheme.darkBottomSheetTheme,
    inputDecorationTheme: RTextFieldTheme.darkInputDecorationTheme,
    chipTheme: RChipTheme.darkChipTheme,
    checkboxTheme: RCheckboxTheme.darkCheckboxTheme,
    textTheme: RTextTheme.darkTextTheme,
    elevatedButtonTheme: RElevatedButtonTheme.darkElevatedButtonTheme,
  );
}
