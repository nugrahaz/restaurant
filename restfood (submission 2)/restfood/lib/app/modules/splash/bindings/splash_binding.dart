import 'package:get/get.dart';
import 'package:restfood/app/modules/splash/controllers/splash_controller.dart';

class SplashBinding implements Bindings {
  @override
  void dependencies() {
    Get.put<SplashController>(SplashController());
  }
}
