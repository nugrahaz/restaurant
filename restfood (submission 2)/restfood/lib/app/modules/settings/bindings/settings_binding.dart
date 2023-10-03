import 'package:get/get.dart';

import '../../restfood_list/controllers/food_list_controller.dart';

class SettingsBinding implements Bindings {
  @override
  void dependencies() {
    Get.put<FoodListController>(FoodListController());
  }
}
