import 'package:flutter/material.dart';

import '../../../../utils/constants/images.dart';
import '../../../../utils/constants/sizes.dart';

class AuthHeader extends StatelessWidget {
  const AuthHeader({
    super.key, required this.isDark, required this.title, required this.subTitle,
  });

  final bool isDark;
  final String title, subTitle;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Image(
          height: 150,
          image: AssetImage(
            isDark ? RImages.appLogoDark : RImages.appLogoLight,
          ),
        ),
        Text(
          title,
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        const SizedBox(height: RSizes.sm),
        Text(
          subTitle,
          style: Theme.of(context).textTheme.bodyMedium,
        ),
      ],
    );
  }
}