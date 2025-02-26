import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

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

class MyAppState extends State<MyApp> {
  String result = '';

  onPressGet() async {
    Map<String, String> headers = { // Header를 map 형태로 정의
      "content-type": "application/json",
      "accept": "application/json",
    };

    http.Response response = await http.get(  // 서버로 get 요청
        Uri.parse('https://jsonplaceholder.typicode.com/posts/1'),
        headers: headers);
    if (response.statusCode == 200) {
      setState(() {
        result = response.body;
      });
    } else {
      print('error......');
    }
  }

  onPressPost() async {
    try {
      http.Response response = await http.post( // 서버로 post 요청
          Uri.parse('https://jsonplaceholder.typicode.com/posts'),
          body: {'title': 'hello', 'body': 'world', 'userId': '1'});
      print('statusCode : ${response.statusCode}');
      if (response.statusCode == 200 || response.statusCode == 201) {
        setState(() {
          result = response.body;
        });
      } else {
        print('error......');
      }
    } catch (e) {
      print('error ... $e');
    }
  }

  onPressClient() async {
    var client = http.Client(); // 서버의 연결을 유지하는 클래스
    try {
      http.Response response = await client.post( // 서버로 post 요청
          Uri.parse('https://jsonplaceholder.typicode.com/posts'),
          body: {'title': 'hello', 'body': 'world', 'userId': '1'});

      if (response.statusCode == 200 || response.statusCode == 201) {
        response = await client.get(Uri.parse('https://jsonplaceholder.typicode.com/posts/1')); // 이어서 get 요청
        setState(() {
          result = response.body;
        });
      } else {
        print('error......');
      }
    } finally {
      client.close(); // 모든 작업이 끝나면 서버와의 연결을 해제
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Test', style: TextStyle(color: Colors.white)),
          backgroundColor: Colors.blue,
          centerTitle: true,
        ),

        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("$result"),
              ElevatedButton(
                child: Text('GET'),
                onPressed: onPressGet,
              ),
              ElevatedButton(
                child: Text('POST'),
                onPressed: onPressPost,
              ),
              ElevatedButton(
                child: Text('Client'),
                onPressed: onPressClient,
              )
            ],
          ),
        )
      ),
    );
  }
}