import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../utils/constants/colors.dart';
import '../../utils/constants/sizes.dart';

class RCartCounterIcon extends StatelessWidget {
  const RCartCounterIcon({
    super.key, required this.iconColor, this.onPressed,
  });

  final Color iconColor;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        IconButton(
          onPressed: () {},
          icon: Icon(
            Iconsax.notification,
            color: iconColor,
            size: RSizes.iconSizeS,
          ),
        ),
        Positioned(
          right: 0,
          child: Container(
            width: RSizes.spaceBtwItems,
            height: RSizes.spaceBtwItems,
            decoration: BoxDecoration(
              color: Color(0xFF000000),
              borderRadius: BorderRadius.circular(100),
            ),
            child: Center(
              child: Text(
                '3',
                style: Theme.of(context).textTheme.labelLarge?.apply(
                  color: RColors.white,
                  fontSizeFactor: 0.8,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}