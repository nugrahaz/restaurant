import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:restfood/app/modules/restfood_list/controllers/food_list_controller.dart';
import 'package:restfood/app/modules/restfood_list/views/component/restfood_list_card.dart';
import 'package:restfood/app/utils/utils.dart';

import '../../../../constants/constants.dart';

class RestFoodtListSearch extends SearchDelegate {
  final RestFoodListController controller = RestFoodListController.to;

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
          onPressed: () {
            query = "";
          },
          icon: const Icon(Icons.search))
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
        onPressed: () {
          Get.back();
        },
        icon: const Icon(Icons.arrow_back));
  }

  @override
  Widget buildResults(BuildContext context) {
    SharedMethod.checkConnectionBeforeExecute(functions: () {
      controller.fetchListRestaurantSearch(query: query);
    });

    return Obx(
      () => (controller.isLoading.isTrue)
          ? SpinKitRotatingCircle(
              color: AppStyles.colors.bgDark,
              size: 10.0.wp,
            )
          : (controller.listRestaurantSearch.isEmpty)
              ? Center(
                  child: Text(
                  "Restaurant tidak ditemukan",
                  style: AppStyles.textStyles.poppinsSemiBold,
                ))
              : ListView.builder(
                  shrinkWrap: true,
                  itemCount: controller.listRestaurantSearch.length,
                  itemBuilder: (context, index) {
                    var restaurant = controller.listRestaurantSearch[index];
                    return GestureDetector(
                        onTap: () {
                          SharedMethod.checkConnectionBeforeExecute(
                              functions: () {
                            Get.toNamed(AppRoutes.detailPage,
                                arguments: restaurant.id);
                          });
                        },
                        child: RestFoodListCard(restaurant: restaurant));
                  }),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return const Center(child: Text('Search restaurant'));
  }
}
