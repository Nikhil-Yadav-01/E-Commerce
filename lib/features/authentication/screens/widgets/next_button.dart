import 'package:e_commerce/features/authentication/controllers/onboarding/onboarding_controller.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../../utils/device/device_utility.dart';

class OnBoardingNextButton extends StatelessWidget {
  const OnBoardingNextButton({super.key, required this.currentPage});

  final int currentPage;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: RSizes.defaultSpace,
      right: RDeviceUtils.getNavigationBarHeight(context),
      child: ElevatedButton(
        onPressed: () => OnBoardingController.instance.nextPage(),
        style: ElevatedButton.styleFrom(
          shape: const StadiumBorder(),
          backgroundColor: RColors.primaryLight,
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: RSizes.md),
          child: currentPage == 2
              ? Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Text('Connect..'),
                    const SizedBox(width: RSizes.spaceBtwItems),
                    const Icon(Iconsax.arrow_right_3),
                  ],
                )
              : const Icon(Iconsax.arrow_right_3),
        ),
      ),
    );
  }
}
