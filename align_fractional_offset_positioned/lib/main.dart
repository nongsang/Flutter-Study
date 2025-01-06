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

        body: Stack(
          children: [
            Align(
              alignment: Alignment.center,
              child: Container(
                color: Colors.yellow,
                width: 150,
                height: 150,
              ),
            ),

            Align(
              alignment: FractionalOffset(1.0, 0.0),
              child: Container(
                color: Colors.blue,
                width: 150,
                height: 150,
              ),
            ),

            Positioned(
              top: 40,
              left: 40,
              child: Container(
                color: Colors.red,
                height: 150,
                width: 150,
              ),
            )
          ],
        ),
      )
    );
  }
}