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
            gradient: LinearGradient( // 그라디언트
              begin: Alignment.topLeft, // 좌상단에서
                end: Alignment.bottomRight, // 우하단으로
                colors: [
                  Colors.red, // 빨간색으로 시작해서
                  Colors.yellow, // 노란색으로 변하는
                ]),
          ),

          child: Center(
            child: Text('Hello World!',
              style: TextStyle(
                fontSize: 48,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }
}