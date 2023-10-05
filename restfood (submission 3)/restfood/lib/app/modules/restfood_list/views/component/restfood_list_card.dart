import 'package:auto_size_text/auto_size_text.dart';
import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:restfood/app/constants/constants.dart';
import 'package:restfood/app/models/restaurant.dart';
import 'package:restfood/app/utils/utils.dart';

import '../../../../services/network/endpoints.dart';

class RestFoodListCard extends StatelessWidget {
  const RestFoodListCard({
    Key? key,
    required this.restaurant,
  }) : super(key: key);

  final Restaurant restaurant;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(5.0.wp),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(3.0.wp),
        color: AppStyles.colors.white,
      ),
      child: Row(
        children: [
          ImageWithRating(restaurant: restaurant),
          SizedBox(
            width: 3.0.wp,
          ),
          Expanded(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  restaurant.name,
                  style: AppStyles.textStyles.poppinsSemiBold.copyWith(
                      color: AppStyles.colors.bgDark, fontSize: 4.0.wp),
                ),
                SizedBox(
                  height: 1.5.wp,
                ),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      Icons.location_on_rounded,
                      color: AppStyles.colors.bgDark,
                      size: 2.0.wp,
                    ),
                    SizedBox(
                      width: 1.0.wp,
                    ),
                    Text(
                      restaurant.city,
                      style: AppStyles.textStyles.poppinsSemiBold.copyWith(
                          color: AppStyles.colors.bgDark, fontSize: 3.0.wp),
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 0.5.wp),
                  child: const AutoSizeText(
                    "- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -",
                    maxLines: 1,
                  ),
                ),
                Text(
                  restaurant.description,
                  style: AppStyles.textStyles.poppinsSemiBold.copyWith(
                      color: AppStyles.colors.bgDark.withOpacity(0.875),
                      fontSize: 2.6.wp),
                  maxLines: 2,
                  textAlign: TextAlign.justify,
                  overflow: TextOverflow.clip,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ImageWithRating extends StatelessWidget {
  const ImageWithRating({
    Key? key,
    required this.restaurant,
  }) : super(key: key);

  final Restaurant restaurant;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 30.0.wp,
      child: Stack(
        alignment: Alignment.bottomCenter,
        clipBehavior: Clip.none,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(3.5.wp),
            child: AspectRatio(
                aspectRatio: 4 / 3,
                child: ExtendedImage.network(
                  Endpoints.getImage + restaurant.pictureId,
                  fit: BoxFit.cover,
                  cache: true,
                  border: Border.all(color: Colors.white, width: 1.0),
                )),
          ),
          Positioned(
            bottom: -2.0.wp,
            child: Container(
              padding: EdgeInsets.symmetric(
                vertical: 1.25.wp,
                horizontal: 2.0.wp,
              ),
              decoration: BoxDecoration(
                color: AppStyles.colors.white,
                borderRadius: BorderRadius.circular(2.25.wp),
                boxShadow: AppStyles.shadows.softShadow,
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    Icons.star_rounded,
                    color: Colors.orangeAccent,
                    size: 4.0.wp,
                  ),
                  SizedBox(
                    width: 0.5.wp,
                  ),
                  Text(
                    restaurant.rating.toStringAsFixed(1),
                    style: AppStyles.textStyles.poppinsMedium,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
