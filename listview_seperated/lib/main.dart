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

        body: TestScreen(),
      ),
    );
  }
}

class TestScreen extends StatelessWidget {

  List<String> citys = [
    '서울', '인천', '부산', '대구', '대전', '광주', '울산', '세종'
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.separated(  // ListView.builder()와 비슷하지만 항목 구분자를 포함한다.
      itemCount: citys.length,  // 출력할 항목의 최대 개수
      itemBuilder: (context, index) { // 항목을 생성할 때 호출할 이벤트
        return Container(
          padding: EdgeInsets.only(left: 10, top: 10),
          height: 200,
          child: Text(citys[index]),
        );
      },
      separatorBuilder: (context, index) {  // 항목 구분자 정보
        return Divider(height: 2, color: Colors.black);
      },
    );
  }
}