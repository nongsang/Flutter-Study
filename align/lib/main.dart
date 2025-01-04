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
          title: Text("Test", style: TextStyle(color: Colors.white),),
          backgroundColor: Colors.blue,
          centerTitle: true,
        ),
        
        body: Align(
          alignment: Alignment.topRight,
          child: Container(
            color: Colors.red,
            width: 100,
            height: 100,
          ),
        ),
      )
    );
  }
}