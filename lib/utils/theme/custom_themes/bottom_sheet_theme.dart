import 'package:flutter/material.dart';

class RBottomSheetTheme {
  RBottomSheetTheme._();

  static final BottomSheetThemeData lightBottomSheetTheme = BottomSheetThemeData(
    showDragHandle: true,
    backgroundColor: Colors.white,
    modalBackgroundColor: Colors.white,
    surfaceTintColor: Colors.white,
    dragHandleColor: Colors.blue,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(24.0),
    ),
    clipBehavior: Clip.antiAlias,
  );

  static final BottomSheetThemeData darkBottomSheetTheme = BottomSheetThemeData(
    showDragHandle: true,
    backgroundColor: const Color(0xFF1F1F1F),
    modalBackgroundColor: const Color(0xFF1F1F1F),
    surfaceTintColor: const Color(0xFF1F1F1F),
    dragHandleColor: Colors.white70,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(24.0),
    ),
    clipBehavior: Clip.antiAlias,
  );
}
