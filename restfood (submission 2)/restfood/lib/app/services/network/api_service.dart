import 'package:restfood/app/models/get_list_restaurant_result.dart';
import 'package:restfood/app/services/network/api_base_helper.dart';
import 'package:restfood/app/services/network/endpoints.dart';

import '../../models/get_detail_restaurant_result.dart';
import '../../models/search_restaurant_result.dart';

class ApiService {
  final ApiBaseHelper _helper = ApiBaseHelper();

  Future<GetListRestaurantResult> getListRestaurant() async {
    final response = await _helper.get(url: Endpoints.restaurantList);
    if (response == null) {
      throw Exception('Failed to get list  restaurant');
    } else {
      return GetListRestaurantResult.fromJson(response);
    }
  }

  Future<GetDetailRestaurantResult> getDetailRestaurant(String id) async {
    final response = await _helper.get(url: Endpoints.restaurantDetail + id);
    if (response == null) {
      throw Exception('Failed to get detail restaurant');
    } else {
      return GetDetailRestaurantResult.fromJson(response);
    }
  }

  Future<SearchRestaurantResult> getListSearchRestaurant(query) async {
    final response = await _helper.get(url: Endpoints.restaurantSearch + query);
    if (response == null) {
      throw Exception('Failed to get list search restaurants');
    } else {
      return SearchRestaurantResult.fromJson(response);
    }
  }
}
