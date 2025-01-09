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

        body: Row(
          children: [
            Expanded(
              flex: 1,  // 비율 1
              child: Container(
                color: Colors.red,
                width: 50,
              ),
            ),

            Container(  // Expanded 없는 컨테이너
              color: Colors.green,
              width: 300,
            ),

            Expanded(
              flex: 1,  // 비율 1
              child: Container(
                color: Colors.yellow,
                width: 50,
              ),
            )
          ],
        ),
      )
    );
  }
}