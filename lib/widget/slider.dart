import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '/config/size_config.dart';
import '/constants/colors.dart';
import '/views/chat/chat_home_page.dart';
import '/views/notes/note_data.dart';

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
              height: screenHeight(16),
            ),
            SizedBox(
              height: screenHeight(500),
              child: const TabBarView(
                children: [
                  SingleChildScrollView(
                    physics: BouncingScrollPhysics(),
                    child: NoteData(),
                  ),
                  SingleChildScrollView(
                    physics: BouncingScrollPhysics(),
                    child: ChatView(),
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
