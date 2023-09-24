import 'package:get/get.dart';
import 'package:restfood/app/modules/home/controllers/home_controller.dart';

import '../../restfood_list/controllers/food_list_controller.dart';

class HomeBinding implements Bindings {
  @override
  void dependencies() {
    Get.put<HomeController>(HomeController());
    Get.put<FoodListController>(FoodListController());
  }
}
