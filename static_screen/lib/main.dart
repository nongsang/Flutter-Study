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
        appBar: AppBar(
          title: const Text('Stateless Test'),
        ),
        body: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,

            children: [
              IconButton(onPressed: changeCheck,
                          color: Colors.red,
                          icon: enabled? Icon(Icons.check_box, size: 20) : Icon(Icons.check_box_outline_blank, size: 20)),

              Text('$strText', style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),),
            ],
          )
        )
      ),
    );
  }
}