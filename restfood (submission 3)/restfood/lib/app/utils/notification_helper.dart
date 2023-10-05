import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:restfood/app/utils/navigation.dart';
import 'package:rxdart/rxdart.dart';

import '../models/restaurant.dart';

final selectNotificationSubject = BehaviorSubject<String>();

class NotificationHelper {
  static NotificationHelper? _instance;

  NotificationHelper._internal() {
    _instance = this;
  }

  factory NotificationHelper() => _instance ?? NotificationHelper._internal();

  Future<void> initNotifications(
      FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin) async {
    var initializationSettingsAndroid =
        const AndroidInitializationSettings("app_logo");

    await flutterLocalNotificationsPlugin.initialize(
        InitializationSettings(android: initializationSettingsAndroid),
        onSelectNotification: (payload) async {
      selectNotificationSubject.add(payload ?? "Empty payload");
    });
  }

  Future<void> showNotification(
      FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin,
      Restaurant restaurant) async {
    var channelId = "1";
    var channelName = "channel_01";
    var channelDescription = "Restaurant Channel";

    var androidPlatformChannelSpecifics = AndroidNotificationDetails(
        // icon: '@mipmap/ic_launcher',
        channelId,
        channelName,
        channelDescription: channelDescription,
        importance: Importance.max,
        priority: Priority.high,
        ticker: "Ticker",
        styleInformation: const DefaultStyleInformation(true, true));

    var platformChannelSpecifics = NotificationDetails(
      android: androidPlatformChannelSpecifics,
    );

    var titleNotification = "<b>${restaurant.name}</b>";
    var bodyNotification = restaurant.description;

    await flutterLocalNotificationsPlugin.show(
        0, titleNotification, bodyNotification, platformChannelSpecifics,
        payload: restaurant.id);
  }

  void configureSelectNotificationSubject(String route) {
    selectNotificationSubject.stream.listen((String payload) async {
      Navigation.intentWithData(route, payload);
    });
  }
}
