import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '/config/size_config.dart';
import '/constants/colors.dart';
import '/constants/routes.dart';

class ChatView extends StatelessWidget {
  const ChatView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var text = 'Thanks for loving';
    if (text.length >= 17) {
      text = '${text.substring(0, 17)}...';
    } else {
      text = text;
    }
    return Column(
      children: [
        ListView.builder(
          controller: ScrollController(),
          shrinkWrap: true,
          itemCount: 10,
          itemBuilder: (context, index) {
            return Column(
              children: [
                InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, chatRoom);
                  },
                  child: Container(
                    padding: EdgeInsets.only(
                      left: screenWidth(15),
                      right: screenWidth(15),
                    ),
                    height: screenHeight(50),
                    margin: EdgeInsets.only(
                      bottom: screenWidth(13.2),
                    ),
                    child: Row(
                      children: [
                        Container(
                          width: screenWidth(40),
                          height: screenWidth(40),
                          decoration: BoxDecoration(
                            image: const DecorationImage(
                              image: AssetImage(
                                'assets/images/zoro.png',
                              ),
                            ),
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(screenWidth(22)),
                              bottomLeft: Radius.circular(screenWidth(22)),
                              bottomRight: Radius.circular(screenWidth(22)),
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Roronoa Zoro',
                                    style: GoogleFonts.poppins(
                                      fontSize: screenWidth(12),
                                      fontWeight: FontWeight.w600,
                                      color: AppColors.textColor,
                                    ),
                                  ),
                                  Text(
                                    'yesterday',
                                    style: GoogleFonts.poppins(
                                      fontSize: screenWidth(10),
                                      fontWeight: FontWeight.w500,
                                      color: AppColors.textColor2,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: screenHeight(3),
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 1,
                                    text,
                                    style: GoogleFonts.poppins(
                                      fontSize: screenWidth(11),
                                      fontWeight: FontWeight.w500,
                                      color: AppColors.textColor2,
                                    ),
                                  ),
                                  Container(
                                    width: screenWidth(14),
                                    height: screenWidth(14),
                                    decoration: BoxDecoration(
                                      color: AppColors.message,
                                      borderRadius: BorderRadius.circular(
                                        screenWidth(20),
                                      ),
                                    ),
                                    child: Center(
                                      child: Text(
                                        '22',
                                        style: GoogleFonts.poppins(
                                          fontSize: screenWidth(7),
                                          fontWeight: FontWeight.w500,
                                          color: AppColors.white,
                                        ),
                                      ),
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
                ),
              ],
            );
          },
        ),
      ],
    );
  }
}
