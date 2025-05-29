import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_masjid/service/responsive_factors.dart';
import 'package:my_masjid/ui/shared_ui/custom_spaces.dart';
import 'package:my_masjid/ui/styles/styles.dart';

class EventDetailsCard extends StatelessWidget {
  const EventDetailsCard(
      {super.key, required this.height, required this.width});
  final double height;
  final double width;
  @override
  Widget build(BuildContext context) {
    final sizeConfig = Get.find<SizeConfig>();
    return Container(
      height: height, //68,
      width: width, //295,
      decoration: BoxDecoration(
        borderRadius:
            BorderRadius.circular(8 * sizeConfig.screenHeightFactor()),
        // border: Border.all(color: level3, width: 0.5),
        color: const Color(0XFFF2FCFF),
      ),
      child: Padding(
        padding: EdgeInsets.all(10.0 * sizeConfig.screenHeightFactor()),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Image.asset(
                  'assets/icons/timer.png',
                  height: 20 * sizeConfig.screenHeightFactor(),
                  width: 20 * sizeConfig.screenWidthFactor(),
                  // color: primaryColor,
                ),
                horizontalSpace(8),
                Text(style: eventDetailsTime, "26 August . 12.00 PM"),
              ],
            ),
            verticalSpace(6),
            Row(
              children: [
                Image.asset(
                  'assets/icons/eventlocation.png',
                  height: 20 * sizeConfig.screenHeightFactor(),
                  width: 20 * sizeConfig.screenWidthFactor(),
                  // color: primaryColor,
                ),
                horizontalSpace(8),
                Expanded(
                  child: Text(
                      style: eventDetailsLocation,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      "2972 Westheimer Rd. Santa Ana, Canada 85486"),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
