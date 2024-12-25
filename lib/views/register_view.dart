import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';

import '/config/size_config.dart';
import '/constants/colors.dart';
import '/extentions/buildcontext/loc.dart';
import '/services/auth/auth_exception.dart';
import '/services/auth/bloc/auth_bloc.dart';
import '/services/auth/bloc/auth_event.dart';
import '/services/auth/bloc/auth_state.dart';
import '/utilities/dialogs/error_dialog.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({super.key});

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  bool _obscureText = true;
  late final TextEditingController _email;
  late final TextEditingController _password;

  @override
  void initState() {
    _email = TextEditingController();
    _password = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _email.dispose();
    _password.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) async {
        if (state is AuthStateRegistering) {
          if (state.exception is WeakPasswordAuthException) {
            await showErrorDialog(
              context,
              context.loc.register_error_weak_password,
            );
          } else if (state.exception is EmailAlreadyInUseAuthException) {
            await showErrorDialog(
              context,
              context.loc.register_error_email_already_in_use,
            );
          } else if (state.exception is InvalidEmailAuthException) {
            await showErrorDialog(
              context,
              context.loc.register_error_invalid_email,
            );
          } else if (state.exception is GenericAuthException) {
            await showErrorDialog(
              context,
              context.loc.register_error_generic,
            );
          }
        }
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Container(
          padding: EdgeInsets.only(top: screenHeight(30)),
          child: Padding(
            padding: const EdgeInsets.all(2.0),
            child: SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.only(left: screenWidth(13.2)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: screenHeight(42),
                    ),
                    Text(
                      "Register",
                      style: GoogleFonts.poppins(
                        fontSize: screenWidth(22.24),
                        fontWeight: FontWeight.w600,
                        color: AppColors.mainColor,
                      ),
                    ),
                    SizedBox(
                      height: screenHeight(6.94),
                    ),
                    Text(
                      "To get in touch with your college",
                      style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w400,
                        fontSize: screenWidth(11.8),
                        color: AppColors.textColor1,
                      ),
                    ),
                    SizedBox(
                      height: screenHeight(14),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        top: screenHeight(14),
                        right: screenWidth(13.2),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Email Address",
                            style: GoogleFonts.poppins(
                              fontWeight: FontWeight.w400,
                              fontSize: screenWidth(11.8),
                              color: AppColors.textColor,
                            ),
                          ),
                          SizedBox(
                            height: screenHeight(10.41),
                          ),
                          SizedBox(
                            height: screenHeight(50),
                            child: TextField(
                              controller: _email,
                              enableSuggestions: false,
                              autocorrect: false,
                              keyboardType: TextInputType.emailAddress,
                              decoration: InputDecoration(
                                hintStyle: GoogleFonts.poppins(
                                  color: AppColors.textColor2,
                                ),
                                hintText: 'someone@gmail.com',
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(screenHeight(6.94)),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: screenHeight(27.8),
                          ),
                          Text(
                            "Password",
                            style: GoogleFonts.poppins(
                              fontWeight: FontWeight.w400,
                              fontSize: screenWidth(11.8),
                              color: Colors.black,
                            ),
                          ),
                          SizedBox(
                            height: screenHeight(10.41),
                          ),
                          SizedBox(
                            height: screenHeight(50),
                            child: TextField(
                              controller: _password,
                              enableSuggestions: false,
                              autocorrect: false,
                              decoration: InputDecoration(
                                hintStyle: GoogleFonts.poppins(
                                  color: AppColors.textColor1,
                                ),
                                suffixIcon: GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      _obscureText = !_obscureText;
                                    });
                                  },
                                  child: Icon(_obscureText
                                      ? Iconsax.eye
                                      : Iconsax.eye_slash),
                                ),
                                hintText: '***********',
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(screenHeight(6.94)),
                                  ),
                                ),
                              ),
                              obscureText: _obscureText,
                            ),
                          ),
                          SizedBox(
                            height: screenHeight(42),
                          ),
                          SizedBox(
                            width: screenWidth(328.7),
                            height: screenHeight(34.7),
                            child: OutlinedButton(
                              style: OutlinedButton.styleFrom(
                                backgroundColor: AppColors.mainColor,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30),
                                ),
                              ),
                              onPressed: () async {
                                final email = _email.text;
                                final password = _password.text;
                                context.read<AuthBloc>().add(
                                      AuthEventRegister(
                                        email,
                                        password,
                                      ),
                                    );
                              },
                              child: SizedBox(
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    SizedBox(
                                      width: screenWidth(9.86),
                                    ),
                                    Text(
                                      "Register",
                                      style: GoogleFonts.poppins(
                                        color: Colors.white,
                                        fontSize: screenWidth(12.51),
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                    const Icon(
                                      Icons.arrow_forward,
                                      color: Colors.white,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: screenHeight(27.76),
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
                                'Already Registered?',
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
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
