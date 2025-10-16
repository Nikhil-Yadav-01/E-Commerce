import 'package:flutter/material.dart';

class RColors {
  RColors._();

  /// Brand identity colors
  static const Color primaryLight = Color(0xFF0057FF);
  static const Color secondaryLight = Color(0xFFFF6B00);
  static const Color tertiaryLight = Color(0xFF8F00FF);
  static const Color accentLight = Color(0xFFFFC13D);
  static const Color brandHighlight = Color(0xFF00C6FF);

  static const Color primaryDark = Color(0xFF0038B8);
  static const Color secondaryDark = Color(0xFFB84A00);
  static const Color tertiaryDark = Color(0xFF6200B2);
  static const Color accentDark = Color(0xFFB28629);

  /// Functional feedback colors
  static const Color success = Color(0xFF19C463);
  static const Color warning = Color(0xFFFFAA2C);
  static const Color error = Color(0xFFFF4C61);
  static const Color info = Color(0xFF2EB8FF);

  /// Neutral foundations
  static const Color neutral = Color(0xFF1E1E1E);
  static const Color neutralVariant = Color(0xFF616161);
  static const Color borderLight = Color(0xFFE0E6FF);
  static const Color borderDark = Color(0xFF303854);

  /// Light theme surfaces
  static const Color backgroundLight = Color(0xFFCCCCCC);
  static const Color surfaceLight = Color(0xFFF8FAFF);
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
  static const Color onPrimaryLight = Color(0xFF101828);
  static const Color onSecondaryLight = Color(0xFF475467);
  static const Color onMutedLight = Color(0xFF8A94B0);
  static const Color onBackgroundDark = Color(0xFFF5F7FF);
  static const Color onPrimaryDark = Color(0xFFF5F7FF);
  static const Color onSecondaryDark = Color(0xFFB8C1FF);
  static const Color onMutedDark = Color(0xFF7D86A8);
  static const Color onBackgroundLight = Color(0xFF101828);


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

  /// Checkout screen specific gradients
  static const LinearGradient checkoutOrderGradient = LinearGradient(
    colors: <Color>[
      Color(0x1A2196F3), // Blue with alpha 0.1
      Color(0x0D9C27B0), // Purple with alpha 0.05
    ],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static const LinearGradient checkoutPromoGradient = LinearGradient(
    colors: <Color>[
      Color(0x1AFF9800), // Orange with alpha 0.1
      Color(0x0DF44336), // Red with alpha 0.05
    ],
  );

  static const LinearGradient checkoutPromoAppliedGradient = LinearGradient(
    colors: <Color>[
      Color(0x1A4CAF50), // Green with alpha 0.1
      Color(0x0D009688), // Teal with alpha 0.05
    ],
  );

  static const LinearGradient checkoutButtonGradient = LinearGradient(
    colors: <Color>[
      Color(0xFF2196F3), // Blue
      Color(0xFF9C27B0), // Purple
    ],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static const LinearGradient checkoutPaymentGradient = LinearGradient(
    colors: <Color>[
      Color(0x1A9C27B0), // Purple with alpha 0.1
      Color(0x0D2196F3), // Blue with alpha 0.05
    ],
  );

  static const LinearGradient checkoutShippingGradient = LinearGradient(
    colors: <Color>[
      Color(0x1A009688), // Teal with alpha 0.1
      Color(0x0D4CAF50), // Green with alpha 0.05
    ],
  );

  /// Checkout section colors
  static const Color checkoutOrderColor = Color(0xFF2196F3); // Blue
  static const Color checkoutPromoColor = Color(0xFFFF9800); // Orange
  static const Color checkoutPromoAppliedColor = Color(0xFF4CAF50); // Green
  static const Color checkoutSummaryColor = Color(0xFF4CAF50); // Green
  static const Color checkoutPaymentColor = Color(0xFF9C27B0); // Purple
  static const Color checkoutShippingColor = Color(0xFF009688); // Teal

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
  static const Color iconLight = Color(0xFF1F1E1E); // Dark gray for light theme
  static const Color iconDark = Color(0xFFCCCCCC);  // Light gray for dark theme

  /// App Bar gradient
  static LinearGradient appBarGradient(bool isDark) => LinearGradient(
    colors: [
      isDark ? const Color(0xFF424242) : const Color(0xFFFFFFFF),
      isDark ? const Color(0xFF616161) : const Color(0xFFF5F5F5),
    ],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );
}