import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:restfood/app/modules/restfood_list/controllers/food_list_controller.dart';
import 'package:restfood/app/modules/restfood_list/views/component/restaurant_list_card.dart';
import 'package:restfood/app/widgets/widgets.dart';

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
    SharedMethod.systemBarColor(AppStyles.colors.white, AppStyles.colors.white);
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: double.infinity,
      child: Obx(
        () => (controller.isLoading.isTrue)
            ? SpinKitRotatingCircle(
                color: AppStyles.colors.bgDark,
                size: 10.0.wp,
              )
            : (controller.listRestaurant.isEmpty)
                ? Center(
                    child: AnimatedBounceWidget(
                      duration: 1.seconds,
                      onPressed: () {
                        SharedMethod.checkConnectionBeforeExecute(
                            functions: () {
                          controller.fetchListRestaurant();
                        });
                      },
                      child: Container(
                        width: 25.0.wp,
                        height: 15.0.wp,
                        decoration: BoxDecoration(
                            color: AppStyles.colors.bgDark,
                            borderRadius:
                                BorderRadius.all(Radius.circular(3.0.wp))),
                        child: Center(
                          child: Text(
                            "Refresh",
                            style: AppStyles.textStyles.poppinsSemiBold
                                .copyWith(
                                    color: Colors.white, fontSize: 4.0.wp),
                          ),
                        ),
                      ),
                    ),
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
                            SharedMethod.checkConnectionBeforeExecute(
                                functions: () {
                              Get.toNamed(AppRoutes.detailPage,
                                  arguments: restaurant.id);
                            });
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
