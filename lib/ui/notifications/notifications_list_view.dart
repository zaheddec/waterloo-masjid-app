import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:my_masjid/service/responsive_factors.dart';
import 'package:my_masjid/ui/notifications/event_details_card_view.dart';
import 'package:my_masjid/ui/shared_ui/custom_spaces.dart';
import 'package:my_masjid/ui/shared_ui/ms_text.dart';
import 'package:my_masjid/ui/styles/styles.dart';

class NotificationsList extends StatelessWidget {
  const NotificationsList({Key? key}) : super(key: key);
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
              MSText.screenHeader("Notifications"),
            ],
          ),
          verticalSpace(10),
          const Divider(),
          Expanded(
            child: ListView(
              children: [
                verticalSpace(10),
                const EventCard(),
                verticalSpace(10),
                const EventCard(),
                verticalSpace(10),
                const EventCard(),
              ],
            ),
          ),
        ]
            // verticalSpaceLarge,
            ),
      ),
    ));
  }
}

class EventCard extends StatelessWidget {
  const EventCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 165 * sizeConfig.screenHeightFactor(),
      width: 335 * sizeConfig.screenHeightFactor(),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
            color: const Color(0XFFDBE9F5),
            width: 0.5 * sizeConfig.screenWidthFactor()),
        color: Colors.white,
      ),
      child: Padding(
        padding: EdgeInsets.all(20.0 * sizeConfig.screenWidthFactor()),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(style: eventHeader, "Event Title Here"),
            verticalSpace(4),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(style: eventPoster, 'By My Salah App'),
                Text(style: eventPoster, 'Posted Today')
              ],
            ),
            verticalSpace(12),
            EventDetailsCard(
              height: 68 * sizeConfig.screenHeightFactor(),
              width: 295 * sizeConfig.screenWidthFactor(),
            ),
          ],
        ),
      ),
    );
  }
}
