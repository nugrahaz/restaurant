import 'dart:async';

import 'package:get/get.dart';

import '../../../constants/constants.dart';
import '../../../services/local/storage_service.dart';

class SplashController extends GetxController {
  static SplashController to = Get.find();
  RxBool isFirstOpened = false.obs;

  @override
  void onInit() {
    if (StorageServices().checkPageSeen(AppRoutes.onboardingPage) == true) {
      isFirstOpened.value = false;
    } else {
      isFirstOpened.value = true;
    }
    super.onInit();
  }

  @override
  void onReady() {
    openStartPage();
  }

  openStartPage() async {
    Timer(2.5.seconds, () async {
      if (isFirstOpened.value == true) {
        Get.offAllNamed(AppRoutes.onboardingPage);
      } else {
        Get.offAllNamed(AppRoutes.homePage);
      }
    });
  }
}
