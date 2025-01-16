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
          title: Text("Test", style: TextStyle(color: Colors.white)),
          backgroundColor: Colors.blue,
          centerTitle: true,
        ),
        body: TestScreen(),
      ),
    );
  }
}

class TestScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => MyFormState();
}

class MyFormState extends State<TestScreen> {
  // Form은 데이터 유효성 검증, 데이터 저장할 때 key값으로 Form 객체를 얻기 때문에, Form 위젯에 key를 대입해줘야 한다.
  // FormState는 Form의 상태를 나타내는 객체다.
  final _formKey = GlobalKey<FormState>();

  String? firstName;
  String? lastName;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          Text('Form Test'),
          TextFormField(
            decoration: InputDecoration(
              labelText: 'First Name',
            ),
            validator: (value) {  // 입력이 올바른지 검사하는 이벤트 등록
              if(value?.isEmpty ?? false) { // 입력값이 비어있으면 메시지 출력
                return 'Please enter first name';
              }
              return null;  // 입력이 올바른 경우 검사 통과
            },

            onSaved: (String? value) {  // 데이터 저장 이벤트 등록
              firstName = value;
            },
          ),

          TextFormField(
            decoration: InputDecoration(
              labelText: 'Last Name',
            ),

            validator: (value) {
              if (value?.isEmpty ?? false) {
                return 'Please enter last name';
              }
              return null;
            },

            onSaved: (String? value) {
              lastName = value;
            },
          ),
          ElevatedButton(
            onPressed: () {
              if (_formKey.currentState?.validate() ?? false) { // 현재 입력된 폼의 값이 유효하다면
                _formKey.currentState?.save();  // onSaved에 등록한 이벤트 실행
                print('firstName: $firstName, lastName: $lastName');
              }
            },
            child: Text('submit'),
          )
        ],
      ),
    );
  }
}