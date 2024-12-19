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
          // 이미지를 원형 마스크를 씌워서 출력
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            image: DecorationImage(image: AssetImage('images/big.jpeg'), fit: BoxFit.cover),
          ),
          margin: EdgeInsets.all(10),
          width: 100,
          height: 100,
        ),
      ),
    );
  }
}