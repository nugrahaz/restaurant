import 'package:get/get.dart';
import 'package:restfood/app/modules/favorite/controllers/favorite_controller.dart';
import 'package:restfood/app/modules/home/controllers/home_controller.dart';
import 'package:restfood/app/modules/settings/controllers/settings_controller.dart';

import '../../restfood_list/controllers/food_list_controller.dart';

class HomeBinding implements Bindings {
  @override
  void dependencies() {
    Get.put<HomeController>(HomeController());
    Get.put<RestFoodListController>(RestFoodListController());
    Get.put<FavoriteController>(FavoriteController());
    Get.put<SettingsController>(SettingsController());
  }
}
