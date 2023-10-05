import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:restfood/app/services/network/api_service.dart';
import 'package:restfood/app/utils/utils.dart';

import '../../../models/get_list_restaurant_result.dart';
import '../../../models/restaurant.dart';
import '../../../models/search_restaurant_result.dart';

class RestFoodListController extends GetxController {
  static RestFoodListController to = Get.find();
  RxList<Restaurant> listRestaurant = <Restaurant>[].obs;
  RxList<Restaurant> listRestaurantSearch = <Restaurant>[].obs;
  RxString query = "".obs;
  RxBool isLoading = false.obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    SharedMethod.checkConnectionBeforeExecute(functions: () {
      fetchListRestaurant();
    });
  }

  ApiService restaurantService = ApiService();

  void fetchListRestaurant() async {
    isLoading(true);
    try {
      await restaurantService
          .getListRestaurant()
          .then((GetListRestaurantResult response) {
        if (response.error == false) {
          listRestaurant.value = response.restaurants;
        } else {
          listRestaurant.clear();
        }
        listRestaurant.refresh();
        isLoading(false);
      });
    } catch (e) {
      if (kDebugMode) {
        print(e.toString());
      }
    }
    isLoading(false);
  }

  void fetchListRestaurantSearch({required String query}) async {
    isLoading(true);
    listRestaurantSearch.value = <Restaurant>[];
    try {
      await restaurantService
          .getListSearchRestaurant(query)
          .then((SearchRestaurantResult response) {
        listRestaurantSearch.value = response.restaurants;
        listRestaurantSearch.refresh();
        update();
      });
    } catch (e) {
      if (kDebugMode) {
        print(e.toString());
      }
    }
    isLoading(false);
  }
}
