import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_masjid/service/responsive_factors.dart';

Widget verticalSpace(double height) {
  final sizeConfig = Get.put(SizeConfig());
  return SizedBox(height: height * sizeConfig.screenHeightFactor());
}

Widget horizontalSpace(double width) {
  final sizeConfig = Get.put(SizeConfig());
  return SizedBox(width: width * sizeConfig.screenWidthFactor());
}
