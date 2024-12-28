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
        body: Stack(
          children: [
            Container(  // 빨간 컨테이너
              color: Colors.red,
            ),

            Container(  // 초록 컨테이너
              color: Colors.green,
              width: 300,
              height: 300,
            ),

            Container(  // 노란 컨테이너
              color: Colors.yellow,
              width: 150,
              height: 150,
            )
          ],
        ),
      )
    );
  }
}