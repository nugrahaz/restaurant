import 'dart:io';

import 'package:android_alarm_manager_plus/android_alarm_manager_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get_storage/get_storage.dart';
import 'package:restfood/app/constants/constants.dart';
import 'package:restfood/app/utils/background_service.dart';
import 'package:restfood/app/utils/notification_helper.dart';

import 'app.dart';

void main() async {
  await init();
  runApp(const App());
}

Future<void> init() async {
  WidgetsFlutterBinding.ensureInitialized();
  //
  final BackgroundService backgroundService = BackgroundService();
  final NotificationHelper notif = NotificationHelper();
  notif.configureSelectNotificationSubject(AppRoutes.detailPage);
  backgroundService.initializeIsolate();
  //
  if (Platform.isAndroid) {
    await AndroidAlarmManager.initialize();
  }
  //
  await notif.initNotifications(flutterLocalNotificationsPlugin);
  //
  await GetStorage.init();
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  //
}

final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();

Future<void> initNotifications() async {
  const AndroidInitializationSettings androidInitializationSettings =
      AndroidInitializationSettings("app_logo");

  const InitializationSettings initializationSettings = InitializationSettings(
    android: androidInitializationSettings,
  );
  await flutterLocalNotificationsPlugin.initialize(initializationSettings);
}
