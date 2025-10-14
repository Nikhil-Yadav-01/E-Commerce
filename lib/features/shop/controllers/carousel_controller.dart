import 'package:get/get.dart';

class HomeCarouselController extends GetxController {
  static HomeCarouselController get instance => Get.find();

  RxInt currentIndex = 0.obs;

  void updatePage(index) {
    currentIndex.value = index;
  }
}