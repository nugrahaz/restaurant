import 'package:get/get.dart';

class HomeController extends GetxController {
  static HomeController to = Get.find();

  RxInt currentBottomNavItemIndex = 0.obs;
  // RxList<Food> favoriteFood = <Food>[].obs;

  void switchBetweenBottomNavigationItems(int currentIndex) {
    currentBottomNavItemIndex.value = currentIndex;
  }

  // isFavoriteFood(Food food) {
  //   food.isFavorite = !food.isFavorite;
  //   update();
  //   if (food.isFavorite) {
  //     favoriteFood.add(food);
  //   }
  //   if (!food.isFavorite) {
  //     favoriteFood.removeWhere((element) => element == food);
  //   }
  // }
}
