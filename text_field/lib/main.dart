import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

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
        Text('TextField Test'),
        TextField(
          style: TextStyle(fontSize: 15),
          controller: controller, // 텍스트 필드에 입력한 데이터를 저장할 컨트롤러 등록
          decoration: InputDecoration(
            labelText: 'Data',  // 라벨 이름
            prefixIcon: Icon(Icons.input), // TextField 앞에 출력할 아이콘
            border: OutlineInputBorder(), // TextField 테두리
            hintText: 'Hint Text', // 플레이스 홀더
            helperText: '데이터를 입력하세요', // 헬퍼 텍스트
            counterText: '$textCounter characters', // 문자 개수 출력
            //errorText: '잘못 입력했습니다'
          ),
          textInputAction: TextInputAction.search,  // 액션 버튼을 검색 버튼으로 설정
          keyboardType: TextInputType.emailAddress, // 키보드 유형을 숫자만 적을 수 있게 설정
          obscureText: true,  // 비밀번호 등 입력한 텍스트를 보이지 않게 설정
          minLines: 5,  // 최소 텍스트 필드 5줄
          maxLines: 5,  // 최대 텍스트 필드 5줄
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