import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:restfood/app/models/list_restaurant.dart';

class ApiService {
  Future<ListRestaurant> getListRestaurant() async {
    final String response =
        await rootBundle.loadString('assets/json/local_restaurant.json');
    final data = await json.decode(response);
    return ListRestaurant.fromJson(data);
  }
}
