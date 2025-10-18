import 'package:e_commerce/features/authentication/screens/onboarding/onboarding.dart';
import 'package:e_commerce/features/authentication/screens/sign_in/sign_in.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../../utils/constants/texts.dart';

class AuthenticationRepository extends GetxController {
  static AuthenticationRepository get instance => Get.find();

  final deviceStorage = GetStorage();

  @override
  void onReady() {
    FlutterNativeSplash.remove();
    screenRedirect();
  }

  // Function to show relevant screen
  screenRedirect() async {
    // Local Storage
    deviceStorage.writeIfNull(RTexts.firstTime, true);
    deviceStorage.read(RTexts.firstTime) != true
        ? Get.offAll(() => const SignInScreen())
        : Get.offAll(() => const OnBoardingScreen());
  }
}