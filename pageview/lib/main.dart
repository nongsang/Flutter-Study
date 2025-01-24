import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  PageController controller = PageController( // 페이지 뷰 컨트롤러
    initialPage: 1, // 첫 페이지 설정
    viewportFraction: 0.8 // 현재 페이지가 화면을 80% 차지하도록 설정
  );

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

        body: PageView( // 페이지 뷰
          controller: controller,
          scrollDirection: Axis.horizontal, // 가로 스크롤
          children: [
            Container(
              margin: EdgeInsets.all(20),
              color: Colors.red,
              child: Center(
                child: Text('One Page', style: TextStyle(color: Colors.white, fontSize: 30)),
              )
            ),
            Container(
              margin: EdgeInsets.all(20),
              color: Colors.green,
              child: Center(
                  child: Text('Two Page', style: TextStyle(color: Colors.white, fontSize: 30))
                )
              ),
            Container(
              margin: EdgeInsets.all(20),
              color: Colors.blue,
              child: Center(
                  child: Text('Three Page', style: TextStyle(color: Colors.white, fontSize: 30)),
                )
              ),
          ],
        )
      ),
    );
  }
}