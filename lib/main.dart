import 'package:flutter/material.dart';

void main() {
  runApp(const TikTokApp());
}

class TikTokApp extends StatelessWidget {
  const TikTokApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TikTok clone flutter study',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Container()
    );
  }
}

