import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:overlay_support/overlay_support.dart';

import '/config/size_config.dart';
import '/constants/colors.dart';

class InternetSnackBar {
  static void showTopSnackBar(BuildContext context) {
    // cusotom bottom snackbar
    showOverlayNotification((context) {
      return Card(
        margin: const EdgeInsets.only(
          left: 0,
          right: 0,
          bottom: 0,
        ),
        child: Container(
          padding: EdgeInsets.only(
            top: screenHeight(4),
            bottom: screenHeight(7),
          ),
          child: SafeArea(
            child: ListTile(
              leading: LottieBuilder.asset(
                'assets/animations/no-internet.json',
              ),
              title: Text(
                'No Internet Connection',
                style: GoogleFonts.poppins(
                  color: AppColors.textColor,
                  fontSize: screenWidth(12),
                  fontWeight: FontWeight.w500,
                ),
              ),
              // add image
              trailing: InkWell(
                onTap: () {
                  // close the snackbar
                  OverlaySupportEntry.of(context)?.dismiss();
                },
                child: Image(
                  height: screenWidth(30),
                  width: screenWidth(30),
                  image: const AssetImage('assets/icon/error.png'),
                ),
              ),
            ),
          ),
        ),
      );
    }, duration: const Duration(seconds: 5));
  }
}
