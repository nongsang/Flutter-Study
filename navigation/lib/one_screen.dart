import 'package:flutter/material.dart';

class OneScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text('One Screen', style: TextStyle(color: Colors.white)),
          backgroundColor: Colors.blue,
          centerTitle: true,
        ),
        body: Container(
          color: Colors.red,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('One Screen', style: TextStyle(color: Colors.white, fontSize: 30)),
                ElevatedButton(
                  child: Text('Go Two'),
                  onPressed: () {
                    Navigator.pushNamed(context, '/two'); // main.dart에 정의한 라우트 이름으로 화면 전환
                  },
                )
              ],
            ),
          ),
        )
      ),
    );
  }
}