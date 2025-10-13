import 'package:e_commerce/features/authentication/screens/widgets/next_button.dart';
import 'package:e_commerce/features/authentication/screens/widgets/on_boarding_page.dart';
import 'package:e_commerce/features/authentication/screens/widgets/on_boarding_skip.dart';
import 'package:e_commerce/features/authentication/screens/widgets/smooth_page_indicator.dart';
import 'package:e_commerce/utils/constants/images.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../utils/constants/texts.dart';
import '../../controllers/onboarding/onboarding_controller.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(OnBoardingController());

    return Scaffold(
      body: Stack(
        children: [
          // Horizontal Scrollable page
          PageView(
            controller: controller.pageController,
            onPageChanged: controller.updatePageIndicator,
            children: [
              OnBoardingPage(
                image: RImages.onboardingSearching,
                title: RTexts.onboardingTitles[0],
                subTitle: RTexts.onboardingSubTitles[0],
              ),
              OnBoardingPage(
                image: RImages.onboardingSearching,
                title: RTexts.onboardingTitles[1],
                subTitle: RTexts.onboardingSubTitles[1],
              ),
              OnBoardingPage(
                image: RImages.onboardingSearching,
                title: RTexts.onboardingTitles[2],
                subTitle: RTexts.onboardingSubTitles[2],
              ),
            ],
          ),

          // Skip Button
          OnBoardingSkip(),

          // Dot Navigation SmoothPageIndicator
          OnBoardingDotNavigation(),

          // Circular Button
          OnBoardingNextButton(),
        ],
      ),
    );
  }
}
