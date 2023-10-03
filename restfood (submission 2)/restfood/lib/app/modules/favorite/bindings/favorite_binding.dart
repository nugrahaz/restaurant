import 'package:get/get.dart';

import '../controllers/favorite_controller.dart';

class FavoriteBinding implements Bindings {
  @override
  void dependencies() {
    Get.put<FavoriteController>(FavoriteController());
  }
}
