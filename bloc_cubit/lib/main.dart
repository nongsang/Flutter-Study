import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// Cubit 클래스
class CounterCubit extends Cubit<int> {
  CounterCubit() : super(0);
  void increment() => emit(state + 1);  // 상태를 변경하는 함수 1
  void decrement() => emit(state - 1);  // 상태를 변경하는 함수 2
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
          title: Text('Cubit Test', style: TextStyle(color: Colors.white)),
          backgroundColor: Colors.blue,
          centerTitle: true,
        ),
        body: BlocProvider( // Bloc 클래스를 등록
          create: (context) => CounterCubit(),  // Cubit 객체 생성
          child: MyWidget(),
        )
      ),
    );
  }
}

class MyWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var cubit = BlocProvider.of<CounterCubit>(context); // Bloc에 등록된 Cubit 객체 가져오기
    return BlocBuilder<CounterCubit, int>(  // BlocProvider.of() 대신에 CounterCubit 객체의 상태를 가져오는 다른 방법
      builder: (context, count) { // count는 int 타입인 CounterCubit의 상태
        return Container(
          color: Colors.deepOrange,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Cubit : ${count}',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 20
                  ),
                ),
                ElevatedButton(
                  child: Text('increment'),
                  onPressed: () {
                    cubit.increment();  // Cubit 객체의 함수를 직접 호출
                  },
                ),
                ElevatedButton(
                  child: Text('decrement'),
                  onPressed: () {
                    cubit.decrement();  // Cubit 객체의 함수를 직접 호출
                  },
                )
              ],
            ),
          ),
        );
      },
    );
  }
}