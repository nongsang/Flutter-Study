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
  ReceivePort subPort = ReceivePort();  // 8. 메인 포트에 알려줄 서브 포트를 생성
  mainPort.send({'port': subPort.sendPort});  // 9. 메인 포트로 서브 포트의 정보를 알려준다.
  subPort.listen((message) {  // 10. 메인 아이솔레이트에서 전달하는 데이터를 처리하는 이벤트 등록
    if (message['msg'] != 'bye') {  // 13. 메인 아이솔레이트에서 보내는 데이터가 bye가 아니라면
      int count = message['msg'];
      mainPort.send({'msg': count * count});  // 14. 메인 아이솔레이트로 계산 값을 전달한다.
    } else {
      subPort.close();  // 20. 메인 아이솔레이트에서 보내는 데이터가 bye라면 서브 포트를 닫는다.
    }
  });
}

class MyAppState extends State<MyApp> {
  String result = '';

  void onPress() async {  // 2. 버튼이 눌리면 실행할 함수
    ReceivePort mainPort = ReceivePort(); // 3. 메인 포트를 생성
    await Isolate.spawn(myIsolate, mainPort.sendPort);  // 4. 서브 아이솔레이트를 생성하면서 메인 포트를 알려준다.

    SendPort? subPort;  // 5. 서브 아이솔레이트에서 생성한 서브 포트에 대한 정보를 받을 포트 변수
    mainPort.listen((message) { // 6. 서브 아이솔레이트에서, 메인 포트로 전달하는 데이터를 처리하는 함수 등록
      if (message['port'] != null) {  // 10. 서브 아이솔레이트에서 생성한 포트에 대한 정보를 전달하면
        subPort = message['port'];  // 11. 포트 연결
      } else if (message['msg'] != null) {  // 15. 서브 아이솔레이트에서 메시지를 전달하면
        setState(() {
          result = 'msg : ${message['msg']}'; // 16. 메시지 저장 및 리빌드
        });
      }
    });

    int count = 0;
    Timer.periodic(Duration(seconds: 1), (timer) {  // 7. 1초마다 실행할 이벤트 등록
      if (++count < 6) {
        subPort?.send({'msg': count}); // 12. 1초마다 {'msg' : count}의 map 형태 데이터로 서브 포트로 전달
      } else {
        subPort?.send({'msg': 'bye'});  // 18. 제한이 끝나면 {'msg' : 'bye'} 데이터를 보낸다.
        mainPort.close(); // 19. 모든 작업이 끝났으므로 메인 포트를 닫는다.
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Test',style: TextStyle(color: Colors.white)),
          backgroundColor: Colors.blue,
          centerTitle: true,
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                result,
                style: TextStyle(fontSize: 30),
              ),
              ElevatedButton(
                child: Text('test1'),
                onPressed: onPress, // 1. 버튼을 누른다.
              ),
            ],
          ),
        ),
      ),
    );
  }
}