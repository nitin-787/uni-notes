import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

import '/config/size_config.dart';
import '/constants/colors.dart';
import '/extentions/buildcontext/loc.dart';
import '/services/auth/bloc/auth_bloc.dart';
import '/services/auth/bloc/auth_event.dart';
import '/services/auth/bloc/auth_state.dart';
import '/utilities/dialogs/error_dialog.dart';
import '/utilities/dialogs/password_reset.dart';

class ForgotPasswordView extends StatefulWidget {
  const ForgotPasswordView({super.key});

  @override
  State<ForgotPasswordView> createState() => _ForgotPasswordViewState();
}

class _ForgotPasswordViewState extends State<ForgotPasswordView> {
  late final TextEditingController _controller;

  @override
  void initState() {
    _controller = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) async {
        if (state is AuthStateForgotPassword) {
          if (state.hasSentEmail) {
            _controller.clear();
            await showPasswordResetSentDialog(context);
          }
          if (state.exception != null) {
            await showErrorDialog(
              context,
              context.loc.forgot_password_view_generic_error,
            );
          }
        }
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(
              Icons.arrow_back_ios,
              color: Colors.white,
            ),
            onPressed: () {
              context.read<AuthBloc>().add(
                    const AuthEventLogOut(),
                  );
            },
          ),
          centerTitle: true,
          backgroundColor: AppColors.mainColor,
          title: Text(
            'Forgot Password',
            style: GoogleFonts.poppins(
              color: Colors.white,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        body: Padding(
          padding: EdgeInsets.all(screenWidth(11.11)),
          child: SingleChildScrollView(
            child: Container(
              padding: EdgeInsets.only(
                left: screenWidth(1.39),
                top: screenHeight(13.88),
                right: screenWidth(1.39),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image(
                    height: screenHeight(170),
                    image:
                        const AssetImage('assets/images/forgot_password.png'),
                  ),
                  SizedBox(
                    height: screenHeight(13.88),
                  ),
                  Text(
                    "Forgot\nPassword?",
                    style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w600,
                      fontSize: screenHeight(18.74),
                      color: AppColors.mainColor,
                    ),
                  ),
                  SizedBox(
                    height: screenHeight(18.74),
                  ),
                  Text(
                    "Don't worry it happens. Please enter your email address and we will send you a link to reset your password.",
                    style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w500,
                      fontSize: screenWidth(11.8),
                      color: AppColors.textColor1,
                    ),
                  ),
                  SizedBox(
                    height: screenHeight(18.74),
                  ),
                  SizedBox(
                    height: screenWidth(34.7),
                    child: TextField(
                      keyboardType: TextInputType.emailAddress,
                      autocorrect: false,
                      controller: _controller,
                      decoration: InputDecoration(
                        hintStyle: GoogleFonts.poppins(
                          color: AppColors.textColor1,
                        ),
                        hintText: "Enter your email here",
                        border: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(10.0),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: screenHeight(20.82),
                  ),
                  SizedBox(
                    height: screenWidth(34.7),
                    child: OutlinedButton(
                      style: OutlinedButton.styleFrom(
                        backgroundColor: AppColors.mainColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      onPressed: () {
                        final email = _controller.text;
                        context.read<AuthBloc>().add(
                              AuthEventForgotPassword(email: email),
                            );
                      },
                      child: SizedBox(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                              width: screenHeight(10.41),
                            ),
                            Text(
                              "Send me password reset link",
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
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
