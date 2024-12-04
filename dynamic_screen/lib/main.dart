import 'package:flutter/material.dart';

void main() {
  runApp(MyWidget());
}

// 상태를 가지는 위젯 클래스
class MyWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyWidgetState();
  }
}

// 위젯의 상태를 관리하는 클래스
class _MyWidgetState extends State<MyWidget> {
  bool isEnabled = false;
  String strText = "disabled";

  // 버튼이 눌릴 때 마다 호출될 콜백함수
  void changeCheck()
  {
    // 상태의 변화를 설정해야 한다.
    setState(() {
      isEnabled = !isEnabled;

      strText = isEnabled ? 'enabled' : 'disabled';
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Center(
            child: Text(
                'Stateless Test',
                style: TextStyle(color: Colors.white)
            ),
          ),
          backgroundColor: Colors.blue,
        ),

        body: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,

            children: [
              IconButton(onPressed: changeCheck,
                  color: Colors.red,
                  icon: isEnabled
                      ? const Icon(Icons.check_box, size: 20)
                      : const Icon(Icons.check_box_outline_blank, size: 20),
              ),

              Text(strText, style: const TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
            ],
          ),
        ),
      ),
    );
  }
}