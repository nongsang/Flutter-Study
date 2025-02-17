import 'package:flutter/material.dart';
import 'user.dart';

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
                  // onPressed: () {
                  //   Navigator.pushNamed(context, '/two'); // main.dart에 정의한 라우트 이름으로 화면 전환
                  // },

                  onPressed: () async {
                    final result = await Navigator.pushNamed(
                      context,
                      '/two',
                      arguments: {  // 화면전환할 때 인수 전달, JSON 형태로 전달 중
                        'arg1' : 10,  // Object 이므로, 사용 시 int로 형변환 하여 사용
                        'arg2' : 'hello', // Object 이므로, 사용 시 String으로 형변환하여 사용
                        'arg3' : User('Shin', '서울시')  // Object 이므로, 사용 시 User로 형변환하여 사용
                      }
                    );

                    print('result: ${(result as User).name}');
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