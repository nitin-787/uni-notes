import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mynotes/config/size_config.dart';
import 'package:mynotes/constants/colors.dart';

class ChatView extends StatelessWidget {
  const ChatView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListView.builder(
          controller: ScrollController(),
          shrinkWrap: true,
          itemCount: 10,
          itemBuilder: (context, index) {
            return Column(
              children: [
                Container(
                  padding: EdgeInsets.only(
                    left: screenWidth(15),
                    right: screenWidth(15),
                  ),
                  height: 100,
                  margin: EdgeInsets.only(
                    bottom: screenWidth(13.2),
                  ),
                  child: Row(
                    children: [
                      Container(
                        width: screenWidth(60),
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                            fit: BoxFit.fitWidth,
                            image: AssetImage(
                              "assets/images/avatar.png",
                            ),
                          ),
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(65),
                            bottomRight: Radius.circular(65),
                            bottomLeft: Radius.circular(65),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: screenWidth(16),
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: screenHeight(6),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Mikey',
                                  style: GoogleFonts.poppins(
                                    fontSize: screenWidth(13),
                                    fontWeight: FontWeight.w600,
                                    color: AppColors.textColor,
                                  ),
                                ),
                                Text(
                                  '12/22/20',
                                  style: GoogleFonts.poppins(
                                    fontSize: screenWidth(11),
                                    fontWeight: FontWeight.w500,
                                    color: AppColors.textColor2,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: screenHeight(10),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'She is dead.',
                                  style: GoogleFonts.poppins(
                                    fontSize: screenWidth(12),
                                    fontWeight: FontWeight.w500,
                                    color: AppColors.textColor2,
                                  ),
                                ),
                                Text(
                                  '1',
                                  style: GoogleFonts.poppins(
                                    fontSize: screenWidth(9),
                                    fontWeight: FontWeight.w500,
                                    color: AppColors.textColor2,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            );
          },
        ),
      ],
    );
  }
}
