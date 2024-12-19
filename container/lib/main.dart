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
        body: Container(
          color: Colors.yellow,
          child: Center(
            heightFactor: 2,  // Center가 차지하는 높이는 child 높이의 2배
            widthFactor: 2, // Center가 차지하는 너비는 child 너비의 2배
            child: Image.asset(
                'images/big.jpeg',
                width: 50,
                height: 50,
                fit: BoxFit.fill
            ),
          ),
        ),
      ),
    );
  }
}