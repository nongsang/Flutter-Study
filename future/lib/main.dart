import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  Future<int> sum() { // 함수를 실행하면 미래에 int형 값을 반환받을 수 있는 클래스
    return Future<int>(() {
      var sum = 0;
      for (int i = 0; i< 500000000; ++i) {
        sum += i;
      }
      return sum;
    });
  }

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
        body: FutureBuilder(  // 미래에 반환 받는 값이 존재할 경우 화면을 갱신해주는 클래스
          future: sum(),  // Future를 반환하는 함수를 등록 및 실행
          builder: (context, snapshot) {  // future에 등록한 함수를 반환받을 때 실행한 함수의 결과값으로 화면을 갱신
            if (snapshot.hasData) { // 계산 결과가 나올 때 화면 갱신
              return Center(
                child: Text(
                  '${snapshot.data}',
                  style: TextStyle(color: Colors.black, fontSize: 30),
                ),
              );
            }
            return Center(  // 계산 결과가 아직 나오지 않은 경우 출력할 화면
              child: Text(
                'waiting',
                style: TextStyle(color: Colors.black, fontSize: 30),
              ),
            );
          },
        ),
      ),
    );
  }
}