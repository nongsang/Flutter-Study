import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  Widget PlatformUI() {
    if (Platform.isIOS) { // iOS 플랫폼인지 검사
      return CupertinoApp(
        debugShowCheckedModeBanner: false,
        theme: CupertinoThemeData(brightness: Brightness.light),
        home: CupertinoPageScaffold(
          navigationBar: CupertinoNavigationBar(middle: Text('Cupertino Title')),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CupertinoButton(
                  child: Text('click'),
                  onPressed: () {},
                ),
                Text('Hello world'),
              ],
            ),
          ),
        )
      );
    }
    else if (Platform.isAndroid) {  // 안드로이드 플랫폼인지 검사
      return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          appBar: AppBar(
            title: Text('Material Title'),
            backgroundColor: Colors.blue,
            centerTitle: true,
          ),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  child: Text('click'),
                  onPressed: () {},
                ),
                Text('Hello world'),
              ],
            ),
          )
        ),
      );
    }
    else {
      return Text(
        'Unknown Device',
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
      );
    }
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return PlatformUI();
  }
}