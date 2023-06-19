// import 'dart:async';
// import 'dart:io';

// import 'package:flutter/material.dart';
// import 'package:flutter_webview_pro/webview_flutter.dart';
// import 'package:permission_handler/permission_handler.dart';

// class RafaWebViewProApp extends StatefulWidget {
//   const RafaWebViewProApp({super.key});

//   @override
//   State<RafaWebViewProApp> createState() => _RafaWebViewProAppState();
// }

// class _RafaWebViewProAppState extends State<RafaWebViewProApp> {
//   late final WebViewController controller;
//   String url = 'https://fem.jtc.gov.sg/rafa/#/';
//   final Completer<WebViewController> _controller =
//       Completer<WebViewController>();

//   @override
//   void initState() {
//     super.initState();
//     // if (Platform.isAndroid) {
//       WebView.platform = SurfaceAndroidWebView();
//     // }
//   }

//   Future<void> _checkCameraPermission() async {
//     final status = await Permission.camera.status;
//     if (!status.isGranted) {
//       await Permission.camera.request();
//     }
//     print("testing!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!");
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('RAFA WebView Pro'),
//       ),
//       body: Builder(builder: (BuildContext context) {
//         return WebView(
//           initialUrl: url,
//           javascriptMode: JavascriptMode.unrestricted,
//           onWebViewCreated: (WebViewController webViewController) {
//             _controller.complete(webViewController);
//           },
//           onProgress: (int progress) {
//             _checkCameraPermission();
//             print("WebView is loading (progress : $progress%)");
//           },
//           navigationDelegate: (NavigationRequest request) {
//             if (request.url.startsWith('https://www.youtube.com/')) {
//               print('blocking navigation to $request}');
//               return NavigationDecision.prevent;
//             }
//             print('allowing navigation to $request');
//             return NavigationDecision.navigate;
//           },
//           onPageStarted: (String url) {
//             print('Page started loading: $url');
//           },
//           onPageFinished: (String url) {
//             print('Page finished loading: $url');
//           },
//           gestureNavigationEnabled: true,
//           geolocationEnabled: false,//support geolocation or not
//         );
//       })
//     );
//   }
// }