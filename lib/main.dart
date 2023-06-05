import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:clima/screens/loading_screen.dart';

void main() =>
    runApp(DevicePreview(enabled: false, builder: (context) => MyApp()));

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      home: LoadingScreen(),
    );
  }
}
