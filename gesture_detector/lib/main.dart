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
            backgroundColor: Colors.blue,
            title: Center(
              child: Text(
                'Text',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
          body: Column(
            children: [
              GestureDetector( // 제스처를 감지하는 이미지 생성
                child: Image.asset('images/icon/user.png'),
                onTap: () { // 클릭하면 실행할 이벤트
                  print('Image Clicked!');
                },
                onVerticalDragStart: (DragStartDetails details) { // 수평 드래그가 발생하면 실행할 이벤트
                  print("vertical drag start! global Position: ${details.globalPosition.dx}, ${details.globalPosition.dy}");
                  print("vertical drag start! local Position: ${details.localPosition.dx}, ${details.localPosition.dy}");
                },
              ),
              ElevatedButton(onPressed: () { // Elevated 버튼 생성
                print('Elevated Button Clicked!');
              },
                child: Text('Click Me!', style: TextStyle(color: Colors.white),),
                style: ButtonStyle(
                  backgroundColor: WidgetStateProperty.all<Color>(Colors.red), // 버튼 배경색을 빨간색으로 설정
                ),
              )
            ],
          )
      ),
    );
  }
}
