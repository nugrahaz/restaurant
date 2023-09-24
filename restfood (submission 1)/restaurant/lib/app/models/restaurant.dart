import 'package:restfood/app/models/menu.dart';

class Restaurant {
  final String id;
  final String name;
  final String description;
  final String city;
  final String pictureId;
  final Menu menus;
  final double rating;

  Restaurant({
    required this.id,
    required this.name,
    required this.description,
    required this.city,
    required this.pictureId,
    required this.menus,
    required this.rating,
  });

  factory Restaurant.fromJson(Map<String, dynamic> json) => Restaurant(
        id: json['id'],
        name: json['name'],
        description: json['description'],
        city: json['city'],
        pictureId: json['pictureId'],
        menus: Menu.fromJson(json['menus']),
        rating: json['rating'].toDouble(),
      );
}
