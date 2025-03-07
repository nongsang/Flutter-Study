import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // 하단 calFun()과 test()와 같은 기능을 한다.
  // 차이점이 있다면 스트림에서 제공하는 여러가지 기능(발생 횟수, 주기, 조건)을 사용하지 않고 직접 구현했다는 점
  // Stream<int> streamFun() async* { // async*는 async와 달리 여러번 값을 반환한다는 의미
  //   for (int i = 0; i < 5; ++i) {
  //     await Future.delayed(Duration(seconds: 2));  // 2초 딜레이
  //     yield i * i; // 값을 차례로 반환
  //   }
  // }
  //
  // void onPress() async {
  //   await for(int value in streamFun()) {  // streamFun()에 정의한 횟수 만큼 호출
  //     print('value : $value');
  //   }
  // }

  int calFun(int x) {
    return x * x;
  }

  Stream<int> test() {  // Future는 미래에 한번만 데이터를 반환, Stream은 미래에 반복적으로 반환한다.
    Duration duration = Duration(seconds: 2);
    Stream<int> stream = Stream<int>.periodic(duration, calFun);  // 2초 단위로 calFun()를 매번 호출
    return stream.take(5);  // 함수에 0부터 인자를 전달하면서 5번 호출
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

        body: StreamBuilder(  // 미래에 여러번 발생할 데이터를 받아 화면에 지속적으로 화면에 출력해주는 기능
          stream: test(),
          builder: (BuildContext context, AsyncSnapshot<int> snapshot) {
            if (snapshot.connectionState == ConnectionState.done) { // 모든 데이터 발생이 끝날 경우
              return Center(
                child: Text(
                  'Completed',
                  style: TextStyle(fontSize: 30),
                ),
              );
            }
            else if (snapshot.connectionState == ConnectionState.waiting) { // 한번도 데이터가 발생하지 않은 경우
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 100,
                      height: 100,
                      child: CircularProgressIndicator(),
                    ),
                    Text(
                      'waiting...',
                      style: TextStyle(fontSize: 20),
                    )
                  ],
                ),
              );
            }
            return Center(  // 중간중간 데이터가 발생했을 경우
              child: Text(
                'data : ${snapshot.data}',
                style: TextStyle(fontSize: 30),
              ),
            );
          },
        ),
      ),
    );
  }
}