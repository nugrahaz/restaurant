import 'package:auto_size_text/auto_size_text.dart';
import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:restfood/app/utils/utils.dart';

import '../../../constants/constants.dart';
import '../../../models/restaurant.dart';

class RestaurantDetailPage extends StatefulWidget {
  final Restaurant restaurant;
  const RestaurantDetailPage({super.key, required this.restaurant});

  @override
  State<RestaurantDetailPage> createState() => _RestaurantDetailPageState();
}

class _RestaurantDetailPageState extends State<RestaurantDetailPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
          child: SingleChildScrollView(
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
                      widget.restaurant.pictureId,
                      cache: true,
                      fit: BoxFit.fill,
                      borderRadius:
                          // ignore: prefer_const_constructors
                          BorderRadius.all(Radius.circular(30.0)),
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
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(widget.restaurant.name,
                                style: AppStyles.textStyles.poppinsMedium
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
                                Text(widget.restaurant.city,
                                    style: AppStyles.textStyles.poppinsBold
                                        .copyWith(
                                            color: AppStyles.colors.bgDark
                                                .withOpacity(0.5))),
                              ],
                            ),
                          ],
                        ),
                      ),
                      SizedBox(width: 2.0.wp),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(height: 1.5.wp),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                '${widget.restaurant.rating}',
                                style: Theme.of(context).textTheme.bodyLarge,
                              ),
                              const SizedBox(width: 4),
                              RatingBarIndicator(
                                rating: widget.restaurant.rating,
                                itemBuilder: (context, index) => const Icon(
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
                            style: AppStyles.textStyles.poppinsBold.copyWith(
                                color: AppStyles.colors.bgDark.withOpacity(0.6),
                                fontSize: 3.5.wp),
                          ),
                        ],
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
                    widget.restaurant.description,
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
                    children: widget.restaurant.menus.foods
                        .map(
                          (food) => Chip(
                            label: Text(
                              food.name,
                              style: const TextStyle(color: Colors.white),
                            ),
                            backgroundColor: AppStyles.colors.bgDark,
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
                    children: widget.restaurant.menus.drinks
                        .map(
                          (food) => Chip(
                            label: Text(
                              food.name,
                              style: const TextStyle(color: Colors.white),
                            ),
                            backgroundColor: AppStyles.colors.bgDark,
                          ),
                        )
                        .toList(),
                  ),
                ],
              ),
            ),
          ],
        ),
      )),
    );
  }
}
