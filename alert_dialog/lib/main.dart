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
      )
    );
  }
}

class TestScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return ScreenState();
  }
}

class ScreenState extends State<TestScreen> {

  _dialog() { // 버튼을 누르면 호출할 이벤트
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog( // 대화창 설정
            title: Text('Dialog Title'),  // 제목
            content: Text('Dialog Message'),  // 메세지
            actions: [
              TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();  // 버튼을 눌렀을 때 대화창 닫기
                    },
                  child: Text('OK')
              )
            ],
          );
        }
    );
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
          onPressed: _dialog,
          child: Text('dialog')
      ),
    );
  }
}