import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
  bool loginButton = false;
  bool registerButton = false;
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
        appBar: AppBar(
          title: Text(context.loc.login),
        ),
        body: Container(
          padding: const EdgeInsets.only(top: 20),
          child: Padding(
            padding: const EdgeInsets.all(2.0),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Image.asset(
                    "assets/icon/login.png",
                    fit: BoxFit.cover,
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  const Text(
                    "Welcome Login To Write Notes",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 22,
                        color: Colors.blueAccent),
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 16.0, horizontal: 32.0),
                    child: Column(
                      children: [
                        TextField(
                          controller: _email,
                          enableSuggestions: false,
                          autocorrect: false,
                          keyboardType: TextInputType.emailAddress,
                          decoration: InputDecoration(
                            hintText: context.loc.email_text_field_placeholder,
                          ),
                        ),
                        TextField(
                          controller: _password,
                          obscureText: true,
                          enableSuggestions: false,
                          autocorrect: false,
                          decoration: InputDecoration(
                            hintText:
                                context.loc.password_text_field_placeholder,
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
                              child: const Text(
                                style: TextStyle(
                                  fontSize: 15.5,
                                ),
                                "forgot password?",
                              ),
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 40.0,
                        ),
                        InkWell(
                          onTap: () async {
                            setState(
                              () {
                                loginButton = true;
                              },
                            );
                            await Future.delayed(
                              const Duration(seconds: 1),
                            );
                            final email = _email.text;
                            final password = _password.text;
                            if (!mounted) return;
                            context.read<AuthBloc>().add(
                                  AuthEventLogIn(email, password),
                                );
                          },
                          child: AnimatedContainer(
                            duration: const Duration(seconds: 1),
                            alignment: Alignment.center,
                            width: loginButton ? 40 : 150,
                            height: 40,
                            decoration: BoxDecoration(
                              color: Colors.blueAccent,
                              // shape: changeButton ? BoxShape.circle : BoxShape.rectangle,
                              borderRadius:
                                  BorderRadius.circular(loginButton ? 40 : 8),
                            ),
                            child: loginButton
                                ? const Icon(
                                    Icons.done,
                                    color: Colors.white,
                                  )
                                : const Text(
                                    "Login",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 14,
                                    ),
                                  ),
                          ),
                        ),
                        const SizedBox(
                          height: 40.0,
                        ),
                        InkWell(
                          onTap: () async {
                            setState(
                              () {
                                registerButton = true;
                              },
                            );
                            await Future.delayed(
                              const Duration(seconds: 1),
                            );
                            final email = _email.text;
                            final password = _password.text;
                            if (!mounted) return;
                            context.read<AuthBloc>().add(
                                  AuthEventRegister(email, password),
                                );
                          },
                          child: AnimatedContainer(
                            duration: const Duration(seconds: 1),
                            alignment: Alignment.center,
                            width: registerButton ? 40 : 150,
                            height: 40,
                            decoration: BoxDecoration(
                              color: Colors.blueAccent,
                              // shape: changeButton ? BoxShape.circle : BoxShape.rectangle,
                              borderRadius: BorderRadius.circular(
                                  registerButton ? 40 : 8),
                            ),
                            child: registerButton
                                ? const Icon(
                                    Icons.done,
                                    color: Colors.white,
                                  )
                                : const Text(
                                    "Register",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 14,
                                    ),
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
    );
  }
}
