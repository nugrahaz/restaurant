import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:restfood/app/modules/restfood_detail/views/restaurant_detail_page.dart';
import 'package:restfood/app/modules/restfood_list/controllers/food_list_controller.dart';
import 'package:restfood/app/modules/restfood_list/views/component/restaurant_list_card.dart';

import '../../../constants/constants.dart';
import '../../../models/restaurant.dart';
import '../../../utils/utils.dart';

class FoodListPage extends StatefulWidget {
  const FoodListPage({Key? key}) : super(key: key);

  @override
  State<FoodListPage> createState() => _FoodListPageState();
}

class _FoodListPageState extends State<FoodListPage> {
  final FoodListController controller = FoodListController.to;

  @override
  void initState() {
    super.initState();
    controller.fetchListRestaurant();

    SharedMethod.systemBarColor(AppStyles.colors.white, AppStyles.colors.white);
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: double.infinity,
      child: Obx(
        () => (controller.listRestaurant.isEmpty)
            ? const SizedBox(
                height: 1,
                width: 1,
              )
            : ListView.builder(
                itemCount: controller.listRestaurant.length,
                physics: const BouncingScrollPhysics(),
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  Restaurant restaurant = controller.listRestaurant[index];
                  return Padding(
                    padding: EdgeInsets.only(bottom: 1.0.wp, top: 1.0.wp),
                    child: GestureDetector(
                      onTap: () {
                        Get.to(RestaurantDetailPage(restaurant: restaurant));
                      },
                      child: RestaurantListCard(
                        restaurant: restaurant,
                      ),
                    ),
                  );
                },
              ),
      ),
    );
  }
}
