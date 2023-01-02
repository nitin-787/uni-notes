import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:mynotes/config/size_config.dart';
import 'package:mynotes/constants/colors.dart';
import 'package:overlay_support/overlay_support.dart';

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
        child: SafeArea(
          child: ListTile(
            leading: LottieBuilder.asset(
              'assets/animations/internet.json',
            ),
            title: Text(
              'No Internet Connection',
              style: GoogleFonts.poppins(
                color: AppColors.textColor1,
                fontSize: screenWidth(11),
                fontWeight: FontWeight.w500,
              ),
            ),
            trailing: IconButton(
              icon: const Icon(
                Icons.close,
                color: Colors.black,
              ),
              onPressed: () => OverlaySupportEntry.of(context)?.dismiss(),
            ),
          ),
        ),
      );
    }, duration: const Duration(seconds: 5));
  }
}
