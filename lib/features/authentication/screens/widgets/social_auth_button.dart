import 'package:flutter/material.dart';

import '../../../../utils/constants/sizes.dart';

// Custom Widget for Social Login Buttons (Google/Apple)
class SocialAuthButton extends StatelessWidget {
  final String image;
  final bool isDark;

  const SocialAuthButton({super.key, required this.image, required this.isDark});

  @override
  Widget build(BuildContext context) {

    return Container(
      width: RSizes.iconSizeL,
      height: RSizes.iconSizeL,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(
          color: isDark ? Colors.grey[800]! : Colors.grey[300]!,
          width: 1,
        ),
      ),
      child: Center(
        child: Image.asset(
          image,
          width: RSizes.iconSizeS,
          height: RSizes.iconSizeS,
        ),
      ),
    );
  }
}