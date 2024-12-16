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
          backgroundColor: Colors.blue,
          title: Center(
            child: Text(
              'Text',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
        body: Image.asset('images/icon/user.png'),  // images/icon/ 하위 폴더에 있는 user.png 에셋 불러오기
      ),
    );
  }
}
