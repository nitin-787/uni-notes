import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:overlay_support/overlay_support.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '/constants/routes.dart';
import '/helper/loading/loading_screen.dart';
import '/services/auth/bloc/auth_bloc.dart';
import '/services/auth/bloc/auth_event.dart';
import '/services/auth/bloc/auth_state.dart';
import '/services/auth/firebase_auth_provider.dart';
import '/views/login_view.dart';
import '/views/forgot_password_view.dart';
import '/views/home/home.dart';
import '/views/register_view.dart';
import '/views/verify_email_view.dart';
import '/extentions/buildcontext/loc.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(OverlaySupport(
    child: MaterialApp(
      supportedLocales: AppLocalizations.supportedLocales,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: BlocProvider<AuthBloc>(
        create: (context) => AuthBloc(FirebaseAuthProvider()),
        child: const HomePage(),
      ),
      onGenerateRoute: onGenerateRoutes,
    ),
  ));
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    context.read<AuthBloc>().add(const AuthEventInitialize());
    return BlocConsumer<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state.isLoading) {
          LoadingScreen().show(
            context: context,
            text: state.loadingText ?? context.loc.loading_text,
          );
        } else {
          LoadingScreen().hide();
        }
      },
      builder: (context, state) {
        if (state is AuthStateLoggedIn) {
          return const NewNotesView();
        } else if (state is AuthStateNeedsVerification) {
          return const VerifyEmailView();
        } else if (state is AuthStateLoggedOut) {
          return const LoginView();
        } else if (state is AuthStateForgotPassword) {
          return const ForgotPasswordView();
        } else if (state is AuthStateRegistering) {
          return const RegisterView();
        } else if (state is AuthStateLoggedInWithGmail) {
          return const NewNotesView();
        } else {
          return const Scaffold(
            body: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}
