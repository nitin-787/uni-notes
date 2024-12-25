import 'package:flutter/foundation.dart' show immutable;
import 'package:equatable/equatable.dart';

import '/services/auth/auth_user.dart';

@immutable
abstract class AuthState {
  final bool isLoading;
  final String? loadingText;
  const AuthState({
    required this.isLoading,
    this.loadingText = 'Please wait a moment',
  });
}

class AuthStateUnitialized extends AuthState {
  const AuthStateUnitialized({required super.isLoading});
}

class AuthStateRegistering extends AuthState {
  final Exception? exception;
  // ignore: use_super_parameters
  const AuthStateRegistering({
    required this.exception,
    required isLoading,
  }) : super(isLoading: isLoading);
}

class AuthStateForgotPassword extends AuthState {
  final Exception? exception;
  final bool hasSentEmail;
  const AuthStateForgotPassword({
    required this.exception,
    required this.hasSentEmail,
    required super.isLoading,
  });
}

class AuthStateLoggedIn extends AuthState {
  final AuthUser user;
  const AuthStateLoggedIn({
    required this.user,
    required super.isLoading,
  });
}

class AuthStateLoggedInWithGmail extends AuthState {
  const AuthStateLoggedInWithGmail({
    required super.isLoading,
  });
}

class AuthStateNeedsVerification extends AuthState {
  const AuthStateNeedsVerification({
    required super.isLoading,
  });
}

class AuthStateLoggedOut extends AuthState with EquatableMixin {
  final Exception? exception;
  const AuthStateLoggedOut({
    required this.exception,
    required super.isLoading,
    super.loadingText = null,
  });

  @override
  List<Object?> get props => [exception, isLoading];
}
