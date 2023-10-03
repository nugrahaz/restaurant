import 'package:restfood/app/models/drink.dart';
import 'package:restfood/app/models/food.dart';

class Menu {
  final List<Food> foods;
  final List<Drink> drinks;

  Menu({required this.foods, required this.drinks});

  factory Menu.fromJson(Map<String, dynamic> json) => Menu(
        foods: List<Food>.from(
            (json['foods'] as List).map((e) => Food.fromJson(e))),
        drinks: List<Drink>.from(
            (json['drinks'] as List).map((e) => Drink.fromJson(e))),
      );
}
