import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:get/get.dart';
// import 'package:my_masjid/service/local_notification_service.dart';

class PushNotificationService {
  Future initialise() async {
    // this can asked only for iOS and web
    // FirebaseMessaging messaging = FirebaseMessaging.instance;
    // NotificationSettings settings = await messaging.requestPermission(
    //   alert: true,
    //   announcement: false,
    //   badge: true,
    //   carPlay: false,
    //   criticalAlert: false,
    //   provisional: false,
    //   sound: true,
    // );
    // print('User granted permission: ${settings.authorizationStatus}');

    // To send to topic
    FirebaseMessaging.instance.subscribeToTopic('salah_time');

    // check why do we need this callback and if we need to call get cloud data
    FirebaseMessaging.instance.getInitialMessage().then((message) async {
      if (message != null) {
        final routeFromNotification = message.data['route'];
        print('called in getInitialMessage');
        print(routeFromNotification);
        // await _recentCars.getCloudData();
        // Get.offAllNamed("/home");
      }
    });

    // when app is opened
    FirebaseMessaging.onMessage.listen((message) async {
      print(message.notification!.title);
      print(message.notification!.body);
      print('in app opened state');
      // LocalNotificationService().showNotification(title:message.notification!.title, body: message.notification!.body) ;
      Get.offAllNamed("/home");
      // add new cars
    });

    // when app is closed or in background
    FirebaseMessaging.onMessageOpenedApp.listen((message) async {
      final routeFromNotification = message.data['route'];
      print('Called in onMessageOpen');
      print(routeFromNotification);
      Get.offAllNamed("/home");
      // get all cars
    });
  }
}
