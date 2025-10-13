import 'package:flutter/material.dart';

class RColors {
  RColors._();

  /// Brand identity colors
  static const Color primary = Color(0xFF0057FF);
  static const Color secondary = Color(0xFFFF6B00);
  static const Color tertiary = Color(0xFF8F00FF);
  static const Color accent = Color(0xFFFFC13D);
  static const Color brandHighlight = Color(0xFF00C6FF);

  /// Functional feedback colors
  static const Color success = Color(0xFF19C463);
  static const Color warning = Color(0xFFFFAA2C);
  static const Color error = Color(0xFFFF4C61);
  static const Color info = Color(0xFF2EB8FF);

  /// Neutral foundations
  static const Color neutral = Color(0xFF1E1E1E);
  static const Color neutralVariant = Color(0xFF616161);
  static const Color borderNeutralLight = Color(0xFFE0E6FF);
  static const Color borderNeutralDark = Color(0xFF303854);

  /// Light theme surfaces
  static const Color backgroundLight = Color(0xFFF8FAFF);
  static const Color surfaceLight = Color(0xFFFFFFFF);
  static const Color cardLight = Color(0xFFFFFFFF);
  static const Color dividerLight = Color(0xFFE8ECFF);
  static const Color disabledLight = Color(0xFFB6C3E0);

  /// Dark theme surfaces
  static const Color backgroundDark = Color(0xFF0F111A);
  static const Color surfaceDark = Color(0xFF161A27);
  static const Color cardDark = Color(0xFF1F2435);
  static const Color dividerDark = Color(0xFF32384C);
  static const Color disabledDark = Color(0xFF3B4257);

  /// Text colors
  static const Color textPrimaryLight = Color(0xFF101828);
  static const Color textSecondaryLight = Color(0xFF475467);
  static const Color textMutedLight = Color(0xFF8A94B0);
  static const Color textPrimaryDark = Color(0xFFF5F7FF);
  static const Color textSecondaryDark = Color(0xFFB8C1FF);
  static const Color textMutedDark = Color(0xFF7D86A8);
  static const Color onPrimary = Color(0xFFFFFFFF);
  static const Color onSecondary = Color(0xFF1B1F2F);
  static const Color onAccent = Color(0xFF1F2435);

  /// Utility and state colors
  static const Color focusColor = Color(0xFF00C6FF);
  static const Color hoverColorLight = Color(0xFFE8F1FF);
  static const Color hoverColorDark = Color(0xFF232A3F);
  static const Color rippleColorLight = Color(0x330057FF);
  static const Color rippleColorDark = Color(0x33FFFFFF);
  static const Color shadowColor = Color(0x14000000);

  /// Themed gradients
  static const LinearGradient primaryGradient = LinearGradient(
    colors: <Color>[
      Color(0xFF0057FF),
      Color(0xFF00C6FF),
    ],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static const LinearGradient accentGradient = LinearGradient(
    colors: <Color>[
      Color(0xFFFF6B00),
      Color(0xFFFFC13D),
    ],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  );

  static const LinearGradient successGradient = LinearGradient(
    colors: <Color>[
      Color(0xFF19C463),
      Color(0xFF12E2A3),
    ],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static const LinearGradient dramaticBackdropGradient = LinearGradient(
    colors: <Color>[
      Color(0x330057FF),
      Color(0x338F00FF),
      Color(0x3300C6FF),
    ],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  );

  /// Reusable palette collections
  static const List<Color> brandPalette = <Color>[
    Color(0xFF0057FF),
    Color(0xFF00C6FF),
    Color(0xFFFF6B00),
    Color(0xFFFFC13D),
    Color(0xFF8F00FF),
  ];

  static const List<Color> chartPalette = <Color>[
    Color(0xFF0057FF),
    Color(0xFF19C463),
    Color(0xFFFF6B00),
    Color(0xFF2EB8FF),
    Color(0xFFFF4C61),
    Color(0xFF8F00FF),
  ];

  static const Color white = Color(0xFFFFFFFF);
}