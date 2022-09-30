import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mynotes/config/size_config.dart';
import 'package:mynotes/constants/colors.dart';

class SearchView extends StatefulWidget {
  const SearchView({super.key});

  @override
  State<SearchView> createState() => _SearchViewState();
}

class _SearchViewState extends State<SearchView> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.backgroundColor1,
        body: Padding(
          padding: EdgeInsets.only(
            left: screenWidth(15),
            right: screenWidth(15),
          ),
          child: Column(
            children: [
              SizedBox(
                height: screenHeight(42),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    height: screenWidth(34.7),
                    width: screenWidth(180),
                    child: OutlinedButton(
                      style: OutlinedButton.styleFrom(
                        side: BorderSide(
                          color: AppColors.textColor2,
                          width: 1,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
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
                            Icon(
                              Icons.search,
                              color: AppColors.textColor1,
                            ),
                            SizedBox(
                              width: screenWidth(9.2),
                            ),
                            Text(
                              "Search notes",
                              style: GoogleFonts.poppins(
                                fontSize: screenWidth(11.19),
                                fontWeight: FontWeight.w500,
                                color: AppColors.textColor1,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  TextButton(
                    onPressed: Navigator.of(context).pop,
                    child: Text(
                      "Cancel",
                      style: GoogleFonts.poppins(
                        fontSize: screenWidth(13),
                        fontWeight: FontWeight.w500,
                        color: AppColors.mainColor,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
