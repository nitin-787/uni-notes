import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mynotes/extentions/buildcontext/loc.dart';
import 'package:mynotes/services/auth/auth_exception.dart';
import 'package:mynotes/services/auth/bloc/auth_bloc.dart';
import 'package:mynotes/services/auth/bloc/auth_event.dart';
import 'package:mynotes/services/auth/bloc/auth_state.dart';
import 'package:mynotes/utilities/dialogs/error_dialog.dart';
import 'package:path/path.dart';

class LoginView extends StatefulWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {

  bool changeButton = false;
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
        appBar: AppBar(
          title: Text(context.loc.login),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Text(
                  context.loc.login_view_prompt,
                ),
                SizedBox(height: 20.0,),
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
                    hintText: context.loc.password_text_field_placeholder,
                  ),
                  
                ),SizedBox(height: 20.0,),
                // TextButton(
                //   onPressed: () async {
                //     final email = _email.text;
                //     final password = _password.text;
                //     context.read<AuthBloc>().add(
                //           AuthEventLogIn(
                //             email,
                //             password,
                //           ),
                //         );
                        
                //   },
                //   child: Text(context.loc.login,
                //    style: TextStyle(
                //     fontWeight: FontWeight.bold,
                //     fontSize: 16.0,),),
                  
                // ),

              InkWell(
                onTap: () async {
                  setState(() {
                    changeButton = true;
                  });

                  await Future.delayed(Duration(seconds: 1));
                  final email = _email.text;
                  final password = _password.text;
                  context.read<AuthBloc>().add(
                    AuthEventLogIn(email, password),
                  );
                },
                child: AnimatedContainer(
                  duration: Duration(seconds: 1),
                  alignment: Alignment.center,
                  width: changeButton ? 40 : 150,
                  height: 40,
                  child: changeButton ? Icon(Icons.done, color: Colors.white,) : Text("Login", style: TextStyle(
                    color: Colors.white, fontWeight: FontWeight.bold,
                    fontSize: 14,),
                    ),
                    decoration: BoxDecoration(
                      color: Colors.deepPurple,
                      // shape: changeButton ? BoxShape.circle : BoxShape.rectangle,
                      borderRadius: BorderRadius.circular(changeButton ? 40 : 8)
                      ),
                ),
              ),

              SizedBox(height: 20.0,),

                TextButton(
                  onPressed: () {
                    context.read<AuthBloc>().add(
                          const AuthEventForgotPassword(),
                        );
                  },
                  child: Text(
                    context.loc.login_view_forgot_password,
                  ),
                ),
                TextButton(
                  onPressed: () {
                    context.read<AuthBloc>().add(
                          const AuthEventShouldRegister(),
                        );
                  },
                  child: Text(
                    context.loc.login_view_not_registered_yet,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
