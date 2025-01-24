import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  List<String> citys = [
    '서울', '인천', '부산', '대구', '대전', '광주', '울산', '세종', '태백', '울진'
  ];

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

        body: GridView.builder( // 그리드 뷰 출력
          itemCount: citys.length,
          scrollDirection: Axis.horizontal, // 스크롤할 방향 설정
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3), // 반대축 최대 개수 설정
          itemBuilder: (context, index) { // 항목을 생성할 때 호출할 이벤트
            return Card(
              child: Column(
                children: [
                  Text(citys[index]),
                  Image.asset('images/big.jpeg')
                ]
              ),
            );
          }   
        ),
      ),
    );
  }
}