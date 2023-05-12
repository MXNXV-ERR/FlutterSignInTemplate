import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:signin_template/screens/phoneotp.dart';

import '../screens/homescreen.dart';
import '../services/auth.dart';

class PhoneOtpSignInButton extends StatefulWidget {
  const PhoneOtpSignInButton({super.key});

  @override
  State<PhoneOtpSignInButton> createState() => _PhoneOtpSignInButtonState();
}

class _PhoneOtpSignInButtonState extends State<PhoneOtpSignInButton> {

  bool _isSigningIn = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(bottom: 15.0),
        child: _isSigningIn
            ? const CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(Colors.blueAccent),
              )
            : SizedBox(
                height: 75.0,
                width: 75.0,
                child: IconButton(
                    onPressed: () async {
                      setState(() {
                        _isSigningIn = true;
                      });
                      // User? user =
                      //     await Auth.signinWithGoogle(context: context);
                      setState(() {
                        _isSigningIn = false;
                      });
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) =>  const PhoneOtpScr()));
                    },
                    icon: const Icon(Icons.phone))));
  }
}


// Image.asset(
//                       'assets/images/Google.png',
//                       fit: BoxFit.fill,
//                     )