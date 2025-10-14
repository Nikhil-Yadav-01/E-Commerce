import 'package:e_commerce/features/authentication/screens/sign_in/sign_in.dart';
import 'package:e_commerce/navigation_menu.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../utils/constants/images.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../../utils/constants/texts.dart';
import '../../../../utils/helpers/helper_functions.dart';

class ResetPasswordScreen extends StatelessWidget {
  const ResetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = RHelperFunctions.isDarkMode(context);

    return Scaffold(
      backgroundColor: isDark ? const Color(0xFF0F0F0F) : Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          IconButton(onPressed: () => Get.back(), icon: const Icon(Icons.clear))
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(RSizes.defaultSpace),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Image
            Image(
              image: AssetImage(RImages.deliveredEmailIllustration),
              width: RHelperFunctions.screenWidth() * 0.6,
            ),
            const SizedBox(height: RSizes.spaceBtwSections),

            // Title & Subtitle
            Text(
              RTexts.changeYourPasswordTitle,
              style: Theme.of(context).textTheme.headlineMedium,
            textAlign: TextAlign.center,
            ),
            const SizedBox(height: RSizes.spaceBtwItems),
            Text(
              RTexts.changeYourPasswordSubTitle,
              style: Theme.of(context).textTheme.labelMedium,
            ),
            const SizedBox(height: RSizes.spaceBtwSections),

            // Submit button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () => Get.to(() => const NavigationMenu()),
                child: const Text(RTexts.done),
              ),
            ),
            const SizedBox(height: RSizes.spaceBtwItems),

            SizedBox(
              width: double.infinity,
              child: TextButton(
                onPressed: () => Get.to(() => const SignInScreen()),
                child: const Text(RTexts.resendEmail),
              ),
            ),
          ],
        ),
      ),
    );
  }
}