import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// Bloc 패턴에서 이벤트를 정의하는 클래스
abstract class CounterEvent {
  int num;

  CounterEvent(this.num);
}

// 증가 이벤트 정의
class IncrementEvent extends CounterEvent {
  IncrementEvent(int num) : super(num);
}

// 감소 이벤트 정의
class DecrementEvent extends CounterEvent {
  DecrementEvent(int num) : super(num);
}

// Bloc 패턴에서 매우 중요한 Bloc 클래스
// 이벤트에 따라 적절한 로직를 실행하고 상태를 유지 하고 사용할 수 있게 한다.
class BlocCounter extends Bloc<CounterEvent, int> { // CounterEvent는 이벤트를 발생시킬 클래스, int는 상태
  BlocCounter() : super(0) {
    // 감지할 이벤트 등록 1
    on<IncrementEvent>((event, emit) {  // IncrementEvent는 이벤트 정보, emit은 상태를 내보낼 함수
      emit(state + event.num);  // 위젯에서 이용할 상태값
    });

    // 감지할 이벤트 등록 2
    on<DecrementEvent>((event, emit) => emit(state - event.num));
  }

  @override
  void onEvent(CounterEvent event) {  // 이벤트가 발생할 때마다 자동으로 호출될 Bloc 이벤트
    super.onEvent(event);
  }

  @override
  void onTransition(Transition<CounterEvent, int> transition) { // 상태의 변경이 발생할 때 호출될 Bloc 이벤트
    super.onTransition(transition);
    print('transition... ${transition}');
  }

  @override
  void onError(Object error, StackTrace stackTrace) { // 오류가 발생할 때 자동으로 호출되는 Bloc 이벤트
    super.onError(error, stackTrace);
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
          title: Text('Bloc Test', style: TextStyle(color: Colors.white)),
          backgroundColor: Colors.blue,
          centerTitle: true,
        ),
        body: BlocProvider<BlocCounter>(  // Bloc 클래스를 위젯에서 이용할 수 있도록 등록
          create: (context) => BlocCounter(),
          child: MyWidget(),
        ),
      ),
    );
  }
}

class MyWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final BlocCounter counterBloc = BlocProvider.of<BlocCounter>(context);  // 등록한 Bloc 클래스를 찾는다.
    return BlocBuilder<BlocCounter, int>(
      builder: (context, count) {
        return Container(
          color: Colors.deepOrange,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  '${counterBloc.state}',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: Colors.white
                  ),
                ),
                ElevatedButton(
                  child: Text('increment'),
                  onPressed: () {
                    counterBloc.add(IncrementEvent(2)); // 증가 함수 주입
                  },
                ),
                ElevatedButton(
                  child: Text('decrement'),
                  onPressed: () {
                    counterBloc.add(DecrementEvent(2)); // 감소 함수 주입
                  },
                )
              ],
            ),
          )
        );
      },
    );
  }
}