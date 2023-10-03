import 'package:restfood/app/models/category.dart';
import 'package:restfood/app/models/customer_review.dart';
import 'package:restfood/app/models/menu.dart';

class DetailRestaurant {
  final String id;
  final String name;
  final String description;
  final String city;
  final String address;
  final String pictureId;
  final List<Category> categories;
  final Menu menus;
  final double rating;
  final List<CustomerReview> customerReviews;

  DetailRestaurant({
    required this.id,
    required this.name,
    required this.description,
    required this.city,
    required this.address,
    required this.pictureId,
    required this.categories,
    required this.menus,
    required this.rating,
    required this.customerReviews,
  });

  factory DetailRestaurant.fromJson(Map<String, dynamic> json) =>
      DetailRestaurant(
        id: json['id'],
        name: json['name'],
        description: json['description'],
        city: json['city'],
        address: json['address'],
        pictureId: json['pictureId'],
        categories: List<Category>.from(
            (json['categories'] as List).map((e) => Category.fromJson(e))),
        menus: Menu.fromJson(json['menus']),
        rating: json['rating'].toDouble(),
        customerReviews: List<CustomerReview>.from(
            (json['customerReviews'] as List)
                .map((e) => CustomerReview.fromJson(e))),
      );
}
