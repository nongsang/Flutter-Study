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
          constraints: BoxConstraints(  // 최대 범위, 최소 범위 제한
            minWidth: 300,
            maxHeight: 50,
          ),
          child: Container(color: Colors.red, width: 150, height: 150),
        ),
      ),
    );
  }
}