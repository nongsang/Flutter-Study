import 'dart:convert';  // jsonDecode(), jsonEncode()를 사용하기 위해 포함해야 하는 패키지
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

class Todo {  // JSON 모델 클래스
  int id;
  String title;
  bool completed;

  Todo(this.id, this.title, this.completed);

  Todo.fromJson(Map<String, dynamic> json)  // JSON 문자열에서 디코딩으로 변환된 map에서, 데이터를 하나씩 받아와 모델 클래스에 저장
      : id = json['id'],
        title = json['title'],
        completed = json['completed'];

  Map<String, dynamic> toJson() => {  // 모델 클래스에서 데이터를 하나씩 받아와 map으로 변환하여 반환
    'id': id,
    'title': title,
    'completed': completed
  };
}

class MyAppState extends State<MyApp> {
  String jsonStr = '{"id": 1, "title": "HELLO", "completed": false}'; // JSON 문자열 원본
  Todo? todo; // JSON 문자열을 변환하여 데이터를 저장할 모델 클래스
  String result = ''; // 모델 클래스에 저장된 데이터를 JSON 문자열로 변환한 결과

  onPressDecode() { // JSON 문자열에서 모델 클래스로 변환 기능
    Map<String, dynamic> map = jsonDecode(jsonStr); // JSON 문자열에서 map으로 변환
    todo = Todo.fromJson(map);  // map으로 변환된 JSON 데이터를 모델 클래스로 변환
    setState(() {
      result =
          "decode : id: ${todo?.id}, title: ${todo?.title}, completed: ${todo?.completed}";
    });
  }

  onPressEncode() {
    setState(() {
      result = "encode : ${jsonEncode(todo)}";  // 형태가 map인 JSON 데이터를 JSON 문자열로 변환
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Test', style: TextStyle(color: Colors.white),),
          backgroundColor: Colors.blue,
          centerTitle: true,
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('$result'),
              ElevatedButton(
                child: Text('Decode'),
                onPressed: onPressDecode,
              ),
              ElevatedButton(
                child: Text('Encode'),
                onPressed: onPressEncode,
              )
            ],
          ),
        ),
      ),
    );
  }
}