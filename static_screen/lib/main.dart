import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  bool enabled = false;
  String strText = "disabled";

  void changeCheck()
  {
    enabled = !enabled;

    strText = enabled? 'enabled' : 'disabled';
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        // 앱바
        appBar: AppBar(
          title: const Center(
            child: Text(
              'Stateless Test',
              style: TextStyle(color: Colors.white)
            ),
          ),
          backgroundColor: Colors.blue,
        ),
        
        // 토글 버튼
        body: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,

            children: [
              IconButton(onPressed: changeCheck,
                          color: Colors.red,
                          icon: enabled
                              ? const Icon(Icons.check_box, size: 20) :
                                const Icon(Icons.check_box_outline_blank, size: 20)),

              Text(strText, style: const TextStyle(fontSize: 30, fontWeight: FontWeight.bold),),
            ],
          )
        )
      ),
    );
  }
}