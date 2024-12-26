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
          backgroundColor: Colors.blue,
          title: Center(
            child: Text('Test', style: TextStyle(color: Colors.white)),
          ),
        ),
        body: Container(
          color: Colors.yellow,
          child: Row(
            mainAxisSize: MainAxisSize.min, // 기본축을 최소 길이로 설정
            children: [
              Container(
                width: 50, height: 100, color: Colors.red,
              ),
              Container(
                width: 50, height: 50, color: Colors.green,
              ),
              Container(
                width: 50, height: 150, color: Colors.blue,
              ),
            ],
          ),
        )
      )
    );
  }
}