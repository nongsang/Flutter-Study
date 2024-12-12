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
    // 유니크키 할당
    MyColorItemWidget(Colors.red, key:UniqueKey()),
    MyColorItemWidget(Colors.blue, key:UniqueKey()),
  ];

  onChange() {
    setState(() {
      print(widgetList.elementAt(0).key);
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

class MyColorItemWidget extends StatefulWidget {
  Color color;
  // 생성할 때 키를 등록
  MyColorItemWidget(this.color, {Key? key}):super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _MyColorItemWidget(color);
  }
}

class _MyColorItemWidget extends State<MyColorItemWidget> {
  Color color;
  _MyColorItemWidget(this.color);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        color: color,
        width: 150,
        height: 150,
      ),
    );
  }
}