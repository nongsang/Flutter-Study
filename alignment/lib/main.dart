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
        body: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start, // 모든 위젯을 시작 부분에 모아서 배열
              children: [
                Container(
                  width: 50, height: 50, color: Colors.red,
                ),
                Container(
                  width: 50, height: 50, color: Colors.green,
                ),
                Container(
                  width: 50, height: 50, color: Colors.blue,
                ),
              ],
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,  // 모든 위젯을 중앙에 모아서 배열
              children: [
                Container(
                  width: 50, height: 50, color: Colors.red,
                ),
                Container(
                  width: 50, height: 50, color: Colors.green,
                ),
                Container(
                  width: 50, height: 50, color: Colors.blue,
                ),
              ],
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.end, // 모든 위젯을 끝 부분에 모아서 배열
              children: [
                Container(
                  width: 50, height: 50, color: Colors.red,
                ),
                Container(
                  width: 50, height: 50, color: Colors.green,
                ),
                Container(
                  width: 50, height: 50, color: Colors.blue,
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,  // 양쪽 위젯을 양쪽에 붙이고, 위젯 간 간격을 균등하게
              children: [
                Container(
                  width: 50, height: 50, color: Colors.red,
                ),
                Container(
                  width: 50, height: 50, color: Colors.green,
                ),
                Container(
                  width: 50, height: 50, color: Colors.blue,
                ),
              ],
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround, // 위젯 간 간격을 균등하게, 양쪽 위젯 끝은 위젯 간 간격에 1/2
              children: [
                Container(
                  width: 50, height: 50, color: Colors.red,
                ),
                Container(
                  width: 50, height: 50, color: Colors.green,
                ),
                Container(
                  width: 50, height: 50, color: Colors.blue,
                ),
              ],
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly, // 위젯 간 간격, 양쪽 위젯 끝 간격을 균등하게
              children: [
                Container(
                  width: 50, height: 50, color: Colors.red,
                ),
                Container(
                  width: 50, height: 50, color: Colors.green,
                ),
                Container(
                  width: 50, height: 50, color: Colors.blue,
                ),
              ],
            ),
          ]
        )
      )
    );
  }
}