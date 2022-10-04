import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:overlay_support/overlay_support.dart';

class InternetSnackBar {
  static void showTopSnackBar(BuildContext context) {
    showSimpleNotification(LottieBuilder.asset(
      'animations/lottie1.json',
    ));
  }
}
