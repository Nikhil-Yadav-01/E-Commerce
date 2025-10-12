import 'package:flutter/material.dart';

class RChipTheme {
  RChipTheme._();

  static final ChipThemeData lightChipTheme = ChipThemeData(
    backgroundColor: Colors.blue.withValues(alpha: 0.12),
    labelStyle: const TextStyle(
      fontSize: 14.0,
      fontWeight: FontWeight.w500,
      color: Colors.blue,
    ),
    padding: const EdgeInsets.symmetric(
      horizontal: 12.0,
      vertical: 8.0,
    ),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(12.0),
      side: const BorderSide(
        color: Colors.blue,
      ),
    ),
    secondaryLabelStyle: const TextStyle(
      fontSize: 14.0,
      fontWeight: FontWeight.w500,
      color: Colors.blueAccent,
    ),
    secondarySelectedColor: Colors.blue.withValues(alpha: 0.2),
    selectedColor: Colors.blue,
    disabledColor: Colors.grey,
    brightness: Brightness.light,
  );

  static final ChipThemeData darkChipTheme = ChipThemeData(
    backgroundColor: Colors.blueAccent.withValues(alpha: 0.18),
    labelStyle: const TextStyle(
      fontSize: 14.0,
      fontWeight: FontWeight.w500,
      color: Colors.white,
    ),
    padding: const EdgeInsets.symmetric(
      horizontal: 12.0,
      vertical: 8.0,
    ),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(12.0),
      side: const BorderSide(
        color: Colors.blueAccent,
      ),
    ),
    secondaryLabelStyle: const TextStyle(
      fontSize: 14.0,
      fontWeight: FontWeight.w500,
      color: Colors.white70,
    ),
    secondarySelectedColor: Colors.blueAccent.withValues(alpha: 0.25),
    selectedColor: Colors.blueAccent,
    disabledColor: Colors.white24,
    brightness: Brightness.dark,
  );
}
