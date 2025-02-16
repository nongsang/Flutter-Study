import 'package:flutter/material.dart';

class FourScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text('Four Screen', style: TextStyle(color: Colors.white)),
          backgroundColor: Colors.blue,
          centerTitle: true,
        ),
        body: Container(
          color: Colors.green,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Four Screen', style: TextStyle(color: Colors.white, fontSize: 30)),
                ElevatedButton(
                  child: Text('Pop'),
                  onPressed: () {
                    Navigator.pop(context); // 이전 화면으로 되돌아가기
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