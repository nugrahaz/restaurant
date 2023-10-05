import 'package:get/get.dart';

class HomeController extends GetxController {
  static HomeController to = Get.find();

  RxInt currentBottomNavItemIndex = 0.obs;
  void switchBetweenBottomNavigationItems(int currentIndex) {
    currentBottomNavItemIndex.value = currentIndex;
  }
}
