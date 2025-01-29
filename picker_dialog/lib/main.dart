import 'package:flutter/material.dart';
import 'package:intl/intl.dart';  // 날짜를 원하는 형태로 출력하게 해주는 패키지

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
          title: Text('Test', style: TextStyle(color: Colors.white)),
          backgroundColor: Colors.blue,
          centerTitle: true,
        ),

        body: TestScreen()
      ),
    );
  }
}

class TestScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return ScreenState();
  }
}

class ScreenState extends State<TestScreen> {
  DateTime dateValue = DateTime.now();
  TimeOfDay timeValue = TimeOfDay.now();

  Future datePicker() async { // 비동기로 날짜를 선택하는 이벤트 실행
    DateTime? picked = await showDatePicker(  // 날짜 선택기 출력
        context: context,
        initialDate: DateTime.now(),  // 초기화 날짜는 오늘
        firstDate: DateTime(2020),  // 2020년 부터
        lastDate: DateTime(2030)  // 2030년까지 선택 가능
    );

    if (picked != null) { // 날짜가 선택되었으면
      setState(() {
        dateValue = picked; // 선택한 날짜 저장
      });
    }
  }

  Future timePicker() async { // 비동기로 시간을 선택하는 이벤트 실행
    TimeOfDay? picked = await showTimePicker( // 시간 선택기 출력
        context: context,
        initialTime: TimeOfDay.now()  // 초기화 시간은 현재 시간
    );

    if (picked != null) { // 시간이 선택되었으면
      setState(() {
        timeValue = picked; // 선택한 시간 저장
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ElevatedButton(
              onPressed: datePicker,
              child: Text('datepicker'),
          ),
          Text('date : ${DateFormat('yyyy-MM-dd').format(dateValue)}'), // intl 패키지를 추가하여 사용가능한 DateFormat으로 출력 방식 지정
                                                                        // dateValue.year, dateValue.month 등을 직접적으로 사용가능하다.
          ElevatedButton(
              onPressed: timePicker,
              child: Text('timepicker'),
          ),
          Text('time : ${timeValue.hour} : ${timeValue.minute}'),
        ],
      )
    );
  }
}