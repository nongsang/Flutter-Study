import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Counter with ChangeNotifier { // 프로바이더에 등록할 객체
  int _count = 0;

  int get count => _count;

  void increment() {
    _count++;
    notifyListeners();  // ChangeNotifierProvider에서 제공하는, 프로바이더에 상태가 변했음을 알리는 함수
  }
}

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('ChangeNotifierProvider Test', style: TextStyle(color: Colors.white)),
          backgroundColor: Colors.blue,
          centerTitle: true,
        ),
        body: ChangeNotifierProvider<Counter>.value(  // 프로바이더에 등록된 Counter 객체를 찾아서 화면에 출력
          value: Counter(), // Counter 객체를 사용
          child: SubWidget(), // 결과를 출력할 위젯
        )
      ),
    );
  }
}

class SubWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var counter = Provider.of<Counter>(context);  // 프로바이더에 등록된 Counter 객체를 가져온다.

    return Container(
      color: Colors.orange,
      child: Center(
       child: Column(
         mainAxisAlignment: MainAxisAlignment.center,
         children: [
           Text(
             'Provider count : ${counter.count}',
             style: TextStyle(
               fontSize: 20,
               fontWeight: FontWeight.bold,
               color: Colors.white
             ),
           ),
           ElevatedButton(
             child: Text('increment'),
             onPressed: () {
               counter.increment(); // 버튼을 누르면, 가져온 Counter 객체의 increment() 함수 호출
             }
           )
         ],
       ),
      )
    );
  }
}