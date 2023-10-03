import 'package:get/get.dart';
import 'package:restfood/app/modules/onboarding/controllers/onboarding_controller.dart';

class OnboardingBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<OnboardingController>(() => OnboardingController());
  }
}
