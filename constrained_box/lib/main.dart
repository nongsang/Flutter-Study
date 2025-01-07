import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Test', style: TextStyle(color: Colors.white)),
          backgroundColor: Colors.blue,
          centerTitle: true,
        ),

        body: ConstrainedBox(
          constraints: BoxConstraints.expand(width: 300, height: 300), // 설정한 픽셀 범위까지 최대한 확장
          child: Container(color: Colors.red, width: 150, height: 150),
        ),
      ),
    );
  }
}