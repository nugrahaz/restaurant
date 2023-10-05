import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:restfood/app/models/get_list_restaurant_result.dart';
import 'package:restfood/app/services/network/endpoints.dart';

import '../../models/get_detail_restaurant_result.dart';
import '../../models/search_restaurant_result.dart';

class ApiService {
  http.Client? client;

  ApiService({this.client}) {
    client ??= http.Client();
  }

  // final ApiBaseHelper _helper = ApiBaseHelper();

  Future<GetListRestaurantResult> getListRestaurant() async {
    final response = await client!.get(Uri.parse(Endpoints.restaurantList));
    if (response.statusCode == 200) {
      return GetListRestaurantResult.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to get list  restaurant');
    }
  }

  Future<GetDetailRestaurantResult> getDetailRestaurant(String id) async {
    final response =
        await client!.get(Uri.parse(Endpoints.restaurantDetail + id));
    if (response.statusCode == 200) {
      return GetDetailRestaurantResult.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to get detail  restaurant');
    }
  }

  Future<SearchRestaurantResult> getListSearchRestaurant(query) async {
    final response =
        await client!.get(Uri.parse(Endpoints.restaurantSearch + query));
    if (response.statusCode == 200) {
      return SearchRestaurantResult.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to get list search restaurants');
    }
  }
}
