import 'package:e_commerce/common/styles/spacing_styles.dart';
import 'package:e_commerce/utils/helpers/helper_functions.dart';
import 'package:e_commerce/utils/constants/colors.dart';
import 'package:flutter/material.dart';

import '../../../../utils/constants/images.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../../utils/constants/texts.dart';
import '../widgets/auth_header.dart';
import '../widgets/or_sign.dart';
import '../widgets/sign_in_form.dart';
import '../widgets/social_auth_button.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = RHelperFunctions.isDarkMode(context);

    return Scaffold(
      backgroundColor: isDark ? RColors.backgroundDark : RColors.backgroundLight,
      // Stack to layer the custom background shape and the main content
      body: SingleChildScrollView(
        child: Padding(
          padding: RSpacingStyle.paddingWithAppBarHeight,
          child: Column(
            children: [
              // Logo, Title & Sub-title
              AuthHeader(
                isDark: isDark,
                title: RTexts.signInTitle,
                subTitle: RTexts.signInSubTitle,
              ),

              // Form
              SignInForm(isDark: isDark),

              // Or Sign In with
              OrSign(isDark: isDark, title: RTexts.orSignInWith),

              const SizedBox(height: RSizes.spaceBtwSections),

              // Social Login Buttons
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SocialAuthButton(image: RImages.google, isDark: isDark),
                  const SizedBox(width: RSizes.spaceBtwItems),
                  SocialAuthButton(
                    image: RImages.facebook,
                    isDark: isDark,
                  ),
                ],
              ),
              const SizedBox(height: RSizes.spaceBtwSections)
            ],
          ),
        ),
      ),
    );
  }
}
