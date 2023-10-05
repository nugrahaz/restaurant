import 'package:restfood/app/models/restaurant.dart';

class GetListRestaurantResult {
  final bool error;
  final String message;
  final int count;
  final List<Restaurant> restaurants;

  GetListRestaurantResult({
    required this.error,
    required this.message,
    required this.count,
    required this.restaurants,
  });

  factory GetListRestaurantResult.fromJson(Map<String, dynamic> json) =>
      GetListRestaurantResult(
        error: json['error'],
        message: json['message'],
        count: json['count'],
        restaurants: List<Restaurant>.from(
          (json['restaurants'] as List).map((e) => Restaurant.fromJson(e)),
        ),
      );

  Map<String, dynamic> toJson() {
    return {
      "error": error,
      "message": message,
      "count": count,
      "restaurants": restaurants
    };
  }
}
