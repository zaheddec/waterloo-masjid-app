import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:my_masjid/ui/startup/startup_viewmodel.dart';
import 'package:my_masjid/ui/styles/styles.dart';
import 'package:pwa_update_listener/pwa_update_listener.dart';

class AppStartupView extends StatelessWidget {
  const AppStartupView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(AppStartupViewModel());
    return SafeArea(
      child: Scaffold(
        backgroundColor: primaryColor,
        //appBar: AppBar(title: const Text('My Salah times')),
        body: PwaUpdateListener(
          onReady: () {
            /// Show a snackbar to get users to reload into a newer version
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Row(
                  children: [
                    const Expanded(child: Text('A new update is ready')),
                    TextButton(
                      onPressed: () {
                        reloadPwa();
                      },
                      child: const Text('UPDATE'),
                    ),
                  ],
                ),
                duration: const Duration(days: 365),
                behavior: SnackBarBehavior.floating,
              ),
            );
          },
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SvgPicture.asset(
                'assets/splash/header.svg',
                semanticsLabel: 'splash header',
              ),
              SvgPicture.asset(
                'assets/splash/start_logo.svg',
                semanticsLabel: 'splash logo',
                color: level6,
              ),
              SvgPicture.asset(
                'assets/splash/footer.svg',
                semanticsLabel: 'splash footer',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
