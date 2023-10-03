import 'package:get/get.dart';

class FavoriteController extends GetxController {
  static FavoriteController to = Get.find();

  RxBool isFavorite = false.obs;
}
