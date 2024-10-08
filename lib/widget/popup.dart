import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '/config/size_config.dart';
import '/constants/colors.dart';

class Popup extends StatelessWidget {
  final String title;
  final String? description;
  final List<Widget>? actions;
  final String imagePath;

  const Popup({
    super.key,
    this.actions,
    required this.title,
    this.description,
    required this.imagePath,
  });
  @override
  Widget build(BuildContext context) {
    return Dialog(
      elevation: 1,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 12),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Stack(
              children: [
                Align(
                  alignment: Alignment.center,
                  child: Image.asset(imagePath, height: screenHeight(50)),
                ),
                Align(
                  alignment: Alignment.topRight,
                  child: InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Container(
                      height: 30,
                      width: 30,
                      decoration: BoxDecoration(
                        color: AppColors.mainColor,
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(
                        Icons.close,
                        color: Colors.white,
                        size: 18,
                      ),
                    ),
                  ),
                )
              ],
            ),
            const SizedBox(height: 12),
            Text(
              title,
              style: GoogleFonts.poppins(
                fontSize: screenWidth(13),
                fontWeight: FontWeight.w600,
                color: AppColors.textColor,
              ),
            ),
            description == null
                ? Container()
                : Text(
                    description!,
                    style: GoogleFonts.poppins(
                      fontSize: screenWidth(8),
                      color: AppColors.textColor2,
                    ),
                  ),
            actions != null ? const SizedBox(height: 12) : const SizedBox(),
            actions != null
                ? Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: actions!,
                  )
                : const SizedBox()
          ],
        ),
      ),
    );
  }
}
