import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mynotes/config/size_config.dart';
import 'package:mynotes/constants/colors.dart';
import 'package:mynotes/views/home/widget/note_data.dart';

class NotesSlider extends StatelessWidget {
  const NotesSlider({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: SingleChildScrollView(
        physics: const NeverScrollableScrollPhysics(),
        child: Column(
          children: [
            TabBar(
              indicatorSize: TabBarIndicatorSize.label,
              labelStyle: GoogleFonts.poppins(
                fontSize: screenWidth(11.19),
                fontWeight: FontWeight.w500,
                color: AppColors.mainColor,
              ),
              labelColor: AppColors.mainColor,
              tabs: const [
                Tab(
                  text: 'Public Wall',
                ),
                Tab(
                  text: 'Private Chat',
                ),
              ],
            ),
            SizedBox(
              height: screenHeight(500),
              child: TabBarView(
                children: [
                  const SingleChildScrollView(
                    physics: BouncingScrollPhysics(),
                    child: NoteData(),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 150),
                    child: Center(
                      child: Text(
                        'Under Construction',
                        style: GoogleFonts.poppins(
                          fontSize: screenWidth(11.19),
                          fontWeight: FontWeight.w500,
                          color: AppColors.textColor1,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
