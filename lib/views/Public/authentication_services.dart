//import 'dart:js_util';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';



class AuthenticationServices {
  

  static Future<void> signInWithGoogle() async {
    try {
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

      final GoogleSignInAuthentication? googleAuth =
          await googleUser?.authentication;

      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );

      await FirebaseAuth.instance.signInWithCredential(credential);
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}

  // static signInWithGoogle() async {
  //   //Trigger Authentication Flow
  //   final GoogleSignInAccount? googleUser =
  //       await GoogleSignIn(scopes: <String>["email"]).signIn();

  //   // Obtain auth details from the request

  //   final GoogleSignInAuthentication googleSignInAuthentication =
  //       await googleUser!.authentication;

  //   // Create new credentials

  //   final credential = GoogleAuthProvider.credential(
  //     accessToken: googleSignInAuthentication.accessToken,
  //     idToken: googleSignInAuthentication.idToken,
  //   );

  //   // Once signedIn This will retuern the User credentials

  //   await FirebaseAuth.instance.signInWithCredential(credential);

  // }

//   signOut() {
//     FirebaseAuth.instance.signOut();
//   }
// }

// Future<bool?> sighInWithGoogle(BuildContext context) async {
//   GoogleSignIn googleSignIn = GoogleSignIn();

//   final FirebaseAuth auth = FirebaseAuth.instance;

//   CollectionReference users = FirebaseFirestore.instance.collection('users');

//   try {
//     final GoogleSignInAccount? googleSignInAccount =
//         await googleSignIn.signIn();

//     if (googleSignInAccount != null) {
//       final GoogleSignInAuthentication googleSignInAuthentication =
//           await googleSignInAccount.authentication;

//       final AuthCredential credential = GoogleAuthProvider.credential(
//         accessToken: googleSignInAuthentication.accessToken,
//         idToken: googleSignInAuthentication.idToken,
//       );

//       print("Authentication");

//       final UserCredential authResult =
//           await auth.signInWithCredential(credential);

//       final User? user = authResult.user;

//       var userData = {
//         'name': googleSignInAccount.displayName,
//         'provider': 'google',
//         'email': googleSignInAccount.email,
//         'photoUrl': googleSignInAccount.photoUrl
//       };

//       users.doc(user?.uid).get().then((doc) {
//         if (doc.exists) {
//           doc.reference.update(userData);

//           print("Hi");
//           Navigator.of(context).push(
//               MaterialPageRoute(builder: (context) => const NewNotesView()));
//         } else {
//           users.doc(user?.uid).set(userData);

//           print("HIIIi");
//           Navigator.of(context).pushReplacement(
//               MaterialPageRoute(builder: (context) => const NewNotesView()));
//         }
//       });
//     }
//   } catch (PlatformException) {
//     print(PlatformException);
//     print("Login not successful , try login again !!");
//   }
// }

// final GoogleSignIn _googleSignIn = GoogleSignIn();
// final FirebaseAuth _auth = FirebaseAuth.instance;
// CollectionReference users = FirebaseFirestore.instance.collection('users');

// Future<User?> signUpWithGoogle(BuildContext context) async {
//   try {

//     final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
//    if(googleUser != null) {
//     final GoogleSignInAuthentication googleAuth =
//         await googleUser.authentication;

//     final AuthCredential credential = GoogleAuthProvider.credential(
//       accessToken: googleAuth.accessToken,
//       idToken: googleAuth.idToken,
//     );

//     final UserCredential authResult =
//         await _auth.signInWithCredential(credential);

//     final User? user = authResult.user;

//     // var userData = {
//     //   'name': googleUser.displayName,
//     //   'provider': 'google',
//     //   'email': googleUser.email,
//     //   'photoUrl': googleUser.photoUrl
//     // };

//     // users.doc(user?.uid).get().then((doc) {
//     //   if (doc.exists) {
//     //     doc.reference.update(userData);

//     //     print("Hi");
//     //   } else {
//     //     users.doc(user?.uid).set(userData);

//     //     print("HIIIi");
//     //   }
//     // });

//     return user;}
//   } catch (error) {
//     print(error);
//   }
// }

// final GoogleSignIn _googleSignIn = GoogleSignIn();
// final FirebaseAuth _auth = FirebaseAuth.instance;
// CollectionReference users = FirebaseFirestore.instance.collection('users');

// Future<User?> signUpWithGoogle(BuildContext context) async {
//   try {
//     final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
//     final GoogleSignInAuthentication? googleAuth =
//         await googleUser?.authentication;

//     final AuthCredential credential = GoogleAuthProvider.credential(
//       accessToken: googleAuth?.accessToken,
//       idToken: googleAuth?.idToken,
//     );

//     final UserCredential authResult =
//         await _auth.signInWithCredential(credential);

//     final User? user = authResult.user;

//     var userData = {
//       'name': googleUser?.displayName,
//       'provider': 'google',
//       'email': googleUser?.email,
//       'photoUrl': googleUser?.photoUrl
//     };

//     users.doc(user?.uid).get().then((doc) {
//       if (doc.exists) {
//         doc.reference.update(userData);

//         print("Hi");
//       } else {
//         users.doc(user?.uid).set(userData);

//         print("HIIIi");
//       }
//     });

//     return user;
//   } catch (error) {
//     print(error);

