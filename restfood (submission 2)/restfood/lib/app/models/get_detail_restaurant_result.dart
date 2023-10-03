import 'package:restfood/app/models/detail_restaurant.dart';

class GetDetailRestaurantResult {
  final bool error;
  final String message;
  final DetailRestaurant restaurant;

  GetDetailRestaurantResult({
    required this.error,
    required this.message,
    required this.restaurant,
  });

  factory GetDetailRestaurantResult.fromJson(Map<String, dynamic> json) =>
      GetDetailRestaurantResult(
        error: json['error'],
        message: json['message'],
        restaurant: DetailRestaurant.fromJson(json['restaurant']),
      );
}
