import 'package:flutter/material.dart';

import '../../utils/constants/colors.dart';
import '../../utils/constants/sizes.dart';

class HorizontalDivider extends StatelessWidget {
  const HorizontalDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: RSizes.spaceBtwItems),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: RSizes.sm),
          child: Container(
            height: 1,
            color: RColors.borderLight,
          ),
        ),
        const SizedBox(height: RSizes.spaceBtwItems),
      ],
    );
  }
}
