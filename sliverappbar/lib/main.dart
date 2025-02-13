import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<StatefulWidget> createState() {
    return MyAppState();
  }
}

class MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: CustomScrollView( // 헤더 확장, 축소, 리스트 뷰와 그리드 뷰를 동시에 표시하는 등의 맞춤형 스크롤뷰
          slivers: [
            SliverAppBar( // 확장, 축소가 가능한 앱바
              leading: IconButton(
                icon: Icon(Icons.expand),
                onPressed: () {},
              ),
              expandedHeight: 200,  // 최대 확장 크기
              floating: true, // 앱바가 확장될 때 항목을 가리는가?
              pinned: true, // 리스트를 이동할 때 앱바를 항상 보이게 할 것인가?
              snap: true,  // 앱바 확장, 축소 때 애매한 크기가 아니라 항상 최소, 최대 크기로 설정하게 할 것인가?
              elevation: 50,  // 앱바 최소 크기
              backgroundColor: Colors.pink,
              flexibleSpace: Container( // 배경
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('images/big.jpeg'),
                    fit: BoxFit.fill,
                  )
                ),
              ),
              title: Text('AppBar Title'),
              actions: [
                IconButton(
                  icon: Icon(Icons.add_alert),
                  onPressed: () {},
                ),
                IconButton(
                  icon: Icon(Icons.phone),
                  onPressed: () {},
                ),
              ]
            ),
            SliverFixedExtentList(  // CustomScrollView에서 사용할 항목 리스트
              itemExtent: 50.0, // 각 항목의 크기
              delegate: SliverChildBuilderDelegate( // 항목을 생성할 때 호출할 이벤트
                childCount: 30, // 항목 개수
                  (BuildContext context, int index) { // 항목 구성 요소
                    return ListTile(
                      title: Text('Hello World Item $index'),
                    );
                  }
              ),
            )
          ],
        ),
      ),
    );
  }
}