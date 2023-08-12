import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_masjid/service/responsive_factors.dart';

// Colors
const Color primaryColor = Color(0xFF003C4B);
const Color level1 = Color(0xFF0E6074);
const Color level2 = Color(0xFF27859D);
const Color level3 = Color(0xFF49ADC5);
const Color level4 = Color(0xFF76D6EE);
const Color level5 = Color(0xFF95EAFF);
const Color level6 = Color(0xFFACEEFF);
const Color level7 = Color(0xFFC4F3FF);
const Color level8 = Color(0xFFDBF8FF);
const Color level9 = Color(0xFFF2FCFF);

final sizeConfig = Get.put(SizeConfig());
// Font Sizing
double hsHeadingH1Size = 40 * sizeConfig.screenHeightFactor();
double hsMediumHeaderSize = 24 * sizeConfig.screenHeightFactor();
double hsHeadingH3Size = 18 * sizeConfig.screenHeightFactor();
double hsBodyTextSize = 16 * sizeConfig.screenHeightFactor();
double hsSmallTextSize = 14 * sizeConfig.screenHeightFactor();
double hsVerySmallTextSize = 12 * sizeConfig.screenHeightFactor();

// Sizes
const double appbarIconSize = 15;

TextStyle header = GoogleFonts.manrope(
    fontSize: 16 * sizeConfig.screenHeightFactor(),
    fontStyle: FontStyle.normal,
    fontWeight: FontWeight.bold);

TextStyle salahName = GoogleFonts.manrope(
    fontSize: 21 * sizeConfig.screenHeightFactor(),
    fontStyle: FontStyle.normal,
    fontWeight: FontWeight.w800);

TextStyle salahTimeLabel = GoogleFonts.manrope(
    fontSize: 12 * sizeConfig.screenHeightFactor(),
    fontStyle: FontStyle.normal,
    fontWeight: FontWeight.w400);

TextStyle iqamahTime = GoogleFonts.inter(
  fontSize: 23 * sizeConfig.screenHeightFactor(),
  fontStyle: FontStyle.normal,
  fontWeight: FontWeight.w700,
);

TextStyle headerAddress = GoogleFonts.inter(
    fontSize: 12 * sizeConfig.screenHeightFactor(),
    fontStyle: FontStyle.normal,
    fontWeight: FontWeight.bold,
    color: Colors.white);

TextStyle body = GoogleFonts.inter(
    fontSize: 28 * sizeConfig.screenHeightFactor(),
    fontStyle: FontStyle.normal,
    fontWeight: FontWeight.w600);

TextStyle screenHeader = GoogleFonts.splineSans(
    fontSize: 18 * sizeConfig.screenHeightFactor(),
    // fontStyle: FontStyle.normal,
    fontWeight: FontWeight.w600);

TextStyle eventHeader = GoogleFonts.manrope(
    fontSize: 16 * sizeConfig.screenHeightFactor(),
    // fontStyle: FontStyle.normal,
    fontWeight: FontWeight.w800);

TextStyle eventPoster = GoogleFonts.inter(
    fontSize: 13 * sizeConfig.screenHeightFactor(),
    // fontStyle: FontStyle.normal,
    color: const Color(0XFF0E6074),
    fontWeight: FontWeight.w400);

TextStyle eventDetailsTime = GoogleFonts.manrope(
    fontSize: 14 * sizeConfig.screenHeightFactor(),
    // fontStyle: FontStyle.normal,
    color: const Color(0XFF003C4B),
    fontWeight: FontWeight.w800);

TextStyle eventDetailsLocation = GoogleFonts.inter(
    fontSize: 12 * sizeConfig.screenHeightFactor(),
    color: const Color(0XFF003C4B),
    fontWeight: FontWeight.w500);

TextStyle detailEventHeader = GoogleFonts.manrope(
    fontSize: 18 * sizeConfig.screenHeightFactor(),
    // fontStyle: FontStyle.normal,
    // color: const Color(0XFF003C4B),
    fontWeight: FontWeight.w800);

TextStyle detailEventSubHeader = GoogleFonts.splineSans(
    fontSize: 16 * sizeConfig.screenHeightFactor(),
    fontStyle: FontStyle.normal,
    color: primaryColor,
    fontWeight: FontWeight.w600);

TextStyle detailEventBody = GoogleFonts.inter(
        fontSize: 14 * sizeConfig.screenHeightFactor(),
        fontStyle: FontStyle.normal,
        color: primaryColor,
        fontWeight: FontWeight.w400)
    .copyWith(overflow: TextOverflow.clip, height: 1.6);
