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
  String? selectedPlatform;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Radio(  // 라디오 버튼
              value: 'Android', // 선택할 경우 반환할 값
              groupValue: selectedPlatform, // 연결할 외부 변수
              onChanged: (String? value) {
                setState(() {
                  selectedPlatform = value;
                });
              },
            ),
            Text('Android'),
          ],
        ),

        Row(
          children: [
            Radio(  // 라디오 버튼
              value: 'iOS', // 선택할 경우 반환할 값
              groupValue: selectedPlatform, // 연결할 외부 변수
              onChanged: (String? value) {
                setState(() {
                  selectedPlatform = value;
                });
              },
            ),
            Text('iOS'),
          ],
        ),

        Text('select platform is $selectedPlatform'),
      ]
    );

  }

}