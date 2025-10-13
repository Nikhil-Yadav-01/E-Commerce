import 'package:e_commerce/features/authentication/screens/sign_in/sign_in.dart';
import 'package:e_commerce/features/authentication/screens/sign_up/succes_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../utils/constants/images.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../../utils/constants/texts.dart';
import '../../../../utils/helpers/helper_functions.dart';

class EmailVerificationScreen extends StatelessWidget {
  const EmailVerificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            onPressed: () => Get.offAll(() => const SignInScreen()),
            icon: const Icon(Icons.close)
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(RSizes.defaultSpace),
          child: Column(
            children: [
              // Image
              Image(
                image: AssetImage(RImages.deliveredEmailIllustration),
                width: RHelperFunctions.screenWidth() * 0.6,
              ),
              const SizedBox(height: RSizes.spaceBtwSections),

              // Title & subtitle
              Text(
                RTexts.confirmEmail,
                  style: Theme.of(context).textTheme.headlineMedium,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: RSizes.spaceBtwItems),
              Text(
                "johndoe@gmail.com",
                style: Theme.of(context).textTheme.labelLarge,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: RSizes.spaceBtwItems),
              Text(
                RTexts.confirmEmailSubTitle,
                style: Theme.of(context).textTheme.labelLarge,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: RSizes.spaceBtwSections),

              // Buttons
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () => Get.to(() => SuccessScreen(
                      image: RImages.staticSuccessIllustration,
                      title: RTexts.yourAccountCreatedTitle,
                      subTitle: RTexts.yourAccountCreatedSubTitle,
                      onPressed: () => Get.to(() => const SignInScreen(),)
                  ),
                  ),
                  child: const Text(RTexts.tContinue),
                )
              ),
              const SizedBox(height: RSizes.spaceBtwItems),

              SizedBox(
                width: double.infinity,
                child: TextButton(
                  onPressed: () {},
                  child: const Text(RTexts.resendEmail)
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
