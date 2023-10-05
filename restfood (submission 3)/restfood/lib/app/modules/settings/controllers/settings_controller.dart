import 'package:android_alarm_manager_plus/android_alarm_manager_plus.dart';
import 'package:get/get.dart';
import 'package:restfood/app/services/local/storage_service.dart';
import 'package:restfood/app/utils/background_service.dart';

import '../../../utils/utils.dart';

class SettingsController extends GetxController {
  static SettingsController to = Get.find();

  RxBool _isScheduled = false.obs;

  bool get getScheduled => _isScheduled.value;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    _isScheduled.value = StorageServices().readSchedule();
  }

  Future<bool> scheduledNotification(bool value) async {
    _isScheduled.value = value;
    StorageServices().saveSchedule(value);
    if (_isScheduled.value == true) {
      return await AndroidAlarmManager.periodic(
          const Duration(hours: 24), 1, BackgroundService.callback,
          startAt: DateTimeHelper.format(), exact: true, wakeup: true);
    } else {
      return await AndroidAlarmManager.cancel(1);
    }
  }
}
