import 'package:embed_proj/google_webview.dart';
import 'package:embed_proj/rafa_webview.dart';
import 'package:embed_proj/rafa_webviewpro.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Rafa Webview'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => RafaWebViewApp(),
                  ),
                );
              },
              child: Text('Open Starbucks'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => GoogleWebViewApp(),
                  ),
                );
              },
              child: Text('Open Google'),
            ),
            // ElevatedButton(
            //   onPressed: () {
            //     Navigator.of(context).push(
            //       MaterialPageRoute(
            //         builder: (context) => RafaWebViewProApp(),
            //       ),
            //     );
            //   },
            //   child: Text('Open RAFA Pro'),
            // ),
          ],
        ),
      ),
    );
  }
}
