import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:my_masjid/service/responsive_factors.dart';
import 'package:my_masjid/ui/settings/settings_viewmodel.dart';
import 'package:my_masjid/ui/shared_ui/custom_spaces.dart';
import 'package:my_masjid/ui/shared_ui/ms_text.dart';
import 'package:my_masjid/ui/styles/styles.dart';

class Settings extends StatelessWidget {
  Settings({super.key});
  final viewModel = Get.put(SettingsViewModel());
  @override
  Widget build(BuildContext context) {
    final sizeConfig = Get.find<SizeConfig>();
    return Scaffold(
        body: SafeArea(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
        child: Column(children: [
          verticalSpace(24),
          Row(
            children: [
              GestureDetector(
                child: SvgPicture.asset(
                  'assets/icons/arrow-left.svg',
                  semanticsLabel: 'left arrow',
                  color: primaryColor,
                  height: 24 * sizeConfig.screenHeightFactor(),
                  width: 24 * sizeConfig.screenWidthFactor(),
                ),
                onTap: () => Get.back(),
              ),
              horizontalSpace(10),
              MSText.screenHeader("Settings"),
            ],
          ),
          verticalSpace(10),
          const Divider(),
          Obx(
            () => Expanded(
              child: ListView(
                children: [
                  verticalSpace(34),
                  const SettingsCard(
                    icon: 'assets/icons/menu-board.png',
                    title: 'Event Reminder',
                    subTitle: 'Remind me of upcoming events',
                  ),
                  verticalSpace(34),
                  const SettingsCard(
                    icon: 'assets/icons/moon.png',
                    title: 'Switch to dark mode',
                    subTitle: 'Save your eyes from strain',
                  ),
                  verticalSpace(34),
                  SettingsCard(
                    icon: 'assets/icons/notification-settings.png',
                    title: 'Salah Notifications',
                    subTitle: 'Get notified of iqamah times',
                    switchFunc: (value) {
                      viewModel.sharedPreferences
                          .setBool('salahNotifications', value);
                      viewModel.loadSettings();
                      viewModel.updateSalahNotifications(value);
                    },
                    switchValue: viewModel.salahNotifications.value,
                  ),
                ],
              ),
            ),
          ),
        ]
            // verticalSpaceLarge,
            ),
      ),
    ));
  }
}

class SettingsCard extends StatelessWidget {
  const SettingsCard(
      {super.key,
      this.icon,
      this.switchFunc,
      this.title,
      this.subTitle,
      this.switchValue});
  final String? icon;
  final Function? switchFunc;
  final String? title;
  final String? subTitle;
  final bool? switchValue;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Image.asset(
              icon ?? 'assets/icons/menu-board.png',
              height: 24 * sizeConfig.screenHeightFactor(),
              width: 24 * sizeConfig.screenWidthFactor(),
              // color: primaryColor,
            ),
            horizontalSpace(12),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(style: eventHeader, title ?? "Event Title Here"),
                verticalSpace(2),
                Text(
                    style: eventPoster,
                    subTitle ?? 'Lorem Ipsum dolor sit amet'),
              ],
            ),
          ],
        ),
        SizedBox(
          height: 22 * sizeConfig.screenHeightFactor(),
          width: 44 * sizeConfig.screenWidthFactor(),
          child: FittedBox(
            fit: BoxFit.contain,
            child: CupertinoSwitch(
              value: switchValue ?? false,
              onChanged: (value) {
                switchFunc!(value);
                // print(value);
              },
              activeColor: primaryColor,
              // color of the round icon, which moves from right to left
              thumbColor: level9,
              // when the switch is off
              // trackColor: Colors.black12,
            ),
          ),
        ),
      ],
    );
  }
}
