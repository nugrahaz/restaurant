import 'package:get/get.dart';

import '../controllers/food_list_controller.dart';

class FoodListBinding implements Bindings {
  @override
  void dependencies() {
    Get.put<FoodListController>(FoodListController());
  }
}
