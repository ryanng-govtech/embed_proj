import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:webview_flutter/webview_flutter.dart';

class RafaWebViewApp extends StatefulWidget {
  const RafaWebViewApp({super.key});

  @override
  State<RafaWebViewApp> createState() => _RafaWebViewAppState();
}

class _RafaWebViewAppState extends State<RafaWebViewApp> {
  late final WebViewController controller;
  // String url = 'https://fem.jtc.gov.sg/rafa/#/';
  // String url = 'https://shop.starbucks.com.sg';
  String url = 'https://www.facebook.com';

  Future<void> _requestCameraPermission() async {
    final status = await Permission.camera.request();
    if (status.isGranted) {
      // Access to camera granted
      print("success");
    } else {
      // Access to camera denied
      print("failed");
    }
  }

  @override
  void initState() {
    super.initState();
    controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..addJavaScriptChannel('cameraPermission', onMessageReceived: (message) {
        print("the message is : " + message.message);
        if (message.message == 'requestPermission') {
          _requestCameraPermission();
        } else if (message.message ==
            'MobileScannerWeb: NotAllowedError: Permission denied') {
          _requestCameraPermission();
          print("requested! @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@");
        }
      })
      ..loadRequest(
        Uri.parse(url),
      );
  }

  Future<PermissionStatus> _checkCameraPermission() async {
    PermissionStatus stat = await Permission.camera.request();
    return stat;
  }

  Future<void> _sendMessageToJavascript() async {
    controller.runJavaScript("_checkCameraPermission();");
    controller.runJavaScript("window.postMessage('requestPermission', '*');");
  }

  @override
  Widget build(BuildContext context) {
    _checkCameraPermission();
    _sendMessageToJavascript();

    return Scaffold(
        // appBar: AppBar(
        //   title: const Text('RAFA WebView'),
        // ),
        body: Column(children: [
      Expanded(
        child: WebViewWidget(
          controller: controller,
        ),
      ),
    ]));
  }
}
