import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_masjid/service/responsive_factors.dart';
import 'package:my_masjid/ui/shared_ui/custom_spaces.dart';
import 'package:my_masjid/ui/shared_ui/ms_text.dart';
import 'package:my_masjid/ui/styles/styles.dart';

class PrayerCard extends StatelessWidget {
  PrayerCard(
      {Key? key,
      this.salahName = '',
      this.salahTime = '',
      this.iqamahTime = '',
      this.logo = '',
      this.isCurrentSalah = false})
      : super(key: key);
  final String salahName;
  final String salahTime;
  final String iqamahTime;
  final String logo;
  final bool isCurrentSalah;

  final sizeConfig = Get.put(SizeConfig());

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100 * sizeConfig.screenHeightFactor(),
      width: 335 * sizeConfig.screenWidthFactor(),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        border:
            Border.all(color: isCurrentSalah ? level4 : Colors.white, width: 2),
        color: Colors.white,
      ),
      child: Column(children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Padding(
              padding: EdgeInsets.only(
                  top: 8 * sizeConfig.screenHeightFactor(),
                  right: 8 * sizeConfig.screenWidthFactor()),
              child: Image.asset(
                'assets/icons/notification-main.png',
                height: 13 * sizeConfig.screenHeightFactor(),
                width: 13 * sizeConfig.screenWidthFactor(),
                color: primaryColor,
              ),
              // SvgPicture.asset(
              //   'assets/icons/Maghrib.svg',
              //   semanticsLabel: 'header location',
              //   color: Colors.red,
              //   height: 13 * sizeConfig.screenHeightFactor(),
              //   width: 13 * sizeConfig.screenWidthFactor(),
              // ),
            ),
          ],
        ),
        Padding(
          padding: EdgeInsets.only(
            left: 20 * sizeConfig.screenWidthFactor(),
            // right: 20 * sizeConfig.screenWidthFactor(),
            // bottom: 0 * sizeConfig.screenHeightFactor()
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                width: 95 * sizeConfig.screenWidthFactor(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    //ICON
                    Image.asset(
                      logo,
                      height: 35 * sizeConfig.screenHeightFactor(),
                      width: 35 * sizeConfig.screenWidthFactor(),
                    ),
                    // SvgPicture.asset(
                    //   allowDrawingOutsideViewBox: true,
                    //   logo,
                    //   semanticsLabel: salahName,
                    //   // color: primaryColor //Color(0xFFFFC14C),
                    //   height: 35 * sizeConfig.screenHeightFactor(),
                    //   width: 35 * sizeConfig.screenWidthFactor(),
                    // ),
                    MSText.salahName(salahName)
                  ],
                ),
              ),
              // horizontalSpaceLarge,
              Container(
                color: Colors.grey.shade300,
                height: 45 * sizeConfig.screenHeightFactor(),
                width: 1 * sizeConfig.screenWidthFactor(),
              ),
              //horizontalSpaceRegular,
              horizontalSpace(20),
              SizedBox(
                width: 75 * sizeConfig.screenWidthFactor(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    MSText.salahTimeLabel(
                      salahName == 'Juma\'' ? 'Juma\' 1 Time' : 'Start Time',
                      textColor: level2,
                      textAlign: TextAlign.left,
                    ),
                    verticalSpace(5),
                    // verticalSpaceTiny,
                    MSText.iqamahTime(
                      salahTime,
                      textColor: salahName == 'Juma\'' ? primaryColor : level2,
                    )
                  ],
                ),
              ),
              //horizontalSpaceMedium,
              horizontalSpace(25),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //ICON
                  MSText.salahTimeLabel(
                    salahName == 'Juma\'' ? 'Juma\' 2 Time' : 'Iqamah Time',
                    textColor: level2,
                  ),
                  verticalSpace(5),
                  //verticalSpaceTiny,
                  MSText.iqamahTime(
                    iqamahTime,
                    textColor: primaryColor,
                  )
                ],
              )
            ],
          ),
        ),
      ]),
    );
  }
}
