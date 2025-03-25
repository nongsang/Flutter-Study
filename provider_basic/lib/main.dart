import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
          title: Text('Provider Test', style: TextStyle(color: Colors.white)),
          backgroundColor: Colors.blue,
          centerTitle: true,
        ),

        // 프로바이더에 상태 하나를 하위 위젯이 사용할 상태 데이터로 등록한다.
        // body: Provider<int>.value(
        //   value: 10,
        //   child: SubWidget(),
        // )

        body: Provider<int>(  // 프로바이더로 함수를 실행한 결과를 하위 위젯이 사용할 상태 데이터로 등록한다.
          create: (context) {
            int sum = 0;
            for (int i = 1; i <= 10; ++i) {
              sum += i;
            }
            return sum;
          },
          child: SubWidget(),
        ),
      ),
    );
  }
}

class SubWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final data = Provider.of<int>(context); // 프로바이더에 등록한 상태 데이터를 얻을 수 있다.
    return Container(
      color: Colors.orange,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'I am SubWidget',
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white
              ),
            ),
            Text(
              'Provider Data : ${data}',
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white
              ),
            )
          ],
        ),
      )
    );
  }
}