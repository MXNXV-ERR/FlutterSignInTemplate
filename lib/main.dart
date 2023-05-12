import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:signin_template/firebase_options.dart';
import 'package:signin_template/screens/homescreen.dart';
import 'package:signin_template/screens/login.dart';
import 'package:signin_template/screens/splahscreen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/':(context) => const SplashScr(),
        '/login':(context) => const LogInScr(),
        '/home':(context) => const HomeScr(),
      },
      debugShowCheckedModeBanner: false,
      title: 'Sign-in Template',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
    );
  }
}

