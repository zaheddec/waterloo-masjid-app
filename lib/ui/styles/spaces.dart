import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../service/responsive_factors.dart';

final sizeConfig = Get.put(SizeConfig());

// Horizontal Spacing
Widget horizontalSpaceTiny =
    SizedBox(width: 5.0 * sizeConfig.screenWidthFactor());
Widget horizontalSpaceSmall =
    SizedBox(width: 10.0 * sizeConfig.screenWidthFactor());
Widget horizontalSpaceRegular =
    SizedBox(width: 20.0 * sizeConfig.screenWidthFactor());
Widget horizontalSpaceMedium =
    SizedBox(width: 25.0 * sizeConfig.screenWidthFactor());
Widget horizontalSpaceLarge =
    SizedBox(width: 50.0 * sizeConfig.screenWidthFactor());

// Vertical Spacing
Widget verticalSpaceTiny =
    SizedBox(height: 5.0 * sizeConfig.screenHeightFactor());
Widget verticalSpaceSmall =
    SizedBox(height: 10.0 * sizeConfig.screenHeightFactor());
Widget verticalSpaceRegular =
    SizedBox(height: 20.0 * sizeConfig.screenHeightFactor());
Widget verticalSpaceMedium =
    SizedBox(height: 25.0 * sizeConfig.screenHeightFactor());
Widget verticalSpaceMedium2 =
    SizedBox(height: 40.0 * sizeConfig.screenHeightFactor());
Widget verticalSpaceLarge =
    SizedBox(height: 50.0 * sizeConfig.screenHeightFactor());

// Padding Spacing
const double spaceMinuscule = 2.0;
const double spaceMinuscule2 = 4.0;
const double spaceTiny = 5.0;
const double spaceTiny2 = 7.0;
const double spaceSmall = 10.0;
const double spaceSmall2 = 15.0;
const double spaceRegular = 20.0;
const double spaceRegular2 = 25.0;
const double spaceRegular3 = 30.0;
const double spaceMedium = 40.0;
const double spaceLarge = 50.0;
const double spaceExtraLarge = 60.0;

const double regularPadding = 8.0;
