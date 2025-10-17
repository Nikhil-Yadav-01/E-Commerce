import 'package:carousel_slider/carousel_slider.dart' as carousel;
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../common/widgets/circular_container.dart';
import '../../../../../common/widgets/rounded_image.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/device/device_utility.dart';
import '../../../../../utils/helpers/helper_functions.dart';
import '../../../controllers/carousel_controller.dart';

class RCarouselWidget extends StatelessWidget {
  const RCarouselWidget({super.key, required this.banners});

  final List<String> banners;

  @override
  Widget build(BuildContext context) {
    final isDark = RHelperFunctions.isDarkMode(context);
    final controller = Get.put(HomeCarouselController());

    return Column(
      children: [
        RPromoSlider(banners: banners, controller: controller),
        const SizedBox(height: RSizes.spaceBtwSections),

        Obx(
          () => Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              for (int i = 0; i < banners.length; i++)
                RoundedContainer(
                  width: 20,
                  height: 4,
                  margin: const EdgeInsets.only(right: 10),
                  backgroundColor: controller.currentIndex.value == i
                      ? (isDark ? RColors.primaryDark : RColors.primaryLight)
                      : (isDark
                            ? RColors.secondaryDark
                            : RColors.secondaryLight),
                ),
            ],
          ),
        ),
      ],
    );
  }
}

class RPromoSlider extends StatelessWidget {
  const RPromoSlider({
    super.key,
    required this.banners,
    required this.controller,
  });

  final List<String> banners;
  final HomeCarouselController controller;

  @override
  Widget build(BuildContext context) {
    final carouselHeight = RDeviceUtils.getCarouselHeight(context);

    return carousel.CarouselSlider(
      items: banners
          .map(
            (url) => RoundedImage(
              imagePath: url,
              width: double.infinity,
              height: carouselHeight,
              borderRadius: RSizes.cardRadiusLg,
              applyImageRadius: true,
              fit: BoxFit.cover,
            ),
          )
          .toList(),
      options: carousel.CarouselOptions(
        height: carouselHeight,
        enlargeCenterPage: true,
        autoPlay: true,
        autoPlayCurve: Curves.fastOutSlowIn,
        enableInfiniteScroll: true,
        autoPlayAnimationDuration: const Duration(milliseconds: 800),
        viewportFraction: 0.9,
        onPageChanged: (index, reason) => controller.updatePage(index),
      ),
    );
  }
}
