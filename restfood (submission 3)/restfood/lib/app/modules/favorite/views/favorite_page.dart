import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:restfood/app/modules/favorite/controllers/favorite_controller.dart';

import '../../../constants/constants.dart';
import '../../../models/restaurant.dart';
import '../../../utils/utils.dart';
import '../../restfood_list/views/component/restfood_list_card.dart';

class FavoritePage extends StatefulWidget {
  const FavoritePage({Key? key}) : super(key: key);

  @override
  State<FavoritePage> createState() => _FavoritePageState();
}

class _FavoritePageState extends State<FavoritePage> {
  final FavoriteController controller = FavoriteController.to;

  @override
  void initState() {
    super.initState();
    SharedMethod.systemBarColor(
        AppStyles.colors.transparent, AppStyles.colors.white);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: false,
        title: Text(
          'Favorite',
          style: AppStyles.textStyles.poppinsBold
              .copyWith(color: AppStyles.colors.bgDark, fontSize: 5.0.wp),
        ),
      ),
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: Obx(
          () => (controller.getListOfFavorite.isEmpty)
              ? Center(
                  child: Text(
                    "Tidak ada\nresto yang disukai",
                    textAlign: TextAlign.center,
                    style: TextStyle(color: AppStyles.colors.bgDark),
                  ),
                )
              : ListView.builder(
                  itemCount: controller.getListOfFavorite.length,
                  physics: const BouncingScrollPhysics(),
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    var getId = controller.getListOfFavorite[index];
                    Restaurant restaurant =
                        controller.getRestaurantFavorite(getId);
                    return (restaurant.id == "")
                        ? const SizedBox(
                            child: Text("none"),
                          )
                        : Padding(
                            padding:
                                EdgeInsets.only(bottom: 1.0.wp, top: 1.0.wp),
                            child: GestureDetector(
                              onTap: () {
                                SharedMethod.checkConnectionBeforeExecute(
                                    functions: () {
                                  Get.toNamed(AppRoutes.detailPage,
                                      arguments: restaurant.id);
                                });
                              },
                              child: RestFoodListCard(
                                restaurant: restaurant,
                              ),
                            ),
                          );
                  },
                ),
        ),
      ),
    );
  }
}
