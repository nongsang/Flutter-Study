import 'package:flutter/material.dart';

class ThreeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text('Three Screen', style: TextStyle(color: Colors.white)),
          backgroundColor: Colors.blue,
          centerTitle: true,
        ),
        body: Container(
          color: Colors.yellow,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Three Screen', style: TextStyle(color: Colors.white, fontSize: 30)),
                ElevatedButton(
                  child: Text('Go Four'),
                  onPressed: () {
                    Navigator.pushNamed(context, '/four');  // main.dart에 정의한 라우트 이름으로 화면 전환
                  },
                ),
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