import 'package:auto_size_text/auto_size_text.dart';
import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:restfood/app/modules/favorite/controllers/favorite_controller.dart';
import 'package:restfood/app/modules/restfood_detail/controllers/food_detail_controller.dart';
import 'package:restfood/app/modules/restfood_detail/views/bottom_sheet_review.dart';
import 'package:restfood/app/utils/utils.dart';

import '../../../constants/constants.dart';
import '../../../services/network/endpoints.dart';

class RestaurantDetailPage extends StatefulWidget {
  const RestaurantDetailPage({super.key});

  @override
  State<RestaurantDetailPage> createState() => _RestaurantDetailPageState();
}

class _RestaurantDetailPageState extends State<RestaurantDetailPage> {
  var arguments = Get.arguments;
  final FoodDetailController foodController = FoodDetailController.to;
  final FavoriteController favoriteController = FavoriteController.to;

  @override
  void initState() {
    // TODO: implement initState
    foodController.fetchDetailRestaurant(arguments);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Obx(() => (foodController.isLoading.isTrue)
                ? SpinKitRotatingCircle(
                    color: AppStyles.colors.bgDark,
                    size: 10.0.wp,
                  )
                : SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.all(4.0.wp),
                          child: Stack(
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(20),
                                child: ExtendedImage.network(
                                  height: 35.0.hp,
                                  width: 100.0.wp,
                                  Endpoints.getImage +
                                      foodController.restaurant.pictureId,
                                  cache: true,
                                  fit: BoxFit.fill,
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(30.0)),
                                ),
                              ),
                              Positioned(
                                right: 4.0.wp,
                                top: 4.0.wp,
                                child: favoriteController.isFavorite.value
                                    ? FloatingActionButton(
                                        onPressed: () {},
                                        child: Center(
                                          child: Icon(
                                            Icons.favorite,
                                            size: 5.0.wp,
                                          ),
                                        ),
                                      )
                                    : FloatingActionButton(
                                        onPressed: () {
                                          //                                            Restaurant(
                                          //                                               id: foodController.restaurant.id,
                                          //                                               name: foodController
                                          //                                                   .restaurant.name,
                                          //                                               description: foodController
                                          //                                                   .restaurant.description,
                                          //                                               city: foodController
                                          //                                                   .restaurant.city,
                                          //                                               pictureId: foodController
                                          //                                                   .restaurant.pictureId,
                                          //                                               rating: foodController
                                          //                                                   .restaurant.rating,
                                          //                                             ),
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(
                                            const SnackBar(
                                              duration: Duration(seconds: 1),
                                              content: Text(
                                                'Ditambahkan ke favorit',
                                              ),
                                            ),
                                          );
                                        },
                                        child: Center(
                                          child: Icon(
                                            Icons.favorite_border,
                                            size: 4.0.wp,
                                          ),
                                        ),
                                      ),
                              ),
                              Positioned(
                                right: 3.0.wp,
                                bottom: 1.0.wp,
                                child: Wrap(
                                  spacing: 6,
                                  runSpacing: 0,
                                  direction: Axis.horizontal,
                                  children: foodController.restaurant.categories
                                      .map(
                                        (food) => Chip(
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(20),
                                            side: const BorderSide(
                                                color: Colors.black),
                                          ),
                                          label: Text(
                                            food.name,
                                            style: TextStyle(
                                                color: AppStyles.colors.bgDark),
                                          ),
                                          backgroundColor:
                                              AppStyles.colors.white,
                                        ),
                                      )
                                      .toList(),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(4.0.wp),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(foodController.restaurant.name,
                                            style: AppStyles
                                                .textStyles.poppinsMedium
                                                .copyWith(fontSize: 4.6.wp)),
                                        SizedBox(height: 1.5.wp),
                                        Row(
                                          children: [
                                            Icon(
                                              Icons.location_pin,
                                              size: 4.0.wp,
                                              color: Colors.grey[400],
                                            ),
                                            SizedBox(width: 1.0.wp),
                                            Text(foodController.restaurant.city,
                                                style: AppStyles
                                                    .textStyles.poppinsBold
                                                    .copyWith(
                                                        color: AppStyles
                                                            .colors.bgDark
                                                            .withOpacity(0.5))),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(width: 2.0.wp),
                                  GestureDetector(
                                    onTap: () {
                                      showModalBottomSheet(
                                        context: context,
                                        backgroundColor: Colors.white,
                                        shape: const RoundedRectangleBorder(
                                          borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(18),
                                            topRight: Radius.circular(18),
                                          ),
                                        ),
                                        builder: (context) {
                                          return BottomSheetReview(
                                            restaurant:
                                                foodController.restaurant,
                                          );
                                        },
                                      );
                                    },
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        SizedBox(height: 1.5.wp),
                                        Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Text(
                                              '${foodController.restaurant.rating}',
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .bodyLarge,
                                            ),
                                            const SizedBox(width: 4),
                                            RatingBarIndicator(
                                              rating: foodController
                                                  .restaurant.rating,
                                              itemBuilder: (context, index) =>
                                                  const Icon(
                                                Icons.star,
                                                color: Colors.amber,
                                              ),
                                              itemSize: 4.0.wp,
                                            ),
                                          ],
                                        ),
                                        SizedBox(height: 1.5.wp),
                                        Text(
                                          'Selengkapnya >',
                                          style: AppStyles
                                              .textStyles.poppinsBold
                                              .copyWith(
                                                  color: AppStyles.colors.bgDark
                                                      .withOpacity(0.6),
                                                  fontSize: 3.5.wp),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 4.0.wp),
                              Text(
                                'Deskripsi :',
                                style: AppStyles.textStyles.poppinsSemiBold,
                              ),
                              SizedBox(height: 2.0.wp),
                              Text(
                                foodController.restaurant.description,
                                textAlign: TextAlign.justify,
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(vertical: 1.5.wp),
                                child: const AutoSizeText(
                                  "- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -",
                                  maxLines: 1,
                                ),
                              ),
                              Text(
                                'Menu Makanan :',
                                style: AppStyles.textStyles.poppinsSemiBold,
                              ),
                              SizedBox(height: 2.0.wp),
                              Wrap(
                                spacing: 6,
                                runSpacing: 0,
                                direction: Axis.horizontal,
                                children: foodController.restaurant.menus.foods
                                    .map(
                                      (food) => Chip(
                                        label: Text(
                                          food.name,
                                          style: const TextStyle(
                                              color: Colors.white),
                                        ),
                                        backgroundColor:
                                            AppStyles.colors.bgDark,
                                      ),
                                    )
                                    .toList(),
                              ),
                              SizedBox(height: 1.0.wp),
                              Padding(
                                padding: EdgeInsets.symmetric(vertical: 1.5.wp),
                                child: const AutoSizeText(
                                  "- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -",
                                  maxLines: 1,
                                ),
                              ),
                              Text(
                                'Menu Minuman :',
                                style: Theme.of(context).textTheme.bodyLarge,
                              ),
                              SizedBox(height: 2.0.wp),
                              Wrap(
                                spacing: 6,
                                runSpacing: 0,
                                direction: Axis.horizontal,
                                children: foodController.restaurant.menus.drinks
                                    .map(
                                      (food) => Chip(
                                        label: Text(
                                          food.name,
                                          style: const TextStyle(
                                              color: Colors.white),
                                        ),
                                        backgroundColor:
                                            AppStyles.colors.bgDark,
                                      ),
                                    )
                                    .toList(),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  )

            // SingleChildScrollView(
            //         child: Column(
            //           children: [
            //             Hero(
            //                 tag: controller.restaurant.pictureId,
            //                 child: ExtendedImage.network(
            //                   Endpoints.getImage + controller.restaurant.pictureId,
            //                   fit: BoxFit.cover,
            //                   cache: true,
            //                   border: Border.all(color: Colors.white, width: 1.0),
            //                 )),
            //             Padding(
            //               padding: const EdgeInsets.all(20),
            //               child: Column(
            //                 crossAxisAlignment: CrossAxisAlignment.start,
            //                 children: [
            //                   Row(
            //                     children: [
            //                       Row(children: [
            //                         const Icon(
            //                           Icons.location_pin,
            //                           color: Colors.red,
            //                           size: 15,
            //                         ),
            //                         const SizedBox(width: 5),
            //                         Text(
            //                             '${controller.restaurant.address}, ${controller.restaurant.city}')
            //                       ]),
            //                       const Spacer(),
            //                       Row(
            //                         children: [
            //                           const Icon(
            //                             Icons.star,
            //                             color: Colors.yellow,
            //                             size: 15,
            //                           ),
            //                           const SizedBox(width: 5),
            //                           Text(controller.restaurant.rating.toString())
            //                         ],
            //                       ),
            //                     ],
            //                   ),
            //                   const Divider(color: Colors.grey),
            //                   const SizedBox(
            //                     height: 10,
            //                   ),
            //                   const Align(
            //                     alignment: Alignment.center,
            //                     child: Text(
            //                       'Categories',
            //                       style: TextStyle(fontWeight: FontWeight.bold),
            //                     ),
            //                   ),
            //                   const SizedBox(
            //                     height: 10,
            //                   ),
            //                   ListView.builder(
            //                       shrinkWrap: true,
            //                       physics: const NeverScrollableScrollPhysics(),
            //                       itemCount:
            //                           controller.restaurant.categories.length,
            //                       itemBuilder: (_, index) {
            //                         return Align(
            //                           alignment: Alignment.center,
            //                           child: Text(controller
            //                               .restaurant.categories[index].name),
            //                         );
            //                       }),
            //                   const Divider(color: Colors.grey),
            //                   const SizedBox(
            //                     height: 10,
            //                   ),
            //                   const Align(
            //                     alignment: Alignment.center,
            //                     child: Text(
            //                       'Description',
            //                       style: TextStyle(fontWeight: FontWeight.bold),
            //                     ),
            //                   ),
            //                   const SizedBox(
            //                     height: 10,
            //                   ),
            //                   Text(controller.restaurant.description),
            //                   const Divider(
            //                     color: Colors.grey,
            //                   ),
            //                   const SizedBox(
            //                     height: 10,
            //                   ),
            //                   const Align(
            //                     alignment: Alignment.center,
            //                     child: Text(
            //                       'Menu',
            //                       style: TextStyle(fontWeight: FontWeight.bold),
            //                     ),
            //                   ),
            //                   const SizedBox(height: 10),
            //                   Row(
            //                     crossAxisAlignment: CrossAxisAlignment.start,
            //                     children: [
            //                       Expanded(
            //                         child: Column(
            //                           children: [
            //                             const Text('Foods:'),
            //                             ListView.builder(
            //                               shrinkWrap: true,
            //                               physics:
            //                                   const NeverScrollableScrollPhysics(),
            //                               itemCount: controller
            //                                   .restaurant.menus.foods.length,
            //                               itemBuilder: (_, index) {
            //                                 return Align(
            //                                   alignment: Alignment.center,
            //                                   child: Text(controller.restaurant
            //                                       .menus.foods[index].name),
            //                                 );
            //                               },
            //                             ),
            //                           ],
            //                         ),
            //                       ),
            //                       Expanded(
            //                           child: Column(
            //                         children: [
            //                           const Text('Drinks:'),
            //                           ListView.builder(
            //                             shrinkWrap: true,
            //                             physics:
            //                                 const NeverScrollableScrollPhysics(),
            //                             itemCount: controller
            //                                 .restaurant.menus.drinks.length,
            //                             itemBuilder: (_, index) {
            //                               return Align(
            //                                 alignment: Alignment.center,
            //                                 child: Text(controller.restaurant.menus
            //                                     .drinks[index].name),
            //                               );
            //                             },
            //                           ),
            //                         ],
            //                       ))
            //                     ],
            //                   ),
            //                   const Divider(color: Colors.grey),
            //                   const SizedBox(
            //                     height: 10,
            //                   ),
            //                   const Align(
            //                     alignment: Alignment.center,
            //                     child: Text(
            //                       'Customer Review',
            //                       style: TextStyle(fontWeight: FontWeight.bold),
            //                     ),
            //                   ),
            //                   ListView.builder(
            //                     physics: const NeverScrollableScrollPhysics(),
            //                     shrinkWrap: true,
            //                     itemCount:
            //                         controller.restaurant.customerReviews.length,
            //                     itemBuilder: (_, index) {
            //                       return Align(
            //                         alignment: Alignment.center,
            //                         child: Column(
            //                           children: [
            //                             const SizedBox(
            //                               height: 10,
            //                             ),
            //                             Text(controller.restaurant
            //                                 .customerReviews[index].name),
            //                             Text(controller.restaurant
            //                                 .customerReviews[index].date),
            //                             Text(controller.restaurant
            //                                 .customerReviews[index].review),
            //                           ],
            //                         ),
            //                       );
            //                     },
            //                   ),
            //                 ],
            //               ),
            //             )
            //           ],
            //         ),
            //       ),
            ),
      ),
    );
  }
}
