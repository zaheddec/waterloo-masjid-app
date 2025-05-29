import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
// import 'package:my_masjid/service/local_notification_service.dart';

class PushNotificationService {
  Future initialise() async {
    // this can asked only for iOS and web
    FirebaseMessaging messaging = FirebaseMessaging.instance;
    NotificationSettings settings = await messaging.requestPermission(
      alert: true,
      announcement: false,
      badge: true,
      carPlay: false,
      criticalAlert: false,
      provisional: false,
      sound: true,
    );
    debugPrint('User granted permission: ${settings.authorizationStatus}');

    var token = await messaging.getToken();
    debugPrint('get token');
    // // if (settings.authorizationStatus == AuthorizationStatus.authorized) {
    // //   print("token :   " + token!);
    // // }

    await updateToken(token);

    // db.collection('/notifications/events/tokens')

    // To send to topic
    // FirebaseMessaging.instance.subscribeToTopic('salah_time');

    // check why do we need this callback and if we need to call get cloud data
    FirebaseMessaging.instance.getInitialMessage().then((message) async {
      if (message != null) {
        final routeFromNotification = message.data['route'];
        debugPrint('called in getInitialMessage');
        debugPrint(routeFromNotification);
        // await _recentCars.getCloudData();
        // Get.offAllNamed("/home");
      }
    });

    // when app is opened
    FirebaseMessaging.onMessage.listen((message) async {
      debugPrint(message.notification!.title);
      debugPrint(message.notification!.body);
      debugPrint('in app opened state');
      // LocalNotificationService().showNotification(title:message.notification!.title, body: message.notification!.body) ;
      Get.offAllNamed("/home");
      // add new cars
    });

    // when app is closed or in background
    FirebaseMessaging.onMessageOpenedApp.listen((message) async {
      final routeFromNotification = message.data['route'];
      debugPrint('Called in onMessageOpen');
      debugPrint(routeFromNotification);
      Get.offAllNamed("/home");
      // get all cars
    });
  }

//Add token to db for push notifications
  Future<void> updateToken(String? token) async {
    debugPrint("token :   ${token!}");

    // write token to firestore
    var db = FirebaseFirestore.instance;
    QuerySnapshot lastestDocument = await db
        .collection("/notifications/events/tokens/")
        .orderBy("last_updated", descending: true)
        .limit(1)
        .get();

    if (lastestDocument.docs[0].exists) {
      debugPrint(lastestDocument.docs[0].id);
      var data = lastestDocument.docs[0].data() as Map<String, dynamic>;
      var tokenList = data['tokens'];
      debugPrint('tokenList: $tokenList');

      // check if the token is in list already
      // this need to be checked all over the lists or make sure tokens are unique on cloud before sending messages
      // if list have more than 5000 tokens create a new document

      if (tokenList.length < 5000) {
        tokenList.add(token);

        final docData = {
          'last_updated': Timestamp.now(),
          'tokens': tokenList,
        };
        db
            .collection("/notifications/events/tokens/")
            .doc(lastestDocument.docs[0].id)
            .update(docData)
            .onError((e, _) => print("Error writing document: $e"));
      } else {
        tokenList.clear();
        tokenList.add(token);
        final docData = {
          'last_updated': Timestamp.now(),
          'tokens': tokenList,
        };
        db.collection("/notifications/events/tokens/").add(docData);
      }

      // db.collection('/notifications/events/tokens')
    } else {
      debugPrint('No data available.');
    }
  }
}
