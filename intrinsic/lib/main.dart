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
          title: Text("Test", style: TextStyle(color: Colors.white)),
          backgroundColor: Colors.blue,
          centerTitle: true,
        ),

        body: Container(
          color: Colors.yellow,
          child: IntrinsicWidth(  // 하위 위젯 중 가장 너비가 긴 위젯에 맞추어, 나머지 위젯의 너비를 맞춘다.
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch, // 너비는 최대한 늘리기
              children: [
                Container(color: Colors.red, width: 50.0, height: 50.0),
                Container(color: Colors.green, width: 150.0, height: 150.0),
                Container(color: Colors.blue, width: 100, height: 100)
              ],
            ),
          ),
        )
      ),
    );
  }
}