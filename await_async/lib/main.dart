import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  Future<int> funA() {
    return Future.delayed(Duration(seconds: 3), () {  // 대충 오래 걸리는 작업
      return 10;
    });
  }

  Future<int> funB(int arg) {
    return Future.delayed(Duration(seconds: 2), () {  // 대충 오래 걸리는 작업
      return arg * arg;
    });
  }

  // 하단 async, await로 정의한 함수와 같은 기능
  // then()을 사용하면 비동기 함수의 연쇄 실행이 가능하지만 연쇄 실행이 길어지면 가독성이 떨어진다.
  // Future<int> calFun() async {
  //   return funA().then((aResult) { // funA()의 실행이 끝난 후, 결과를
  //     return funB(aResult);  // funB()로 전달하여 실행
  //   }).then((bResult) {  // 이후
  //     return bResult;  // funB()의 실행 결과를 반환
  //   });
  // }

  Future<int> calFun() async {  // 비동기로 함수를 실행
    int aResult = await funA(); // funA()실행이 끝난 결과를 반환
    int bResult = await funB(aResult);  // 이후 funB() 실행 결과를 반환

    return bResult;
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

        body: Center(
          child: FutureBuilder(
            future: calFun(),
            builder: (context, snapshot) {
              if (snapshot.hasData) { // 비동기로 실행한 한수의 결과가 나온 이후에 출력할 내용 정의
                return Center(
                  child: Text(
                    '${snapshot.data}',
                    style: TextStyle(color: Colors.black, fontSize: 30),
                  ),
                );
              }

              return Center(  // 비동기로 실행한 함수의 결과가 나오기 전까지 출력할 내용 정의
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
                      style: TextStyle(color: Colors.black, fontSize: 30),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}