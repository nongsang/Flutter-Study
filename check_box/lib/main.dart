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
      )
    );
  }
}

class TestScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return TestState();
  }
}

class TestState extends State<TestScreen> {
  bool? isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Checkbox( // 체크박스
          value : isChecked,  // 연결할 외부 멤버 변수
          onChanged: (bool? value) {
            setState(() {
              isChecked = value;
            });
          },
        ),
        Text('checkbox value is $isChecked'),
      ],
    );
  }
}