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
        body: Stack(
          children: [
            Container(
              color: Colors.red,
            ),

            Container(
              color: Colors.green,
              width: 300,
              height: 300,
            ),

            Container(
              color: Colors.yellow,
              width: 150,
              height: 150,
            )
          ],
        ),
      )
    );
  }
}