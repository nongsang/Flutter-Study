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

        body: Container(
          color: Colors.tealAccent,
          alignment: FractionalOffset(0.0, 0.0),  // 상위 위젯의 Top Left 기준에 하위 위젯의 위치를 설정
          child: Container(
            width: 300,
            height: 300,
            color: Colors.yellow,
          ),
        )
      )
    );
  }
}
