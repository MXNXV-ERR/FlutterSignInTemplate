
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:signin_template/screens/login.dart';
import 'package:signin_template/services/auth.dart';
import 'package:webview_flutter/webview_flutter.dart';


class HomeScr extends StatefulWidget {

  final User? user;
  const HomeScr({super.key,required this.user});

  @override
  State<HomeScr> createState() => _HomeScrState();
}

class _HomeScrState extends State<HomeScr> {

  late final WebViewController controller;

    @override
  void initState() {
    
    super.initState();
    controller = WebViewController()
    ..setJavaScriptMode(JavaScriptMode.unrestricted)
    ..loadRequest(Uri.parse('http://edukag.in'));
    // if (Platform.isAndroid) {
    //   WebViewPlatform
    //   WebView.platform = SurfaceAndroidWebView();
    // }
  }

    void _signOut() async{
      await Auth.signOut(context: context);
        Navigator.of(context).pushReplacement(MaterialPageRoute(
              builder: (context) => const LogInScr()));
    }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: WebViewWidget(controller: controller),
      ),
      floatingActionButton: FloatingActionButton(onPressed: _signOut,
      child: const Icon(Icons.delete),),
    );
  }
}