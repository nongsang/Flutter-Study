import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  bool _isDeepLink = true;  // 딥링크로 실행 여부, 딥링크로 실행하면 첫 화면을 다른 페이지로 실행할 수 있다.

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Navigetor Test",
      home: Navigator(  // 내비게이터 사용
        pages: [  // 추가한 순서대로 내비게이터 스택에 추가, 가장 위에 있는 페이지가 화면에 출력
          MaterialPage(
            child: OneScreen()
          ),
          if (_isDeepLink)  // 딥 링크로 설정되어 있으면
            MaterialPage(child: TwoScreen())  // TwoScreen 위젯 추가
        ],
        onPopPage: (route, result) => route.didPop(result), // 내비게이션 스택에 2개 이상 페이지가 있으면, 앱바에 뒤로가기 버튼이 추가되고,
                                                            // 뒤로 가기 버튼을 클릭했을 때, 호출할 이벤트
                                                            // 내비게이션 스택에서 현재 페이지 삭제
      )
    );
  }
}

class OneScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('OneScreen', style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.blue,
        centerTitle: true,
      ),
      body: Container(
        color: Colors.red,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('OneScreen', style: TextStyle(color: Colors.white, fontSize: 30))
            ],
          )
        ),
      )
    );
  }
}

class TwoScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('TwoScreen', style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.blue,
        centerTitle: true,
      ),
      body: Container(
        color: Colors.cyan,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('TwoScreen', style: TextStyle(color: Colors.white, fontSize: 30)),
              ElevatedButton(
                child: Text('Pop'),
                onPressed: () {
                  Navigator.pop(context);
                },
              )
            ],
          ),
        )
      ),
    );
  }
}