import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:my_masjid/service/responsive_factors.dart';
import 'package:my_masjid/ui/notifications/event_details_card_view.dart';
import 'package:my_masjid/ui/shared_ui/custom_spaces.dart';
import 'package:my_masjid/ui/shared_ui/ms_text.dart';
import 'package:my_masjid/ui/styles/styles.dart';

class DetailedNotification extends StatelessWidget {
  const DetailedNotification({super.key});
  @override
  Widget build(BuildContext context) {
    List<String> posters = [
      'poster1.png',
      'poster2.png',
      'poster1.png',
      'poster2.png'
    ];
    final sizeConfig = Get.find<SizeConfig>();
    return Scaffold(
      body: Column(
        children: [
          DetailedNotificationHeader(sizeConfig: sizeConfig),
          Padding(
            padding: EdgeInsets.fromLTRB(20 * sizeConfig.screenWidthFactor(), 0,
                20 * sizeConfig.screenWidthFactor(), 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                verticalSpace(20),
                MSText.detailedEventHeader(
                  "Event Title Here",
                  textColor: primaryColor,
                ),
                verticalSpace(7),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(style: eventPoster, "By My Salah"),
                    Text(style: eventPoster, "Posted Today")
                  ],
                ),
                //const Divider(),
                verticalSpace(15),
                EventDetailsCard(
                  height: 68 * sizeConfig.screenHeightFactor(),
                  width: 335 * sizeConfig.screenWidthFactor(),
                ),
                verticalSpace(21),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    MSText.detailEventSubHeader("Description"),
                    verticalSpace(8),
                    SizedBox(
                      width: 335,
                      height: 133,
                      child: SingleChildScrollView(
                        child: MSText.detailEventBody(
                            "Product development and Implementation of Islamic financial products Ensuring Shariah compliance in Islamic financial instruments Sukuk: development, issues and challenges Islamic gold account and in making an investment. Product development and Implementation of Islamic financial products Ensuring Shariah compliance in Islamic financial instruments Sukuk: development, issues and challenges Islamic gold account and in making an investment."),
                      ),
                    ),
                    verticalSpace(21),
                    MSText.detailEventSubHeader("Posters"),
                    verticalSpace(12),
                    SizedBox(
                      height: 152 * sizeConfig.screenHeightFactor(),
                      // width: 335,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: posters.length,
                        itemBuilder: (context, index) {
                          return Row(
                            children: [
                              Image.asset(
                                'assets/images/${posters[index]}',
                                //height: 180 * sizeConfig.screenHeightFactor(),
                                // width: 56 * sizeConfig.screenWidthFactor(),
                                // color: primaryColor,
                              ),
                              horizontalSpace(5),
                            ],
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
      // verticalSpaceLarge,
    );
  }
}

class DetailedNotificationHeader extends StatelessWidget {
  const DetailedNotificationHeader({
    super.key,
    required this.sizeConfig,
  });

  final SizeConfig sizeConfig;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 249 * sizeConfig.screenHeightFactor(),
      width: 375 * sizeConfig.screenWidthFactor(),
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/images/masjid.png"),
          fit: BoxFit.cover,
        ),
      ),
      child: Padding(
        padding: EdgeInsets.fromLTRB(22 * sizeConfig.screenWidthFactor(), 0,
            24 * sizeConfig.screenWidthFactor(), 0),
        child: Column(children: [
          verticalSpace(50),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  SvgPicture.asset(
                    'assets/icons/arrow-left.svg',
                    semanticsLabel: 'left arrow',
                    color: level9,
                    height: 24 * sizeConfig.screenHeightFactor(),
                    width: 24 * sizeConfig.screenWidthFactor(),
                  ),
                  horizontalSpace(10),
                  MSText.screenHeader(
                    "Go Back",
                    textColor: level9,
                  ),
                ],
              ),
              Row(
                children: [
                  SvgPicture.asset(
                    'assets/icons/share.svg',
                    semanticsLabel: 'share event',
                    color: level9,
                    height: 24 * sizeConfig.screenHeightFactor(),
                    width: 24 * sizeConfig.screenWidthFactor(),
                  ),
                  horizontalSpace(15),
                  SvgPicture.asset(
                    'assets/icons/stickynote.svg',
                    semanticsLabel: 'calendar',
                    color: level9,
                    height: 24 * sizeConfig.screenHeightFactor(),
                    width: 24 * sizeConfig.screenWidthFactor(),
                  ),
                ],
              )
            ],
          ),
        ]),
      ),
    );
  }
}
