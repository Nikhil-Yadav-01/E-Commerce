import 'package:e_commerce/common/widgets/text_field.dart';
import 'package:e_commerce/features/authentication/screens/password_config/reset_password.dart';
import 'package:e_commerce/features/authentication/screens/sign_in/sign_in.dart';
import 'package:e_commerce/features/authentication/screens/sign_up/succes_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../utils/constants/images.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../../utils/constants/texts.dart';
import '../../../../utils/helpers/helper_functions.dart';

class ForgetPasswordScreen extends StatelessWidget {
  const ForgetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = RHelperFunctions.isDarkMode(context);

    return Scaffold(
        backgroundColor: isDark ? const Color(0xFF0F0F0F) : Colors.white,
        appBar: AppBar(),
        body: Padding(
          padding: const EdgeInsets.all(RSizes.defaultSpace),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Headline
              Text(
                RTexts.forgotPasswordTitle,
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              const SizedBox(height: RSizes.spaceBtwItems),
              Text(
                RTexts.forgotPasswordSubtitle,
                style: Theme.of(context).textTheme.labelMedium,
              ),
              const SizedBox(height: RSizes.spaceBtwSections * 2),

              // Text field
              TextFormField(
                decoration: const InputDecoration(
                  labelText: RTexts.email,
                  prefixIcon: Icon(Icons.email_outlined),
                ),
              ),
              const SizedBox(height: RSizes.spaceBtwSections),

              // Submit button
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    Get.off(() => const ResetPasswordScreen());
                  },
                  child: const Text(RTexts.submit),
                ),
              )
            ],
          ),
        ),
    );
  }
}