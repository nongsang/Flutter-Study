import 'dart:async';
import 'dart:isolate';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<StatefulWidget> createState() {
    return MyAppState();
  }
}

myIsolate(SendPort mainPort) {
  ReceivePort isoPort = ReceivePort();
  mainPort.send({'port' : isoPort.sendPort});
  isoPort.listen((message) {
    if (message['msg'] != 'bye') {
      int count = message['msg'];
      mainPort.send({'msg' : count * count});
    } else {
      isoPort.close();
    }
  });
}

class MyAppState extends State<MyApp> {
  String result = '';

  void onPress() async {  // 메인 아이솔레이트 실행
    ReceivePort mainPort = ReceivePort(); // 2. 메인 포트 생성

    await Isolate.spawn(myIsolate, mainPort.sendPort);  // 3. 메인 아이솔레이트에서 서브 아이솔레이트를 생성

    SendPort? subPort;
    mainPort.listen((message) {
      if (message['port'] != null) {
        subPort = message['port'];
      } else if (message['port'] != null) {
        setState(() {
          result = 'msg : ${message['msg']}';
        });
      }
    });

    int count = 0;
    Timer.periodic(Duration(seconds: 1), (timer) {
      if (++count < 6) {
        subPort?.send({'msg' : count});
      } else {
        subPort?.send({'msg' : 'bye'});
        mainPort.close();
      }
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

        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                result,
                style: TextStyle(fontSize: 20),
              ),
              ElevatedButton(
                child: Text('test1'),
                onPressed: onPress, // 1. 버튼을 누르면
              )
            ],
          ),
        ),
      ),
    );
  }
}