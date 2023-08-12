class SizeConfig {
  late double screenWidth;
  late double screenHeight;
  late double pixelDensity;

  double screenHeightPercentage({double percentage = 1}) =>
      screenHeight * percentage;

  double screenWidthPercentage({double percentage = 1}) =>
      screenWidth * percentage;

  // iPhone 11 Pro 2436*1125 - pixel density of 3.0
  double screenHeightFactor() => (screenHeight / 2436.0) * (3.0 / pixelDensity);
  double screenWidthFactor() => (screenWidth / 1125.0) * (3.0 / pixelDensity);
}
