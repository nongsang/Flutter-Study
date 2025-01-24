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

        body: TestScreen()
      ),
    );
  }
}

class TestScreen extends StatelessWidget {

  PageController controller = PageController(
    initialPage: 1,
    viewportFraction: 0.8
  );

  List<String> pages = [
    'One Page', 'Two Page', 'Three Page'
  ];

  @override
  Widget build(BuildContext context) {
    return PageView.builder(  // 페이지를 필요할 때 생성한다.
      controller: controller, // 초기 설정 컨트롤러
      itemCount: pages.length,
      itemBuilder: (context, index) { // 페이지를 생성할 때 호출되는 이벤트
        return Container(
          margin: EdgeInsets.all(20),
          color: Colors.red,
          child: Center(
            child: Text(pages[index], style: TextStyle(color: Colors.white, fontSize: 30)),
          ),
        );
      },
    );
  }
}