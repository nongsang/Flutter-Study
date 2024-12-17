import 'package:flutter/material.dart';
import 'package:flutter/services.dart'; // rootBundle을 사용하기 위해 포함

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // rootBundle을 사용한 텍스트 파일 읽어오기
  // 비동기로 읽어온다.
  Future<String> useRootBundle() async {
    return await rootBundle.loadString('assets/text/my_text.txt');
  }

  // DefaultAssetBundle을 사용한 텍스트 파일 읽어오기
  // 비동기로 읽어온다.
  Future<String> useDefaultAssetBundle(BuildContext context) async {
    return await DefaultAssetBundle.of(context).loadString('assets/text/my_text.txt');
  }

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
            Image.asset('images/icon.jpg'),
            Image.asset('images/icon/user.png'),
            // 비동기로 로드한 에셋을 빌드
            FutureBuilder(
                future: useRootBundle(),  // rootBundle을 사용하여 에셋 로드
                builder: (context, snapshot) {
                  return Text('rootBundle: ${snapshot.data}'); // 에셋을 로드한 결과물을 snapshot에 전달하여 사용
                }
            ),
            // 비동기로 로드한 에셋을 빌드
            FutureBuilder(
                future: useDefaultAssetBundle(context), // DefaultAssetBundle을 사용하여 에셋 로드
                builder: (context, snapshot) {
                  return Text('DefaultAssetBundle: ${snapshot.data}');  // 에셋을 로드한 결과물을 snapshot에 전달하여 사용
                },
            ),
          ],
        )
      ),
    );
  }
}
