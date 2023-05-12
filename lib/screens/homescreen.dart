
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';


class HomeScr extends StatefulWidget {
  const HomeScr({super.key});

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

    

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: WebViewWidget(controller: controller)
    );
  }
}