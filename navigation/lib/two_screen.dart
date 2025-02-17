import 'package:flutter/material.dart';
import 'user.dart';

class TwoScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // JSON으로 보낸 데이터를 받아 사용
    Map<String, Object> args = ModalRoute.of(context)?.settings.arguments as Map<String, Object>;

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          appBar: AppBar(
            title: Text('Two Screen', style: TextStyle(color: Colors.white)),
            backgroundColor: Colors.blue,
            centerTitle: true,
          ),
          body: Container(
            color: Colors.green,
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Two Screen', style: TextStyle(color: Colors.white, fontSize: 30)),
                  Text('sendData: ${args['arg1']}, ${args['arg2']}, ${(args['arg3'] as User).name}'), // 받은 데이터를 화면에 출력
                  ElevatedButton(
                    child: Text('Go Three'),
                    onPressed: () {
                      Navigator.pushNamed(context, '/three'); // main.dart에 정의한 라우트 이름으로 화면 전환
                    },
                  ),
                  ElevatedButton(
                    child: Text('Pop'),
                    onPressed: () {
                      Navigator.pop(context, User('Seung', '010-1234-1234')); // 이전 화면으로 되돌아가면서 보낼 인수
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