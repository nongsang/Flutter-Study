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
  int _selectedIndex = 0;

  List<Widget> _widgetOptions = [
    Text(
      'First Screen',
      style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
    ),
    Text(
      'Second Screen',
      style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
    ),
    Text(
      'Third Screen',
      style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
    ),
    Text(
      'Fourth Screen',
      style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
    ),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          bottom: PreferredSize(  //앱바 하단 부분
            preferredSize: const Size.fromHeight(48.0), // 높이는 48 픽셀
            child: Theme(
              data: ThemeData.from(
                colorScheme: ColorScheme.fromSwatch(accentColor: Colors.white)
              ),
              child: Container(
                height: 48.0, // 앱바 하단 높이와 맞춤
                alignment: Alignment.center,
                child: Text('AppBar Bottom Text'),
              ),
            ),
          ),
          flexibleSpace: Container( // 앱바 상단과 하단 사이의 여백
            decoration: BoxDecoration(  // 내부를 그림으로 채우기
              image: DecorationImage(
                image: AssetImage('images/big.jpeg'),
                fit: BoxFit.fill,
              )
            ),
          ),
          title: Text('AppBar Title', style: TextStyle(color: Colors.white),),  // 타이틀
          actions: [  // 앱바 우상단에 사용자 이벤트를 추가
            IconButton(
              icon: const Icon(Icons.add_alert),
              onPressed: () {},
            ),
            IconButton(
              icon: const Icon(Icons.phone),
              onPressed: () {},
            ),
          ],
        ),
        bottomNavigationBar: BottomNavigationBar( // 하단 내비게이션 바
          type: BottomNavigationBarType.shifting, // 내비게이션 버튼을 누를 때
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'First',
              backgroundColor: Colors.green // 버튼이 선택되면 배경색을 초록색으로 설정, BottomNavigationBarType이 shifting 일때만 사용 가능
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.business),
                label: 'Second',
                backgroundColor: Colors.red
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.school),
                label: 'Third',
                backgroundColor: Colors.purple
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.school),
                label: 'Fourth',
                backgroundColor: Colors.pink
            ),
          ],
          currentIndex: _selectedIndex,
          selectedItemColor: Colors.amber[800], // 버튼이 선택되면 설정할 버튼색
          onTap: _onItemTapped,
        ),
        drawer: Drawer( // 드로우어 추가, 드로우어를 추가하면 앱바 좌상단에 버튼이 자동 추가
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              DrawerHeader( // 드로우어 헤더 설정
                child: Text('Drawer Header'),
                decoration: BoxDecoration(
                  color: Colors.blue
                ),
              ),
              ListTile(
                title: Text('Item 1'),
                onTap: () {},
              ),
              ListTile(
                title: Text('Item 2'),
                onTap: () {},
              ),
            ],
          )
        ),
        body: Center(
          child: _widgetOptions.elementAt(_selectedIndex),
        ),
        floatingActionButton: FloatingActionButton( // 우하단 버튼 생성
          onPressed: () {},
          child: Icon(Icons.add),
        ),
      ),
    );
  }
}