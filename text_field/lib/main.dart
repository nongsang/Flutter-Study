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
    return TestState();
  }
}

class TestState extends State<TestScreen> {
  final controller = TextEditingController(); // 텍스트 필드에 입력된 데이터를 저장할 수 있는 컨트롤러
  int textCounter = 0;

  // 입력이 발생할 때마다 호출할 함수
  void _printValue() {
    print('_printValue() : ${controller.text}');
    setState(() {
      textCounter = controller.text.length;
    });
  }

  @override
  void initState() {
    super.initState();
    controller.addListener(_printValue); // 컨트롤러에 함수 등록
  }

  @override
  void dispose() {
    controller.dispose(); // 컨트롤러 삭제
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextField(
          style: TextStyle(fontSize: 15),
          controller: controller, // 텍스트 필드에 입력한 데이터를 저장할 컨트롤러 등록
        ),

        ElevatedButton(
          child: Text('Submit'),
          onPressed: (){
            print('submit : ${controller.text}'); // 컨트롤러에 저장된 데이터 출력
          },
        )
      ],
    );
  }
}