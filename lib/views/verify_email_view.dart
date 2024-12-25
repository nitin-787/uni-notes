import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

import '/config/size_config.dart';
import '/constants/colors.dart';
import '/services/auth/bloc/auth_bloc.dart';
import '/services/auth/bloc/auth_event.dart';

class VerifyEmailView extends StatefulWidget {
  const VerifyEmailView({super.key});

  @override
  State<VerifyEmailView> createState() => _VerifyEmailViewState();
}

class _VerifyEmailViewState extends State<VerifyEmailView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(screenWidth(11.11)),
          child: SingleChildScrollView(
            child: Container(
              padding: EdgeInsets.only(
                left: screenWidth(1.39),
                top: screenHeight(42),
                right: screenWidth(1.39),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: screenWidth(34.71),
                  ),
                  Image(
                    height: screenHeight(170),
                    image: const AssetImage('assets/images/mail_box.png'),
                  ),
                  SizedBox(
                    height: screenWidth(34.71),
                  ),
                  Text(
                    "We have sent you an email verification link. Please check your email and click on the link to verify your email address. If you don't see the email in your inbox, please check your spam folder. or click the button below, we will send you a new link.",
                    style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w500,
                      fontSize: screenWidth(11.8),
                      color: AppColors.textColor1,
                    ),
                  ),
                  SizedBox(
                    height: screenHeight(34.7),
                  ),
                  SizedBox(
                    height: screenWidth(34.7),
                    width: 500,
                    child: OutlinedButton(
                      style: OutlinedButton.styleFrom(
                        backgroundColor: AppColors.mainColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      onPressed: () {
                        context.read<AuthBloc>().add(
                              const AuthEventSendEmailVerification(),
                            );
                      },
                      child: SizedBox(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Send Verification Link",
                              style: GoogleFonts.poppins(
                                color: Colors.white,
                                fontWeight: FontWeight.w500,
                                fontSize: screenWidth(11.8),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: screenHeight(27.8),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        style: GoogleFonts.poppins(
                          color: AppColors.textColor1,
                          fontSize: screenWidth(10.42),
                          fontWeight: FontWeight.w500,
                        ),
                        'Already Verified?',
                      ),
                      TextButton(
                        onPressed: () {
                          context.read<AuthBloc>().add(
                                const AuthEventLogOut(),
                              );
                        },
                        child: Text(
                          style: GoogleFonts.poppins(
                            color: AppColors.mainColor,
                            fontSize: screenWidth(10.42),
                            fontWeight: FontWeight.w500,
                          ),
                          'Login here!',
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
