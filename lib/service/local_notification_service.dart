import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:my_masjid/models/salah_model.dart';
import 'package:my_masjid/models/salah_repo.dart';
import 'package:my_masjid/ui/shared_ui/styles.dart';
import 'package:timezone/timezone.dart' as tz;
import 'package:timezone/data/latest.dart' as tz;

class LocalNotificationService {
  // LocalNotificationService();

  final localNotificationService = FlutterLocalNotificationsPlugin();
  Future<void> init() async {
    tz.initializeTimeZones();
    const AndroidInitializationSettings androidInitializationSettings =
        AndroidInitializationSettings('notification_icon');

    var iOSInitializationSettings = DarwinInitializationSettings(
        requestAlertPermission: true,
        requestBadgePermission: true,
        requestSoundPermission: true,
        onDidReceiveLocalNotification: onDidReceiveLocalNotification);

    final InitializationSettings settings = InitializationSettings(
        android: androidInitializationSettings, iOS: iOSInitializationSettings);

    localNotificationService.initialize(
      settings,
      onDidReceiveNotificationResponse:
          (NotificationResponse notificationResponse) async {
        debugPrint('in onrecievenotification ${notificationResponse.id}');
      },
    );
  }

  void onSelectNotification(String? payload) {
    debugPrint('payload : $payload');
  }

  void onDidReceiveLocalNotification(
      int id, String? title, String? body, String? payload) {
    debugPrint('id: $id');
  }

  Future<NotificationDetails> notificationDetails() async {
    const AndroidNotificationDetails androidNotificationDetails =
        AndroidNotificationDetails('chanel_id', 'chanel_name',
            channelDescription: 'description',
            importance: Importance.max,
            priority: Priority.high,
            // color: Color(0xFF003C4B),
            color: primaryColor,
            // icon: '@dawable/notification_icon', //'@mipmap/launcher_icon',
            playSound: true);
    const DarwinNotificationDetails iOSNotificationDetails =
        DarwinNotificationDetails();
    return const NotificationDetails(
        android: androidNotificationDetails, iOS: iOSNotificationDetails);
  }

  Future<void> showNotification(
      {int id = 0, required String title, required String body}) async {
    final details = await notificationDetails();
    await localNotificationService.show(id, title, body, details);
  }

  Future<void> showScheduledNotification(
      {required int id,
      required String title,
      required String body,
      required DateTime notificationTime}) async {
    final details = await notificationDetails();
    await localNotificationService.zonedSchedule(id, title, body,
        tz.TZDateTime.from(notificationTime, tz.local), details,
        // androidAllowWhileIdle: true,
        androidScheduleMode: AndroidScheduleMode.exactAllowWhileIdle,
        uiLocalNotificationDateInterpretation:
            UILocalNotificationDateInterpretation.absoluteTime);
  }

  Future<void> cancelAllNotifications() async {
    await localNotificationService.cancelAll();
  }

  setSalahNotifications() async {
    final salahRepo = SalahRepo();
    debugPrint('notification setting started');
    init();
    await localNotificationService.cancelAll();
    DateTime currentDate;
    SalahTimeModel salah;
    // notificationService.showNotification(
    //     body: 'this is a notification',
    //     id: 1,
    //     title: 'testing local notification');
    // print('salah notification');
    for (var i = 0; i < 11; i++) {
      var salahNum = 1;
      currentDate = DateTime.now().add(Duration(days: i));
      salah = salahRepo.getDailySalah(currentDate);
      //print(DateTime.now().add(Duration(days: i)).toString());
      salah.iqamahTime.forEach((key, value) {
        // create a new time object with less than 10 minutes for 10 minutes before reminder
        DateTime notificationDate = DateTime(
            currentDate.year,
            currentDate.month,
            currentDate.day,
            key == 'Fajr'
                ? int.parse(value.split(':')[0])
                : int.parse(value.split(':')[0]) + 12,
            int.parse(value.split(':')[1]));
        notificationDate =
            notificationDate.subtract(const Duration(minutes: 10));
        // set notification for calculated time > current time and not Jumaa 2
        if (notificationDate.compareTo(DateTime.now()) > 0) {
          debugPrint(
              'notification set for $key at $value on $notificationDate');
          showScheduledNotification(
              id: (i * 5 + salahNum),
              title: '$key at $value',
              body: 'it\'s $key time in Waterloo Masjid and ICW Waterloo!',
              notificationTime: notificationDate);
        }
        salahNum = salahNum + 1;
        //print('$key :$value');
      });
    }
  }
}
