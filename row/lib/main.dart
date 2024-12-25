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
                  child: Text('Test', style: TextStyle(color: Colors.white),)
              ),
            ),
            body: Row(  // 가로로 배치
              children: [   // 가로로 배치할 위젯 목록
                Container(
                  color: Colors.red,
                  width: 100,
                  height: 100,
                ),
                Container(
                  color: Colors.blue,
                  width: 100,
                  height: 100,
                )
              ],
            )
        )
    );
  }
}
