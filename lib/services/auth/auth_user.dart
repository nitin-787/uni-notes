import 'package:firebase_auth/firebase_auth.dart' show User;
import 'package:flutter/foundation.dart';

@immutable
class AuthUser {
  final String id;
  final String email;
  final bool isEmailVerified;
  const AuthUser({
    required this.id,
    required this.email,
    required this.isEmailVerified,
  });

  factory AuthUser.fromFirebaseUser(User user) => AuthUser(
        id: user.uid,
        email: user.email!,
        isEmailVerified: user.emailVerified,
      );
}

// class AuthGoogleUser {
//   final String email;
 

//   const AuthGoogleUser({
//     required this.email,
    
//   });

//   factory AuthGoogleUser.fromFirebaseUser(User user) =>
//       AuthGoogleUser(email: user.email!);
// }
