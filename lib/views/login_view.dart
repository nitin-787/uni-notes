import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mynotes/constants/colors.dart';
import 'package:mynotes/extentions/buildcontext/loc.dart';
import 'package:mynotes/services/auth/auth_exception.dart';
import 'package:mynotes/services/auth/bloc/auth_bloc.dart';
import 'package:mynotes/services/auth/bloc/auth_event.dart';
import 'package:mynotes/services/auth/bloc/auth_state.dart';
import 'package:mynotes/utilities/dialogs/error_dialog.dart';

class LoginView extends StatefulWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  bool isElevated = false;
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
        if (state is AuthStateLoggedOut) {
          if (state.exception is UserNotFoundAuthException) {
            await showErrorDialog(
              context,
              context.loc.login_error_cannot_find_user,
            );
          } else if (state.exception is WrongPasswordAuthException) {
            await showErrorDialog(
              context,
              context.loc.login_error_wrong_credentials,
            );
          } else if (state.exception is GenericAuthException) {
            await showErrorDialog(
              context,
              context.loc.login_error_auth_error,
            );
          }
        }
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Container(
          padding: const EdgeInsets.only(top: 60),
          child: Padding(
            padding: const EdgeInsets.all(2.0),
            child: SingleChildScrollView(
              child: Container(
                padding: const EdgeInsets.only(left: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 60.0,
                    ),
                    Text(
                      "Let's Login",
                      style: GoogleFonts.poppins(
                        fontSize: 32,
                        fontWeight: FontWeight.w600,
                        color: AppColors.mainColor,
                      ),
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),
                    Text(
                      "And share your notes",
                      style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w400,
                        fontSize: 17,
                        color: AppColors.textColor1,
                      ),
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 20, right: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Email Address",
                            style: GoogleFonts.poppins(
                              fontWeight: FontWeight.w400,
                              fontSize: 17,
                              color: AppColors.textColor,
                            ),
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          TextField(
                            controller: _email,
                            enableSuggestions: false,
                            autocorrect: false,
                            keyboardType: TextInputType.emailAddress,
                            decoration: InputDecoration(
                              hintStyle: GoogleFonts.poppins(
                                color: AppColors.textColor2,
                              ),
                              hintText: 'someone@gmail.com',
                              border: const OutlineInputBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(10.0),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 30.0,
                          ),
                          Text(
                            "Password",
                            style: GoogleFonts.poppins(
                              fontWeight: FontWeight.w400,
                              fontSize: 17,
                              color: Colors.black,
                            ),
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          TextField(
                            controller: _password,
                            obscureText: true,
                            enableSuggestions: false,
                            autocorrect: false,
                            decoration: InputDecoration(
                              hintStyle: GoogleFonts.poppins(
                                color: AppColors.textColor2,
                              ),
                              hintText: '***********',
                              border: const OutlineInputBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(10.0),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 10.0,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              TextButton(
                                onPressed: () {
                                  context.read<AuthBloc>().add(
                                        const AuthEventForgotPassword(),
                                      );
                                },
                                child: Text(
                                  style: GoogleFonts.poppins(
                                    color: AppColors.mainColor,
                                    decoration: TextDecoration.underline,
                                    decorationThickness: 1.5,
                                    fontSize: 15,
                                  ),
                                  "Forgot password?",
                                ),
                              )
                            ],
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          SizedBox(
                            width: 500,
                            height: 50,
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
                                      AuthEventLogIn(
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
                                    const SizedBox(
                                      width: 15,
                                    ),
                                    Text(
                                      "Login",
                                      style: GoogleFonts.poppins(
                                        color: Colors.white,
                                        fontSize: 18,
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
                          const SizedBox(
                            height: 20,
                          ),
                          Center(
                            child: Text(
                              'Or',
                              style: GoogleFonts.poppins(
                                color: AppColors.textColor1,
                                fontSize: 15,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          SizedBox(
                            width: 500,
                            height: 50,
                            child: OutlinedButton(
                              style: OutlinedButton.styleFrom(
                                side: const BorderSide(
                                  color: Color.fromARGB(255, 219, 219, 219),
                                  width: 1,
                                ),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30),
                                ),
                              ),
                              // need to add google sign in
                              onPressed: () {},
                              child: Container(
                                padding: const EdgeInsets.only(
                                  left: 20,
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    const Image(
                                      height: 40,
                                      width: 25,
                                      image: AssetImage(
                                          'assets/images/google.png'),
                                    ),
                                    const SizedBox(
                                      width: 15,
                                    ),
                                    Text(
                                      "Login with Google",
                                      style: GoogleFonts.poppins(
                                        color: AppColors.mainColor,
                                        fontSize: 17,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Center(
                            child: TextButton(
                              onPressed: () {
                                context.read<AuthBloc>().add(
                                      const AuthEventShouldRegister(),
                                    );
                              },
                              child: Text(
                                style: GoogleFonts.poppins(
                                  color: AppColors.mainColor,
                                  fontSize: 15,
                                  fontWeight: FontWeight.w500,
                                ),
                                context.loc.login_view_not_registered_yet,
                              ),
                            ),
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
