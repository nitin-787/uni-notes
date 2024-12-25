import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '/config/size_config.dart';
import '/constants/colors.dart';

class OptionsList extends StatelessWidget {
  const OptionsList({
    super.key,
    required this.icon,
    required this.icon2,
    this.iconSize2 = 22,
    required this.text,
    required this.onPressed,
  });
  final String text;
  final IconData icon;
  final double iconSize2;
  final IconData icon2;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
      child: SizedBox(
        height: screenWidth(34.7),
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(
              color: AppColors.textColor1,
            ),
            shape: BoxShape.rectangle,
            borderRadius: const BorderRadius.only(
              topRight: Radius.circular(25),
              bottomLeft: Radius.circular(25),
            ),
          ),
          child: Container(
            padding: EdgeInsets.only(
              left: screenWidth(13.2),
            ),
            child: Row(
              children: [
                SizedBox(
                  width: screenWidth(2),
                ),
                Icon(
                  icon,
                  color: AppColors.mainColor,
                ),
                SizedBox(
                  width: screenWidth(10),
                ),
                Text(
                  text,
                  style: GoogleFonts.poppins(
                    fontSize: screenWidth(11.5),
                    fontWeight: FontWeight.w500,
                    color: AppColors.textColor1,
                  ),
                ),
                const Spacer(
                  flex: 1,
                ),
                InkWell(
                  onTap: onPressed,
                  child: Icon(
                    icon2,
                    size: iconSize2,
                    color: AppColors.mainColor,
                  ),
                ),
                SizedBox(
                  width: screenWidth(12),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
