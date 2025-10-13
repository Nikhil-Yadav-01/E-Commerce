import 'package:flutter/material.dart';

import '../../utils/constants/colors.dart';
import '../../utils/constants/sizes.dart';

class VerticalImageText extends StatelessWidget {
  const VerticalImageText({
    super.key, required this.image, required this.title, required this.textColor, required this.backgroundColor, this.onTap,
  });

  final String image;
  final String title;
  final Color textColor;
  final Color backgroundColor;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.only(right: RSizes.spaceBtwItems),
        child: Column(
          children: [
            Container(
              width: 56,
              height: 56,
              decoration: BoxDecoration(
                color: backgroundColor,
                borderRadius: BorderRadius.circular(100),
              ),
              child: Center(
                child: Image(
                  width: RSizes.iconSizeM,
                  height: RSizes.iconSizeM,
                  image: AssetImage(image),
                  fit: BoxFit.contain,
                  color: RColors.surfaceLight,
                ),
              ),
            ),

            const SizedBox(height: RSizes.spaceBtwItems / 2),
            SizedBox(
              width: 56,
              child: Text(
                title,
                overflow: TextOverflow.ellipsis,
                style: Theme.of(context).textTheme.labelSmall?.apply(
                    color: textColor
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}