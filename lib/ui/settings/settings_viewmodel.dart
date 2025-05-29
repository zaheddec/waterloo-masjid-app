import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:my_masjid/service/local_notification_service.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingsViewModel extends GetxController {
  late SharedPreferences sharedPreferences;
  RxBool eventReminder = false.obs;
  RxBool darkMode = false.obs;
  RxBool pushNotifications = false.obs;
  RxBool salahNotifications = false.obs;
  final LocalNotificationService localNotificationService =
      Get.find<LocalNotificationService>();

  @override
  void onInit() async {
    sharedPreferences = await SharedPreferences.getInstance();
    loadSettings();
    super.onInit();
  }

  void loadSettings() {
    eventReminder.value = sharedPreferences.getBool('eventReminder') ?? false;
    darkMode.value = sharedPreferences.getBool('darkMode') ?? false;
    pushNotifications.value =
        sharedPreferences.getBool('pushNotifications') ?? false;
    salahNotifications.value =
        sharedPreferences.getBool('salahNotifications') ?? false;
  }

  void saveSettings() {
    sharedPreferences.setBool('eventReminder', eventReminder.value);
    sharedPreferences.setBool('darkMode', darkMode.value);
    sharedPreferences.setBool('pushNotifications', pushNotifications.value);
    sharedPreferences.setBool('salahNofications', salahNotifications.value);
  }

  void updateSalahNotifications(bool value) async {
    if (value) {
      PermissionStatus status = await Permission.notification.status;
      if (status.isDenied || status.isPermanentlyDenied) {
        // await openAppSettings();
        status = await Permission.notification.request();
      }
      print('Notification permissions granted + $status');
      if (status.isGranted) {
        localNotificationService.init();
        localNotificationService.setSalahNotifications();
      } else {
        // Handle the case where permissions are not granted
        debugPrint('Notification permissions are not granted + $status');
        sharedPreferences.setBool('salahNofications', false);
        salahNotifications.value =
            sharedPreferences.getBool('salahNotifications') ?? false;
      }
    } else {
      localNotificationService.cancelAllNotifications();
    }
    saveSettings();
  }
}
