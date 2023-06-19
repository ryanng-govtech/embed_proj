import 'package:embed_proj/home_screen.dart';
import 'package:embed_proj/rafa_webview.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Permission.camera.request();
  // await Permission.microphone.request();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Basic App Layout',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomeScreen()
    );
  }
}