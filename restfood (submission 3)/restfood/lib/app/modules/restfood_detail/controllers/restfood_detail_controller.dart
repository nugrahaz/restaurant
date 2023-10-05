import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:restfood/app/models/detail_restaurant.dart';

import '../../../services/network/api_service.dart';

class RestFoodDetailController extends GetxController {
  static RestFoodDetailController to = Get.find();
  RxBool isLoading = false.obs;
  late DetailRestaurant restaurant;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }

  void fetchDetailRestaurant(String id) async {
    isLoading(true);
    ApiService restaurantService = ApiService();

    try {
      await restaurantService.getDetailRestaurant(id).then((response) {
        restaurant = response.restaurant;
      });
    } catch (e) {
      if (kDebugMode) {
        print(e.toString());
      }
    }
    isLoading(false);
  }
}
