import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mynotes/config/size_config.dart';
import 'package:mynotes/constants/colors.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.backgroundColor1,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back_ios,
              color: AppColors.mainColor,
            ),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ),
        body: Column(
          children: [
            SizedBox(
              height: screenHeight(30),
            ),
            SizedBox(
              width: screenWidth(100),
              child: InkWell(
                child: Container(
                  height: screenWidth(100),
                  width: screenWidth(100),
                  decoration: BoxDecoration(
                    image: const DecorationImage(
                      image: AssetImage("assets/images/avatar.png"),
                    ),
                    borderRadius: BorderRadius.circular(100),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: screenHeight(10),
            ),
            Text(
              'Roronoa Zoro',
              style: GoogleFonts.poppins(
                fontSize: screenWidth(13),
                fontWeight: FontWeight.w600,
                color: AppColors.textColor1,
              ),
            ),
            SizedBox(
              height: screenHeight(10),
            ),
            Container(
              padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
              child: Column(
                children: [
                  SizedBox(
                    height: screenWidth(34.7),
                    child: OutlinedButton(
                      style: OutlinedButton.styleFrom(
                        side: BorderSide(
                          color: AppColors.textColor2,
                          width: 1,
                        ),
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(30),
                            topRight: Radius.circular(30),
                          ),
                        ),
                      ),
                      onPressed: () {},
                      child: Container(
                        padding: EdgeInsets.only(
                          left: screenWidth(13.2),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              'IIC - Indian Institute of Computer',
                              style: GoogleFonts.poppins(
                                fontSize: screenWidth(10.5),
                                fontWeight: FontWeight.w500,
                                color: AppColors.textColor1,
                              ),
                            ),
                            IconButton(
                              onPressed: () {},
                              icon: const Icon(
                                Icons.arrow_drop_down,
                              ),
                              iconSize: screenWidth(24),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
