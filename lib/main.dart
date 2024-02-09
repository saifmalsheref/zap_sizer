import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:zap_sizer/zap_sizer.dart';

void main() {
  runApp(DevicePreview(
    builder: (context) => const MyApp(),
  ) // Wrap your app
      );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ZapSizer(
      builder: (context, constraints) =>  MaterialApp(
        home: MyWidget(),
      ),
    );
  }
}

class MyWidget extends StatelessWidget {
  const MyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Padding(
        padding: EdgeInsets.all(8.0),
        child: SafeArea(
          child: AdaptiveWidget(
            desktop: Text("Hello From Desktop", style: TextStyle(fontSize: 35)),
            tablet: Text("Hello From Tablet", style: TextStyle(fontSize: 35)),
            mobile: Text("Hello From Mobile", style: TextStyle(fontSize: 35)),

            // Add platform-specific widgets (android, ios, macOs, linux, windows, web) if needed
          ),
        ),
      ),
    );
  }
}
