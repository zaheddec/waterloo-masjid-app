import 'dart:ui';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:my_masjid/service/responsive_factors.dart';
import 'package:my_masjid/ui/home/home_view.dart';
import 'package:my_masjid/ui/notifications/detailed_notification_view.dart';
import 'package:my_masjid/ui/notifications/notifications_list_view.dart';
import 'package:my_masjid/ui/settings/settings_view.dart';
import 'package:my_masjid/ui/startup/startup_view.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((_) {
    runApp(const MyApp());
  });
  //runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SizeConfig sizeConfig = Get.put(SizeConfig(), permanent: true);
    sizeConfig.screenHeight = window.physicalSize.height;
    sizeConfig.screenWidth = window.physicalSize.width;
    sizeConfig.pixelDensity = WidgetsBinding.instance.window.devicePixelRatio;
    print(
        "SCREEN HEIGHT: ${sizeConfig.screenHeight}, SCREEN WIDTH: ${sizeConfig.screenWidth}");
    print(
        "HEIGHT FACTOR: ${sizeConfig.screenHeightFactor()}, WIDTH FACTOR: ${sizeConfig.screenWidthFactor()}");
    print("ui.Window device pixel ratio: ${sizeConfig.pixelDensity}");

    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        textTheme: GoogleFonts.interTextTheme(
          Theme.of(context).textTheme,
        ),
      ),
      getPages: [
        GetPage(name: '/appStartup', page: () => const AppStartupView()),
        GetPage(name: '/home', page: () => HomePage()),
        GetPage(name: '/notifications', page: () => const NotificationsList()),
        GetPage(
          name: '/detailNotification',
          page: () => const DetailedNotification(),
        ),
        GetPage(
          name: '/settings',
          page: () => const Settings(),
        )
      ],
      initialRoute: '/appStartup',
    );
  }
}
