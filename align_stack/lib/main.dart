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
            Container(color: Colors.red,),
            Align(
              alignment: Alignment.center,
              child: Container(
                width: 300,
                height: 300,
                color: Colors.green,
              ),
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: Container(
                width: 150,
                height: 150,
                color: Colors.yellow,
              )
            )
          ],
        ),
      ),
    );
  }
}