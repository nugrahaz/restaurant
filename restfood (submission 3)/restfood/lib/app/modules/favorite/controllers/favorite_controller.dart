import 'package:get/get.dart';
import 'package:restfood/app/models/restaurant.dart';
import 'package:restfood/app/modules/restfood_list/controllers/food_list_controller.dart';
import 'package:restfood/app/services/local/storage_service.dart';

import '../../../utils/utils.dart';

class FavoriteController extends GetxController {
  static FavoriteController to = Get.find();
  final RestFoodListController restFoodListController =
      RestFoodListController.to;

  final RxList<dynamic> _listOfFavorite = [].obs;
  RxBool isFavorite = false.obs;

  @override
  void onInit() {
    _listOfFavorite.value = StorageServices().getListOfFavorite();
    super.onInit();
  }

  //getter listOfFavorite
  RxList<dynamic> get getListOfFavorite => _listOfFavorite;

  set setListOffFavorite(String idRestaurant) {
    _listOfFavorite.add(idRestaurant);
  }

  //getter isFavorite
  bool checkIsFavorite(String idRestaurant) =>
      getListOfFavorite.contains(idRestaurant) ? true : false;

  void addToFavorite(String idRestaurant) {
    if (Get.isSnackbarOpen == false) {
      if (getListOfFavorite.contains(idRestaurant) == false) {
        isFavorite.value = false;
        setListOffFavorite = idRestaurant;
        StorageServices().addListOfFavorite(getListOfFavorite);
      }

      SharedMethod.showSnackBar(
          title: "Tambah Favorit",
          description: "Berhasil menambahkan ke favorit");
    }
  }

  void deleteFromFavorite(String idRestaurant) {
    if (Get.isSnackbarOpen == false) {
      isFavorite.value = false;
      _listOfFavorite.removeWhere((item) => item == idRestaurant);
      StorageServices().addListOfFavorite(getListOfFavorite);

      SharedMethod.showSnackBar(
          title: "Hapus Favorit",
          description: "Berhasil menghapus dari favorit");
    }
  }

  Restaurant getRestaurantFavorite(String idRestaurant) {
    var data = restFoodListController.listRestaurant
        .where((item) => item.id == idRestaurant)
        .toList();

    if (data.isNotEmpty) {
      return data.first;
    } else {
      return Restaurant(
          id: '',
          name: '',
          description: '',
          pictureId: '',
          city: '',
          rating: 0);
    }
  }
}
