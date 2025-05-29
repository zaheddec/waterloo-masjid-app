import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:my_masjid/firebase_options.dart';
import 'package:my_masjid/models/salah_repo.dart';
import 'package:my_masjid/service/daily_salah_service.dart';
import 'package:my_masjid/service/local_notification_service.dart';
import 'package:my_masjid/service/push_notification_service.dart';

Future<void> backgroundHandler(RemoteMessage message) async {
  // print(message.data.toString());
  // print(message.notification!.title);
}

class AppStartupViewModel extends GetxController {
  @override
  onInit() async {
    super.onInit();
    await Hive.initFlutter();
    await Hive.openBox<Map<dynamic, dynamic>>('myMasjid');
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
    // initialize repos
    Get.put(SalahService(), permanent: true);
    Get.put(SalahRepo(), permanent: true);
    Get.put(LocalNotificationService(), permanent: true);

    // get background handler to work
    FirebaseMessaging.onBackgroundMessage(backgroundHandler);
    // pushnotification service start
    final pushNorifiation = Get.put(PushNotificationService(), permanent: true);
    pushNorifiation.initialise();
    // LocalNotificationService.initialize();
    Get.offAllNamed("/home");
    // Get.offAllNamed('/notifications');
  }
}
