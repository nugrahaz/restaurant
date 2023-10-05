import 'package:get/get.dart';

import '../controllers/food_list_controller.dart';

class RestFoodListBinding implements Bindings {
  @override
  void dependencies() {
    Get.put<RestFoodListController>(RestFoodListController());
  }
}
