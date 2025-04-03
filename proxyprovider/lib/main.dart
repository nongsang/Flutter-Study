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

class Sum {
  int _sum = 0;

  int get sum => _sum;

  void set sum(value) {
    _sum = 0;

    for (int i = 1; i <= value; ++i) {
      _sum += i;
    }
  }

  Sum(Counter counter) {
    sum = counter.count;
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
        body: MultiProvider(  // 멀티 프로바이더를 이용한 여러 프로바이더를 등록
          providers: [
            ChangeNotifierProvider<Counter>.value(  // Counter 객체를 프로바이더에 등록
              value: Counter(), // Counter 객체를 사용
            ),
            ProxyProvider<Counter, Sum>(  // 변화가 발생했음을 프로바이더에 알리면, Counter의 상태로 Sum의 상태를 변경하는 함수를 실행한다.
              update: (context, model, sum) {
                if (sum != null) {  // 이전에 생성한 Sum 객체가 있다면
                  sum.sum = model.count;  // Counter에 있는 값으로 Sum 상태 갱신
                  return sum; // Sum 객체 반환
                } else {  // 이전에 생성한 Sum 객체가 없다면
                  return Sum(model);  // 새로운 Sum 객체 생성
                }
              }
            ),
            ProxyProvider2<Counter, Sum, String>( // Counter, Sum 객체로 String 객체를 반환
              update: (context, model1, model2, data) {
                return 'count : ${model1.count}, sum : ${model2.sum}';
              }
            )
          ],
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
    var sum = Provider.of<Sum>(context);
    var string_data = Provider.of<String>(context);

    return Container(
        color: Colors.orange,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'count : ${counter.count}',
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white
                ),
              ),
              Text(
                'sum : ${sum.sum}',
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white
                ),
              ),
              Text(
                'string : ${string_data}',
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