import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// 스트림 함수
Stream<int> streamFun() async* {
  for (int i = 1; i <= 5; ++i) {
    await Future.delayed(Duration(seconds: 1));
    yield i;
  }
}

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
          title: Text('FutureProvider, StreamProvider', style: TextStyle(color: Colors.white)),
          backgroundColor: Colors.blue,
          centerTitle: true,
        ),
        body: MultiProvider(  // 멀티프로바이더로 여러 프로바이더 등록
          providers: [
            FutureProvider<String>(
              create: (context) => Future.delayed(Duration(seconds: 4), () => 'world'), // 4초 뒤에 world를 반환하는 퓨처 프로바이더
              initialData: 'hello',
            ),
            StreamProvider<int>(
              create: (context) => streamFun(), // 지속적으로 호출할 스트림을 등록하는 스트림 프로바이더
              initialData: 0,
            ),
          ],
          child: SubWidget(),
        ),
      ),
    );
  }
}

class SubWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var futureState = Provider.of<String>(context); // 퓨처 프로바이더로 등록한 String을 가져온다.
    var streamState = Provider.of<int>(context);  // 스트림 프로바이더로 등록한 int를 가져온다.

    return Container(
      color: Colors.red,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'future : ${futureState}',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 20
              ),
            ),
            Text(
              'stream : ${streamState}',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 20
              ),
            )
          ],
        ),
      ),
    );
  }
}