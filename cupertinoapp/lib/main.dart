import 'package:flutter/cupertino.dart';  // 애플의 디자인 지침인 쿠퍼티노 디자인을 사용하기 위한 패키지

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return CupertinoApp(  // 쿠퍼티노 스타일을 사용
      debugShowCheckedModeBanner: false,
        theme: CupertinoThemeData(brightness: Brightness.dark), // 색 설정, 기본 설정은 light
        home: CupertinoPageScaffold(  // 쿠퍼티노 스타일 스캐폴드
        navigationBar: CupertinoNavigationBar(  // 쿠퍼티노에서 사용하는 앱바
          middle: Text('Test'),
        ),
        child: ListView(
          children: [
            CupertinoButton(
                child: Text('click'),
                onPressed: (){}
            ),
            Center(
              child: Text('Hello world!'),
            ),
          ],
        )
      )
    );
  }
}