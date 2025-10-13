import 'package:e_commerce/features/authentication/screens/sign_up/verify_email.dart';
import 'package:e_commerce/features/authentication/screens/widgets/social_auth_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../common/widgets/text_field.dart';
import '../../../../utils/constants/images.dart';
import '../../../../utils/constants/sizes.dart';
import 'or_sign.dart';

class SignUpForm extends StatelessWidget {
  const SignUpForm({
    super.key,
    required this.isDark,
  });

  final bool isDark;

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        children: [
          // First Name & Last Name
          Row(
            children: [
              Expanded(
                child: RTextField(
                  prefixIcon: Iconsax.user,
                  hintText: "First Name",
                  isDark: isDark,
                ),
              ),
              const SizedBox(width: RSizes.spaceBtwItems / 2),
              Expanded(
                child: RTextField(
                  prefixIcon: Iconsax.user,
                  hintText: "Last Name",
                  isDark: isDark,
                ),
              ),
            ],
          ),
          const SizedBox(height: RSizes.spaceBtwItems),

          // Username
          RTextField(
            prefixIcon: Iconsax.user_edit,
            hintText: "Username",
            isDark: isDark,
          ),
          const SizedBox(height: RSizes.spaceBtwItems),

          // Email
          RTextField(
            prefixIcon: Icons.email_outlined,
            hintText: "E-Mail",
            isDark: isDark,
          ),
          const SizedBox(height: RSizes.spaceBtwItems),

          // Phone Number
          RTextField(
            prefixIcon: Iconsax.call,
            hintText: "Phone Number",
            isDark: isDark,
          ),
          const SizedBox(height: RSizes.spaceBtwItems),

          // Password
          RTextField(
            prefixIcon: Iconsax.password_check,
            hintText: "Password",
            isPassword: true,
            isDark: isDark,
          ),
          const SizedBox(height: RSizes.spaceBtwItems),

          // Terms & Conditions Checkbox
          Row(
            children: [
              SizedBox(
                width: 24,
                height: 24,
                child: Checkbox(
                  value: true,
                  onChanged: (value) {},
                  fillColor: WidgetStateProperty.all(Colors.blue),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(4),
                  ),
                ),
              ),
              const SizedBox(width: RSizes.spaceBtwItems / 2),
              Expanded(
                child: Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(
                        text: "I agree to ",
                        style: TextStyle(
                          color: isDark ? Colors.grey[400] : Colors.grey[600],
                          fontSize: 14,
                        ),
                      ),
                      TextSpan(
                        text: "Privacy Policy",
                        style: TextStyle(
                          color: Colors.blue,
                          fontSize: 14,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                      TextSpan(
                        text: " and ",
                        style: TextStyle(
                          color: isDark ? Colors.grey[400] : Colors.grey[600],
                          fontSize: 14,
                        ),
                      ),
                      TextSpan(
                        text: "Terms of use",
                        style: TextStyle(
                          color: Colors.blue,
                          fontSize: 14,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: RSizes.spaceBtwSections),

          // Create Account Button
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () => Get.to(() => const EmailVerificationScreen()),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(vertical: 18),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                elevation: 0,
              ),
              child: const Text(
                "Create Account",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
          const SizedBox(height: RSizes.spaceBtwSections),

          // Or Sign Up with
          OrSign(isDark: isDark, title: "or Sign Up With"),
          const SizedBox(height: RSizes.spaceBtwSections),

          // Social Login Buttons
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SocialAuthButton(
                image: RImages.google,
                isDark: isDark,
              ),
              const SizedBox(width: RSizes.spaceBtwItems),
              SocialAuthButton(
                image: RImages.facebook,
                isDark: isDark,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
