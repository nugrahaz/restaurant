import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:restfood/app/services/network/api_service.dart';

import '../../../models/list_restaurant.dart';
import '../../../models/restaurant.dart';

class FoodListController extends GetxController {
  static FoodListController to = Get.find();
  RxList<Restaurant> listRestaurant = <Restaurant>[].obs;
  RxList<Restaurant> listRestaurantSearch = <Restaurant>[].obs;
  RxString query = "".obs;
  RxBool isLoading = false.obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }

  ApiService restaurantService = ApiService();
  void fetchListRestaurant() async {
    listRestaurant.value = [];
    try {
      await restaurantService
          .getListRestaurant()
          .then((ListRestaurant response) {
        listRestaurant.value = response.restaurants;
        listRestaurant.refresh();
      });
    } catch (e) {
      if (kDebugMode) {
        print(e.toString());
      }
    }
  }
}
