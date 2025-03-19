import 'package:flutter/material.dart';

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
          title: Text('Inherited Test', style: TextStyle(color: Colors.white)),
          backgroundColor: Colors.blue,
          centerTitle: true,
        ),

        body: MyInheritedWidget(TestWidget()),  // 최상위 위젯은 MyInheritedWidget이며, TestWidget()을 하위 위젯으로 등록
      ),
    );
  }
}

// InheritedWidget을 상속받아서 화면을 출력하지 않고, 상태만 관리하는 위젯
// 하위에 생성된 위젯들이 공용으로 사용하기 위해 사용하는 위젯
class MyInheritedWidget extends InheritedWidget {
  int count = 0;

  MyInheritedWidget(child) : super(child: child);

  // 하위 위젯에서 실행할 함수
  increment() {
    ++count;
  }

  // InheritedWidget의 상위 위젯에서 리빌드로 위젯의 인스턴스가 대체되면 호출하는 함수
  // true를 반환하면 InheritedWidget의 하위 위젯들에 상위 위젯의 변경이 발생했으므로 리빌드하는 작업을 한다.
  @override
  bool updateShouldNotify(InheritedWidget oldWidget) {
    print('updateShouldNotify');
    return true;
  }

  // 하위 위젯이 InheritedWidget 객체를 얻기 위해 호출하는 함수
  // 어디서든 호출할 수 있어야 하기 때문에 static으로 선언
  static MyInheritedWidget? of(BuildContext context) =>
      context.dependOnInheritedWidgetOfExactType<MyInheritedWidget>();
}

class TestSubWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    int count = MyInheritedWidget.of(context)!.count;
    return Container(
      width: 200,
      height: 200,
      color: Colors.yellow,
      child: Text(
        'SubWidget : $count',
        style: TextStyle(
          color: Colors.white,
          fontSize: 20,
          fontWeight: FontWeight.bold
        ),
      ),
    );
  }
}

class TestWidget extends StatelessWidget {
  TestWidget() {
    print('TestWidget constructor..');
  }

  @override
  Widget build(BuildContext context) {
    return StatefulBuilder(
      builder: (BuildContext context, StateSetter setState) {
        MyInheritedWidget? widget = MyInheritedWidget.of(context);  // InheritedWidget 객체 반환
        int counter = MyInheritedWidget.of(context)!.count; // MyInheritedWidget 위젯의 변수를 반환
        Function increment = MyInheritedWidget.of(context)!.increment;  // MyInheritedWidget 위젯의 함수를 반환

        return Center(
          child: Container(
            color: Colors.red,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  'TestWidget : $counter',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold
                  ),
                ),
                ElevatedButton(
                  child: Text('incremente()'),
                    onPressed: () => setState(() => increment())  // MyInheritedWidget 위젯의 함수를 실행
                ),
                ElevatedButton(
                  child: Text('conut++'),
                  onPressed: () {
                    setState(() => widget!.count++);  // MyInheritedWidget 위젯의 변수의 값을 변경
                  }),
                TestSubWidget(),  // 하위 위젯 생성
              ],
            ),
          ),
        );
      }
    );
  }
}