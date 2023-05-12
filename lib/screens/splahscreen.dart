import 'dart:async';
import 'package:flutter/material.dart';
import 'package:signin_template/screens/login.dart';


class SplashScr extends StatefulWidget {
  const SplashScr({super.key});

  @override
  State<SplashScr> createState() => _SplashScrState();
}

class _SplashScrState extends State<SplashScr> {

  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 4), () {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => const LogInScr()),
      );
    });
  }


  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: FadeInImage(
          placeholder:AssetImage('assets/images/edukag.png'),
          image: AssetImage('assets/images/edukag.png'),) 
      ),
    );
  }
}