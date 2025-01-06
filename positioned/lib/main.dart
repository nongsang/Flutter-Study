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

        body: Stack(
          children: [
            Container(
              color: Colors.green,
            ),

            Container(
              color: Colors.blue,
              width: 300,
              height: 300,
            ),

            // 하위 위젯을 상위 위젯(Stack)에서 상대 위치로 위젯의 위치를 설정
            // Positioned 위젯은 Align 위젯과 다르게 Stack 내부에서 만 사용 가능하다.
            Positioned(
              top: 40,  // 위에서 아래로 40 픽셀 설정
              right: 40, // 오른쪽에서 왼쪽으로 40 픽셀 설정
              child: Container(
                width: 150,
                height: 150,
                color: Colors.red,
              ),
            )
          ],
        ),
      )
    );
  }
}