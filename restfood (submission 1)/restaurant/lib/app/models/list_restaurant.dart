import 'package:restfood/app/models/restaurant.dart';

class ListRestaurant {
  List<Restaurant> restaurants = <Restaurant>[];

  ListRestaurant({
    required this.restaurants,
  });

  factory ListRestaurant.fromJson(Map<String, dynamic> json) => ListRestaurant(
        restaurants: List<Restaurant>.from(
          (json['restaurants'] as List).map((e) => Restaurant.fromJson(e)),
        ),
      );
}
