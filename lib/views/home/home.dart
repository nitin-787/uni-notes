import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mynotes/config/size_config.dart';
import 'package:mynotes/constants/colors.dart';
import 'package:mynotes/constants/routes.dart';
import 'package:mynotes/services/auth/bloc/auth_event.dart';
import 'package:mynotes/views/home/widget/note_data.dart';
import 'package:mynotes/views/home/widget/slider.dart';
import '../../services/auth/bloc/auth_bloc.dart';

class NewNotesView extends StatefulWidget {
  const NewNotesView({super.key});

  @override
  State<NewNotesView> createState() => _NewNotesViewState();
}

class _NewNotesViewState extends State<NewNotesView> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        // floatoing action button
        floatingActionButton: FloatingActionButton(
          backgroundColor: AppColors.mainColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
          onPressed: () {
            Navigator.of(context).pushNamed(createOrUpdateNoteRoute);
          },
          child: Icon(
            Icons.add,
            size: screenWidth(20),
          ),
        ),
        backgroundColor: AppColors.backgroundColor1,
        // backgroundColor: Colors.black,
        body: SingleChildScrollView(
          physics: const NeverScrollableScrollPhysics(),
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.only(
                  left: screenWidth(8),
                  right: screenWidth(8),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: screenHeight(42),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Hi, Nex",
                          style: GoogleFonts.poppins(
                            fontSize: screenWidth(20.88),
                            fontWeight: FontWeight.w600,
                            color: AppColors.mainColor,
                          ),
                        ),
                        // added temprory a logout button
                        SizedBox(
                          width: screenWidth(32.9),
                        ),
                        IconButton(
                          onPressed: () {
                            context.read<AuthBloc>().add(
                                  const AuthEventLogOut(),
                                );
                          },
                          icon: Icon(
                            Icons.logout,
                            color: AppColors.mainColor,
                          ),
                        ),
                        Container(
                          height: screenWidth(31.29),
                          width: screenWidth(29.57),
                          decoration: BoxDecoration(
                            image: const DecorationImage(
                              image: AssetImage("assets/images/avatar.png"),
                            ),
                            borderRadius: BorderRadius.circular(30),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: screenHeight(20.88),
                    ),
                    SizedBox(
                      height: screenWidth(34.7),
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
                  ],
                ),
              ),
              SizedBox(
                height: screenHeight(20.88),
              ),
              SizedBox(
                height: screenHeight(500),
                child: TabBarView(
                  children: [
                    const NotesSlider(),
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
      ),
    );
  }
}
