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
            Container(
              margin: EdgeInsets.only(bottom: 5),
              color: Colors.yellow,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start, // 교차축의 시작 부분에 모아서 배열
                children: [
                  Container(
                    width: 20, height: 40, color: Colors.red,
                  ),
                  Container(
                    width: 20, height: 20, color: Colors.green,
                  ),
                  Container(
                    width: 20, height: 60, color: Colors.blue,
                  ),
                ],
              ),
            ),

            Container(
              margin: EdgeInsets.only(bottom: 5),
              color: Colors.yellow,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center, // 교차축의 중앙에 모아서 배열
                children: [
                  Container(
                    width: 20, height: 40, color: Colors.red,
                  ),
                  Container(
                    width: 20, height: 20, color: Colors.green,
                  ),
                  Container(
                    width: 20, height: 60, color: Colors.blue,
                  ),
                ],
              ),
            ),

            Container(
              margin: EdgeInsets.only(bottom: 5),
              color: Colors.yellow,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.end, // 교차축의 끝 부분에 모아서 배열
                children: [
                  Container(
                    width: 20, height: 40, color: Colors.red,
                  ),
                  Container(
                    width: 20, height: 20, color: Colors.green,
                  ),
                  Container(
                    width: 20, height: 60, color: Colors.blue,
                  ),
                ],
              ),
            ),

            Container(
              margin: EdgeInsets.only(bottom: 5),
              color: Colors.yellow,
              height: 100,  // 위젯을 교차축으로 늘릴때 한계를 지정해줘야 한다.
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch, // 위젯을 교차축 최대 길이까지 늘림
                children: [
                  Container(
                    width: 20, height: 40, color: Colors.red,
                  ),
                  Container(
                    width: 20, height: 20, color: Colors.green,
                  ),
                  Container(
                    width: 20, height: 60, color: Colors.blue,
                  ),
                ],
              ),
            ),
          ]
        )
      )
    );
  }
}