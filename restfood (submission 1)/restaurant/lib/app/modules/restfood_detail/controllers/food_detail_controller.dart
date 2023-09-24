import 'package:get/get.dart';

class FoodDetailController extends GetxController {
  static FoodDetailController to = Get.find();
  RxBool isLoading = false.obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }
}
