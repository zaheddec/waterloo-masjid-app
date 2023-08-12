import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:my_masjid/service/responsive_factors.dart';
import 'package:my_masjid/ui/home/home_viewmodel.dart';
import 'package:my_masjid/ui/shared_ui/custom_spaces.dart';
import 'package:my_masjid/ui/shared_ui/ms_text.dart';
import 'package:my_masjid/ui/styles/spaces.dart';
import 'package:my_masjid/ui/styles/styles.dart';
import 'prayer_card_view.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  final _viewModel = Get.put(SalahHomeViewModel());
  final PageController pageController = PageController(initialPage: 365);
  @override
  Widget build(BuildContext context) {
    // print('does it finds the value');
    return Scaffold(
        backgroundColor: const Color(0XFFF5F5F5),
        body: Column(
          children: [
            Obx(() => HomeHeader(
                pageController: pageController,
                date: _viewModel.currentDay.value,
                day: _viewModel.currentDayInWeek.value)),
            Expanded(
              child: PageView.builder(
                  controller: pageController,
                  itemBuilder: (context, position) {
                    final currentPosition = position - 365;
                    _viewModel.getDailySalahTime(
                        DateTime.now().add(Duration(days: currentPosition)));
                    return Column(
                      children: [
                        verticalSpace(50),
                        // verticalSpaceLarge,
                        PrayerCard(
                          salahName: 'Fajr',
                          salahTime:
                              _viewModel.salah.value.salahStartTime['Fajr'],
                          iqamahTime: _viewModel.salah.value.iqamahTime['Fajr'],
                          logo: 'assets/icons/fajr.png',
                          isCurrentSalah:
                              _viewModel.currentSalah.value == 'Fajr',
                        ),
                        verticalSpace(10),
                        PrayerCard(
                          salahName: _viewModel.salah.value.iqamahTime
                                  .containsKey('Dohor')
                              ? 'Dohr'
                              : 'Juma\'',
                          salahTime: _viewModel.salah.value.iqamahTime
                                  .containsKey('Dohor')
                              ? _viewModel.salah.value.salahStartTime['Dohor']
                              : _viewModel.salah.value.iqamahTime['Jumaa 1'],
                          iqamahTime: _viewModel.salah.value.iqamahTime
                                  .containsKey('Dohor')
                              ? _viewModel.salah.value.iqamahTime['Dohor']
                              : _viewModel.salah.value.iqamahTime['Jumaa 2'],
                          logo: 'assets/icons/Dohr.png',
                          isCurrentSalah:
                              _viewModel.currentSalah.value == 'Dohor' ||
                                  _viewModel.currentSalah.value == 'Jumaa 1' ||
                                  _viewModel.currentSalah.value == 'Jumaa 2',
                        ),
                        verticalSpace(10),
                        // verticalSpaceSmall,
                        PrayerCard(
                          salahName: 'Asr',
                          salahTime:
                              _viewModel.salah.value.salahStartTime['Asr'],
                          iqamahTime: _viewModel.salah.value.iqamahTime['Asr'],
                          logo: 'assets/icons/Asr.png',
                          isCurrentSalah:
                              _viewModel.currentSalah.value == 'Asr',
                        ),
                        verticalSpace(10),
                        // verticalSpaceSmall,
                        PrayerCard(
                          salahName: 'Maghrib',
                          salahTime:
                              _viewModel.salah.value.salahStartTime['Maghrib'],
                          iqamahTime:
                              _viewModel.salah.value.iqamahTime['Maghrib'],
                          logo: 'assets/icons/Maghrib.png',
                          isCurrentSalah:
                              _viewModel.currentSalah.value == 'Maghrib',
                        ),
                        verticalSpace(10),
                        // verticalSpaceSmall,
                        PrayerCard(
                          salahName: 'Isha',
                          salahTime:
                              _viewModel.salah.value.salahStartTime['Isha'],
                          iqamahTime: _viewModel.salah.value.iqamahTime['Isha'],
                          logo: 'assets/icons/Isha.png',
                          isCurrentSalah:
                              _viewModel.currentSalah.value == 'Isha',
                        ),
                      ],
                    );
                  }),
            ),
          ],
        ));
  }
}

class HomeHeader extends StatelessWidget {
  // final _viewModel = Get.put(SalahHomeViewModel());
  final String date;
  final String day;
  final PageController? pageController;
  final sizeConfig = Get.find<SizeConfig>();

  HomeHeader({
    Key? key,
    this.date = '',
    this.day = '',
    this.pageController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
            color: primaryColor,
            height: 174 * sizeConfig.screenHeightFactor(),
            width: 375 * sizeConfig.screenWidthFactor()),
        SvgPicture.asset(
          'assets/splash/header.svg',
          semanticsLabel: 'splash header',
          color: level2,
        ),
        Padding(
          padding: EdgeInsets.fromLTRB(
              20 * sizeConfig.screenWidthFactor(),
              60 * sizeConfig.screenHeightFactor(),
              20 * sizeConfig.screenWidthFactor(),
              0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(children: [
                SvgPicture.asset(
                  'assets/splash/start_logo.svg',
                  semanticsLabel: 'splash header',
                  // color: level2,
                  height: 33 * sizeConfig.screenHeightFactor(),
                  width: 33 * sizeConfig.screenWidthFactor(),
                ),
                horizontalSpaceSmall,
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    MSText.header(
                      'Waterloo Masjid',
                      textColor: Colors.white,
                    ),
                    verticalSpaceTiny,
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(right: 9.0),
                          child: Image.asset(
                            'assets/icons/location.png',
                            height: 13 * sizeConfig.screenHeightFactor(),
                            width: 13 * sizeConfig.screenWidthFactor(),
                            // color: primaryColor,
                          ),
                          // SvgPicture.asset(
                          //   'assets/icons/location.svg',
                          //   semanticsLabel: 'header location',
                          //   color: Colors.white,
                          //   height: 13,
                          //   width: 13,
                          // ),
                        ),
                        MSText.headerAddress('Ontario, Canada',
                            textColor: Colors.white),
                      ],
                    ),
                  ],
                ),
                horizontalSpace(90),
                GestureDetector(
                  child: Image.asset(
                    'assets/icons/notification.png',
                    // semanticsLabel: 'App Settings',
                    // color: primaryColor,
                    height: 20 * sizeConfig.screenHeightFactor(),
                    width: 20 * sizeConfig.screenWidthFactor(),
                  ),
                  onTap: () => Get.toNamed('/notifications'),
                ),
                horizontalSpaceSmall,
                GestureDetector(
                  child: Image.asset(
                    'assets/icons/setting.png',
                    // semanticsLabel: 'App Settings',
                    // color: primaryColor,
                    height: 20 * sizeConfig.screenHeightFactor(),
                    width: 20 * sizeConfig.screenWidthFactor(),
                  ),
                  onTap: () => Get.toNamed('/settings'),
                ),
              ]),
            ],
          ),
        ),
        Positioned(
          bottom: -50 * sizeConfig.screenHeightFactor(),
          left: 0,
          right: 0,
          child: Container(
            margin: const EdgeInsets.all(20),
            height: 65 * sizeConfig.screenHeightFactor(),
            width: 335 * sizeConfig.screenWidthFactor(),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.all(18),
                  child: IconButton(
                      padding: const EdgeInsets.all(0),
                      icon: SvgPicture.asset(
                        'assets/icons/right_arrow.svg',
                        semanticsLabel: 'header location',
                        color: primaryColor,
                        height: 20 * sizeConfig.screenHeightFactor(),
                        width: 20 * sizeConfig.screenWidthFactor(),
                      ),
                      onPressed: () => pageController?.previousPage(
                          duration: const Duration(milliseconds: 400),
                          curve: Curves.easeInOut)),
                ),
                // Obx(
                //   () => (
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
                  MSText.header(
                    date,
                    textColor: primaryColor,
                  ),
                  verticalSpace(5),
                  MSText.headerAddress(
                    day,
                    textColor: level2,
                  ),
                ]),
                //       ),
                // ),
                Padding(
                  padding: EdgeInsets.all(18 * sizeConfig.screenHeightFactor()),
                  child: IconButton(
                      padding: const EdgeInsets.all(0),
                      icon: SvgPicture.asset(
                        'assets/icons/left_arrow.svg',
                        semanticsLabel: 'right arrow',
                        color: primaryColor,
                        height: 20 * sizeConfig.screenHeightFactor(),
                        width: 20 * sizeConfig.screenWidthFactor(),
                      ),
                      // onPressed: () => _viewModel.swipe('right')),
                      onPressed: () => pageController?.nextPage(
                          duration: const Duration(milliseconds: 400),
                          curve: Curves.easeInOut)),
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
