import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  List<Widget> getWidget() {
    List<Widget> widgets = [];

    for(int i = 0; i < 100; ++i) {
      widgets.add(
        ListTile(title: Text('Hello world $i'))
      );
    }

    return widgets;
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: SafeArea( // 기기별로 설정된 SafeArea에 맞게 출력
          child: SingleChildScrollView(
            child: Column(
              children: getWidget(),
            ),
          ),
        ),
      ),
    );
  }
}