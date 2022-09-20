import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mynotes/constants/colors.dart';
import 'package:mynotes/extentions/buildcontext/loc.dart';
import 'package:mynotes/services/auth/bloc/auth_bloc.dart';
import 'package:mynotes/services/auth/bloc/auth_event.dart';

class VerifyEmailView extends StatefulWidget {
  const VerifyEmailView({Key? key}) : super(key: key);

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
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Container(
              padding: const EdgeInsets.only(left: 2.0, top: 60, right: 2.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 50,
                  ),
                  const Image(
                    image: AssetImage('assets/images/mail_box.png'),
                  ),
                  const SizedBox(
                    height: 50.0,
                  ),
                  Text(
                    "We have sent you an email verification link. Please check your email and click on the link to verify your email address. If you don't see the email in your inbox, please check your spam folder. or enter your email here we will send you a new link.",
                    style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w500,
                      fontSize: 17,
                      color: AppColors.textColor1,
                    ),
                  ),
                  const SizedBox(
                    height: 57.0,
                  ),
                  SizedBox(
                    width: 500,
                    height: 50,
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
                                fontSize: 18,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        style: GoogleFonts.poppins(
                          color: AppColors.textColor1,
                          fontSize: 15,
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
                            fontSize: 15,
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
