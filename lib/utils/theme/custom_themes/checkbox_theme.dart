import 'package:flutter/material.dart';

class RCheckboxTheme {
  RCheckboxTheme._();

  static final CheckboxThemeData lightCheckboxTheme = CheckboxThemeData(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(6.0),
    ),
    side: const BorderSide(
      color: Colors.blue,
      width: 1.5,
    ),
    checkColor: WidgetStateProperty.resolveWith<Color?>(
          (Set<WidgetState> states) {
        return Colors.white;
      },
    ),
    fillColor: WidgetStateProperty.resolveWith<Color?>(
          (Set<WidgetState> states) {
        if (states.contains(WidgetState.disabled)) {
          return Colors.grey.shade400;
        }
        if (states.contains(WidgetState.selected)) {
          return Colors.blue;
        }
        return Colors.white;
      },
    ),
    overlayColor: WidgetStateProperty.resolveWith<Color?>(
          (Set<WidgetState> states) {
        if (states.contains(WidgetState.pressed) ||
            states.contains(WidgetState.hovered)) {
          return Colors.blue.withValues(alpha: 0.1);
        }
        return null;
      },
    ),
  );

  static final CheckboxThemeData darkCheckboxTheme = CheckboxThemeData(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(6.0),
    ),
    side: const BorderSide(
      color: Colors.blueAccent,
      width: 1.5,
    ),
    checkColor: WidgetStateProperty.resolveWith<Color?>(
          (Set<WidgetState> states) {
        return Colors.black;
      },
    ),
    fillColor: WidgetStateProperty.resolveWith<Color?>(
          (Set<WidgetState> states) {
        if (states.contains(WidgetState.disabled)) {
          return Colors.white24;
        }
        if (states.contains(WidgetState.selected)) {
          return Colors.blueAccent;
        }
        return Colors.transparent;
      },
    ),
    overlayColor: WidgetStateProperty.resolveWith<Color?>(
          (Set<WidgetState> states) {
        if (states.contains(WidgetState.pressed) ||
            states.contains(WidgetState.hovered)) {
          return Colors.blueAccent.withValues(alpha: 0.15);
        }
        return null;
      },
    ),
  );
}
