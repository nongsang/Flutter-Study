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

        body: ListView( // SingleChildScrollView + Column으로 표현한 것과 비슷하다.
          scrollDirection: Axis.vertical, // 스크롤할 방향을 따로 설정 할 수 있다.
          children: [
            Container(height: 300, color: Colors.red),
            Container(height: 300, color: Colors.green),
            Container(height: 300, color: Colors.blue),
          ],
        ),
      ),
    );
  }
}