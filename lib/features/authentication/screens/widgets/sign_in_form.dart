import 'package:e_commerce/features/authentication/screens/password_config/forget_password.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../common/widgets/text_field.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../../utils/constants/texts.dart';
import '../sign_up/sign_up.dart';

class SignInForm extends StatelessWidget {
  const SignInForm({
    super.key,
    required this.isDark,
  });

  final bool isDark;

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: RSizes.spaceBtwSections,
        ),
        child: Column(
          children: [
            RTextField(
              hintText: 'user@example.com',
              prefixIcon: Icons.email_outlined,
              isDark: isDark,
              isPassword: false,
            ),

            const SizedBox(height: RSizes.spaceBtwItems / 2),

            RTextField(
              hintText: "******",
              prefixIcon: Iconsax.password_check,
              isDark: isDark,
              isPassword: true,
            ),
            const SizedBox(height: RSizes.spaceBtwItems),

            // Remember Me & Forgot Password
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Checkbox(value: true, onChanged: (value) {}),
                    const Text(RTexts.tRememberMe),
                  ],
                ),

                TextButton(
                  onPressed: () => Get.to(() => const ForgetPasswordScreen()),
                  child: const Text(RTexts.tForgetPassword),
                ),
              ],
            ),
            const SizedBox(height: RSizes.spaceBtwItems),

            // Sign In Button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  // Handle login logic
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(vertical: 18),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  elevation: 0,
                ),
                child: Text(
                  "Sign In",
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    color: isDark ? Colors.white : Colors.black,
                  ),
                ),
              ),
            ),
            const SizedBox(height: RSizes.spaceBtwItems),

            // Create Account Button
            SizedBox(
              width: double.infinity,
              child: OutlinedButton(
                onPressed: () => Get.to(() => const SignUpScreen()),
                style: OutlinedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 18),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  side: BorderSide(
                    color: isDark
                        ? Colors.grey[700]!
                        : Colors.grey[300]!,
                  ),
                ),
                child: Text(
                  "Create Account",
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    color: isDark ? Colors.white : Colors.black,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Custom Painter for the abstract blue background shape
class BackgroundPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.blue.shade600
      ..style = PaintingStyle.fill;

    final path = Path();
    // Start slightly off-screen top right
    path.moveTo(size.width * 0.9, 0);
    // Move to bottom right corner
    path.lineTo(size.width * 0.9, size.height);
    // Create the sharp internal angle
    path.lineTo(size.width * 0.4, size.height * 0.6);
    // Move back towards the top to define the shape
    path.lineTo(size.width * 1.1, size.height * 0.1);
    path.close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}