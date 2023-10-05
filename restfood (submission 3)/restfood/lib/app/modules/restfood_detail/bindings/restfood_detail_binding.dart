import 'package:get/get.dart';

import '../controllers/restfood_detail_controller.dart';

class RestFoodDetailBinding implements Bindings {
  @override
  void dependencies() {
    Get.put<RestFoodDetailController>(RestFoodDetailController());
  }
}
