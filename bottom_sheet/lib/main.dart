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

        body: TestScreen(),
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
  _bottomSheet() {
    showModalBottomSheet( // 바텀 시트 출력
        context: context,
        backgroundColor: Colors.yellow,
        builder: (BuildContext context) {
          return SafeArea(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                ListTile(
                  leading: Icon(Icons.add),
                  title: Text('ADD'),
                  onTap: () {
                    Navigator.of(context).pop();  // 항목 선택하면 바텀시트 끄기
                  },
                ),
                ListTile(
                  leading: Icon(Icons.remove),
                  title: Text('REMOVE'),
                  onTap: () {
                    Navigator.of(context).pop();  // 항목 선택하면 바텀시트 끄기
                  },
                )
              ],
            )
          );
        }
    );
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
          onPressed: _bottomSheet,
          child: Text('bottom sheet')
      ),
    );
  }
}