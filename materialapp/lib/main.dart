import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp( // 구글에서 제공하는 머티리얼 디자인으로 출력
      debugShowCheckedModeBanner: false,  // 디버그 모드 일 때 우상단 디버그 표시 비활성화
      theme: ThemeData(
        primarySwatch: Colors.pink, // 전체 테마색을 분홍색으로 설정
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.orange, // 앱바 배경색을 오렌지 색으로
          foregroundColor: Colors.black // 앱바 글자 색을 검은색으로
        ),
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Test'),
          centerTitle: true,
        ),
        body: Center(
          child: Column(
            children: [
              ElevatedButton(
                  onPressed: (){},
                  child: Text('Button')
              ),
              Checkbox(value: true, onChanged: (value) {}),
              Text('Hello World'),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
            child: Icon(Icons.add),
            onPressed: () {}),
      ),
    );
  }
}