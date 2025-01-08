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
            Expanded(
              child: Container(
                color: Colors.red,
                width: 50,
              ),
            ),

            Expanded(
              child: Container(
                color: Colors.green,
                width: 50,
              ),
            ),

            Expanded(
              child: Container(
                color: Colors.yellow,
                width: 50,
              ),
            )
          ],
        ),
      )
    );
  }
}