import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
   _ScreenState createState() {
    return _ScreenState();
  }
}

class _ScreenState extends State<MyApp>
  with SingleTickerProviderStateMixin { // TabController에 애니메이션 효과를 넣어줄 대상으로 지정

  late TabController controller;

  @override
  void initState() {  // 스테이트를 초기화하기 위해, 시작할 때 한번만 호출
    super.initState();
    controller = TabController(length: 3, vsync: this); // 탭을 클릭 했을 때 애니메이션 효과를 출력하는 컨트롤러
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Test', style: TextStyle(color: Colors.white)),
          backgroundColor: Colors.blue,
          centerTitle: true,
          bottom: TabBar( // 앱바 내에 탭바 생성
            controller: controller, // 애니메이션 출력 효과 컨트롤러 등록
              tabs: [
                Tab(text: 'One'),
                Tab(text: 'Two'),
                Tab(text: 'Three'),
              ]
          ),
        ),
        body: TabBarView( // 선택한 탭에 대한 정보로, 화면에 출력
          controller: controller,
          children: [
            Center(   // 첫번째 탭 선택시 출력
              child: Text(
                'One Screen',
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
            ),
            Center(   // 두번째 탭 선택시 출력
              child: Text(
                'Two Screen',
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
            ),
            Center(   // 세번째 탭 선택시 출력
              child: Text(
                'Three Screen',
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    );
  }
}