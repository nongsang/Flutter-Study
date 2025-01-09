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

        body: Row(
          children: [
            Image.asset('images/lab_instagram_icon_1.jpg'),
            Image.asset('images/lab_instagram_icon_2.jpg'),
            Image.asset('images/lab_instagram_icon_3.jpg'),
            Spacer(), // 공백 추가
            Image.asset('images/lab_instagram_icon_4.jpg'),
          ],
        ),
      ),
    );
  }
}