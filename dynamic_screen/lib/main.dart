import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home:MyListWidget()
    );
  }
}

// 버튼이 눌릴 때 마다 새롭게 다시 화면에 그려줘야 하므로 Stateful 위젯으로 구성
class MyListWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyListWidgetState();
  }
}

class _MyListWidgetState extends State<MyListWidget> {
  List<Widget> widgetList = [
    MyRedItemWidget(),
    MyBlueItemWidget(),
  ];

  onChange() {
    setState(() {
      widgetList.insert(1, widgetList.removeAt(0));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue,
          title: Center(
            child: Text('Key Test', style: TextStyle(color: Colors.white),),
          ),
        ),
        body: Column(
          children: [
            Row(children: widgetList,),
            ElevatedButton(onPressed: onChange, child: Text('toggle')),
          ],
        )
    );
  }
}

// 상태가 있는 빨간색 위젯
class MyRedItemWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyRedItemWidget();
  }
}

class _MyRedItemWidget extends State<MyRedItemWidget> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        color: Colors.red,
        width: 150,
        height: 150,
      ),
    );
  }
}

// 상태가 있는 파란색 위젯
class MyBlueItemWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyBlueItemWidget();
  }
}

class _MyBlueItemWidget extends State<MyBlueItemWidget> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        color: Colors.blue,
        width: 150,
        height: 150,
      ),
    );
  }
}