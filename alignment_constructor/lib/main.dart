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
          color: Colors.tealAccent,
          child: Align(
            alignment: Alignment(0.0, 0.0), // 하위 위젯을 상위 위젯의 중앙에 배치
            child: Container(
              width: 300,
              height: 300,
              color: Colors.yellow,
              child: Align(
                alignment: Alignment(0.0, 1.0), // 하위 위젯을 상위 위젯의 Bottom Center에 배치
                child: Container(
                  width: 50,
                  height: 50,
                  color: Colors.blue,
                ),
              ),
            ),
          ),
        )
      )
    );
  }
}