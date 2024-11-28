import 'package:flutter/material.dart';

void main() {
  runApp(SplashScreen()); // SplashScreen 위젯을 첫 화면으로 지정
}

class SplashScreen extends StatelessWidget { // StatelessWidget 선언
  @override
  Widget build(BuildContext context) { // 위젯의 UI 구현
    return MaterialApp( // MaterialApp 위젯 반환
      home: Scaffold( // Scaffold 위젯 설정
        body: Container(
          decoration: BoxDecoration(  // 흰색 배경
            color: Colors.white,
          ),

          child: Column(  // 로고와 로딩표시 세로 정렬
            mainAxisAlignment: MainAxisAlignment.center, // 세로 중앙 정렬
            children: [
              Image.asset(
                  "assets/logo.png"
              ),

              CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation( // valueColor는 애니메이션 도중 색상을 설정할 수 있다.
                  Color(0xffe6ab3d), // 헥스코드, ARGB 순서로 입력해야 한다.
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
