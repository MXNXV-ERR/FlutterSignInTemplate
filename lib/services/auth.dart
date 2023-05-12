
import 'package:signin_template/firebase_options.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:signin_template/components/notifier.dart';
import 'package:signin_template/screens/homescreen.dart';

class Auth {
  static FirebaseAuth auth = FirebaseAuth.instance;


  static Future<User?> signinWithGoogle({
    required BuildContext context,
  }) async {
    User? user;

    //for web
    if (kIsWeb) {
      GoogleAuthProvider authProvider = GoogleAuthProvider();
      try {
        final UserCredential userCredential =
            await auth.signInWithPopup(authProvider);

        user = userCredential.user;
      } catch (e) {
        //print(e);
        Notifiers.showSnackBar(context, e.toString());
      }
    } else {
      //for android and ios
      final GoogleSignIn googleSignIn = GoogleSignIn();
      final GoogleSignInAccount? googleSignInAccount =
          await googleSignIn.signIn();

      if (googleSignInAccount != null) {
        final GoogleSignInAuthentication googleSignInAuthentication =
            await googleSignInAccount.authentication;

        final AuthCredential credential = GoogleAuthProvider.credential(
          accessToken: googleSignInAuthentication.accessToken,
          idToken: googleSignInAuthentication.idToken,
        );

        try {
          final UserCredential userCredential =
              await auth.signInWithCredential(credential);

          user = userCredential.user;
        } on FirebaseAuthException catch (e) {
          if (e.code == 'account-exists-with-different-credential') {
            Notifiers.showSnackBar(context, 'Account already exists');
            // ScaffoldMessenger.of(context).showSnackBar(
            //     Auth.customSnackBAr(content: ));
          } else if (e.code == 'invalid-credential') {
            Notifiers.showSnackBar(context, 'Invalid credentials.Try again...');
            // ScaffoldMessenger.of(context).showSnackBar(Auth.customSnackBAr(
            //     content: ));
          }
        } catch (e) {
          Notifiers.showSnackBar(
              context, 'Error occured using Google Sign-in.Try again...');
          // ScaffoldMessenger.of(context).showSnackBar(Auth.customSnackBAr(
          //     content: ));
        }
      }
    }

    return user;
  }

  static Future<FirebaseApp?> initializeFirebase(
      {required BuildContext context}) async {
    FirebaseApp firebaseApp = await Firebase.initializeApp(
        options: DefaultFirebaseOptions.currentPlatform);
    User? user = FirebaseAuth.instance.currentUser;

    if (user != null) {
      Navigator.of(context).pushReplacement(MaterialPageRoute(
          builder: (context) => HomeScr(user: user,)));
    }

    return firebaseApp;
  }

  static Future<void> signOut({required BuildContext context}) async {
    final GoogleSignIn googleSignIn = GoogleSignIn();

    try {
      if (!kIsWeb) {
        await googleSignIn.signOut();
      }
      await auth.signOut();
    } catch (e) {
      Notifiers.showSnackBar(context, 'Error Signing out.Try Again...');
      // ScaffoldMessenger.of(context).showSnackBar(
      //     Auth.customSnackBAr(content: ));
    }
  }

  static Future<User?> createUserWithEmailandPassword(
      String email, String password,String displayName) async {
    final UserCredential result = await auth.createUserWithEmailAndPassword(
        email: email, password: password);
    await auth.currentUser?.updateDisplayName(displayName);
    return result.user;
  }

  static Future<User?> signInWithEmailAndPassword(
      String email, String password) async {
    FirebaseAuth auth = FirebaseAuth.instance;
    final UserCredential result = await auth.signInWithEmailAndPassword(
        email: email, password: password);
    
    return result.user;
  }

  static Future<User?>? signInWithPhoneNumber(String phoneno)
  {
      return null;
  }
}