import 'package:flutter/material.dart';
import 'one_screen.dart';
import 'two_screen.dart';
import 'three_screen.dart';
import 'four_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/one', // 앱이 시작되었을 때 처음으로 보여줄 화면
      routes: { // 앱의 화면을 등록하는 기능
        '/one': (context) => OneScreen(),
        '/two': (context) => TwoScreen(),
        // '/three': (context) => ThreeScreen(),
        // '/four': (context) => FourScreen(),
      },
      onGenerateRoute: (settings) { // 동적 라우트 등록
        if (settings.name == '/three') {
          return MaterialPageRoute(
            builder: (context) => ThreeScreen(),
            settings: settings,
          );
        }
        else if (settings.name == '/four') {
          return MaterialPageRoute(
            builder: (context) => FourScreen(),
            settings: settings,
          );
        }
        return null;
      },
    );
  }
}