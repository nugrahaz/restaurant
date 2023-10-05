import 'dart:math';
import 'dart:ui';
import 'dart:isolate';

import 'package:restfood/app/services/network/api_service.dart';
import 'package:restfood/app/utils/notification_helper.dart';
import 'package:restfood/main.dart';

final ReceivePort port = ReceivePort();

class BackgroundService {
  static BackgroundService? _instance;
  static const String _isolateName = "isolate";
  static SendPort? _uiSendPort;

  BackgroundService._internal() {
    _instance = this;
  }

  factory BackgroundService() => _instance ?? BackgroundService._internal();

  void initializeIsolate() {
    IsolateNameServer.registerPortWithName(port.sendPort, _isolateName);
  }

  static Future<void> callback() async {
    final NotificationHelper notificationHelper = NotificationHelper();

    final ApiService apiService = ApiService();
    var restaurantsResult = await apiService.getListRestaurant();
    var restaurants = restaurantsResult.restaurants;

    var randomIndex = Random().nextInt(restaurants.length);
    var randomRestaurant = restaurants[randomIndex];
    await notificationHelper.showNotification(
        flutterLocalNotificationsPlugin, randomRestaurant);

    _uiSendPort ??= IsolateNameServer.lookupPortByName(_isolateName);
    _uiSendPort?.send(null);
  }
}
