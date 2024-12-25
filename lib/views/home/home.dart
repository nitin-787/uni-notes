import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

import '/config/size_config.dart';
import '/constants/colors.dart';
import '/constants/routes.dart';
import '/services/auth/bloc/auth_event.dart';
import '/utilities/internet_snak_bar.dart';
import '/widget/slider.dart';
import '/services/auth/bloc/auth_bloc.dart';

class NewNotesView extends StatefulWidget {
  const NewNotesView({super.key});

  @override
  State<NewNotesView> createState() => _NewNotesViewState();
}

class _NewNotesViewState extends State<NewNotesView> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return SafeArea(
      child: Scaffold(
        // floatoing action button
        floatingActionButton: FloatingActionButton(
          backgroundColor: AppColors.mainColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
          onPressed: () async {
            if (!mounted) return;
            var connectivityResult = await (Connectivity().checkConnectivity());
            if (connectivityResult == ConnectivityResult.none) {
              InternetSnackBar.showTopSnackBar(context);
              return;
            } else {
              Navigator.pushNamed(context, createOrUpdateNoteRoute);
            }
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
                      height: screenHeight(17),
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
                            Icons.logout_outlined,
                            color: AppColors.mainColor,
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.of(context).pushNamed(profileView);
                          },
                          child: Container(
                            height: screenWidth(31.29),
                            width: screenWidth(29.57),
                            decoration: BoxDecoration(
                              image: const DecorationImage(
                                image: AssetImage("assets/images/avatar.png"),
                              ),
                              borderRadius: BorderRadius.circular(30),
                            ),
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
                        onPressed: () {
                          Navigator.pushNamed(context, searchRoute);
                        },
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
              const NotesSlider(),
            ],
          ),
        ),
      ),
    );
  }
}
