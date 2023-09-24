import 'package:get/get.dart';

import '../controllers/food_detail_controller.dart';

class FoodDetailBinding implements Bindings {
  @override
  void dependencies() {
    Get.put<FoodDetailController>(FoodDetailController());
  }
}
