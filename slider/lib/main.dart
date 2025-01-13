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
      ),
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
  double selectedValue = 5.0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Slider( // 슬라이더
          value: selectedValue, // 슬라이더의 현재값
          min: 0, // 슬라이더 최소값
          max: 10,  // 슬라이더 최대값
          onChanged: (double value){
            setState(() {
              selectedValue = value;
            });
          },
        ),
        Text('select value is $selectedValue'),
      ],
    );
  }
}