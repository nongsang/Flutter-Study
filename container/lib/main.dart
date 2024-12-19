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
        body: Container(
          decoration: BoxDecoration(
            border: Border.all(width: 10, color: Colors.black),
            borderRadius: const BorderRadius.all(Radius.circular(8))
          ),
          margin: EdgeInsets.all(20), // 다른 위젯과의 간격
          padding: EdgeInsets.all(10), // Container 위젯 내부의 컨텐츠와의 간격
          child: Image.asset('images/big.jpeg'),
        ),
      ),
    );
  }
}