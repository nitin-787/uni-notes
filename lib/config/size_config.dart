import 'package:flutter/cupertino.dart';

class SizeConfig {
  static MediaQueryData? _mediaQueryData;
  static double? screenWidth;
  static double? screenHeight;
  static double? defaultSize;
  static Orientation? orientation;

  void init(BuildContext context) {
    _mediaQueryData = MediaQuery.of(context);
    screenWidth = _mediaQueryData!.size.width;
    screenHeight = _mediaQueryData!.size.height;
    orientation = _mediaQueryData!.orientation;
  }
}

// Get the proportionate height as per screen size
double screenHeight(double inputHeight) {
  double screenHeight = SizeConfig.screenHeight as double;
  // 843 is the layout height that I used during the app design was pixel 6pro
  // secondary device height = 592
  return (inputHeight / 585) * screenHeight;
}

// Get the proportionate height as per screen size
double screenWidth(double inputWidth) {
  double screenWidth = SizeConfig.screenWidth as double;
  // 411 is the layout height that I used during the app design was pixel 6pro
  // secondary device width = 384
  return (inputWidth / 270) * screenWidth;
}
