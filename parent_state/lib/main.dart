import 'package:flutter/material.dart';

void main() {
  runApp(const ParentWidget());
}

class ParentWidget extends StatefulWidget {
  const ParentWidget({super.key});

  @override
  State<StatefulWidget> createState() {
    return ParentWidgetState();
  }
}

// 상위 위젯에서 하위 위젯의 상태를 전부 관리한다.
// 하위 위젯에서 이벤트가 발생하면 상위로 알려주고, 상위 위젯은 다른 위젯으로 변화를 알려준다.
// 상위 위젯이 네트워크 데이터를 받아 하위 위젯들을 전부 업데이트 하는 방식으로 사용할 수 있다.
// 이런 구조를 옵저버 패턴이라고 한다.
class ParentWidgetState extends State<ParentWidget> {
  bool favorited = false;
  int favoriteCount = 10;

  void toggleFavorite() { // 하위 위젯에서 실행할 경우 상태를 재설정 및 위젯 새로고침
    setState(() {
      if (favorited) {
        favoriteCount -= 1;
        favorited = false;
      } else {
        favoriteCount += 1;
        favorited = true;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('test', style: TextStyle(color: Colors.white)),
          backgroundColor: Colors.blue,
          centerTitle: true,
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconWidget(favorited: favorited, onChanged: toggleFavorite),
            ContentWidget(favoriteCount: favoriteCount)
          ],
        ),
      ),
    );
  }
}

class IconWidget extends StatelessWidget {
  final bool favorited;
  final Function onChanged;

  IconWidget({this.favorited = false, required this.onChanged});

  void _handleTap() {
    onChanged();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: IconButton(
        icon: (favorited ? Icon(Icons.favorite) : Icon(Icons.favorite_border)),
        iconSize: 200,
        color: Colors.red,
        onPressed: _handleTap,  // 버튼을 눌렀을 때 상위 위젯에서 전달한 이벤트를 실행
      ),
    );
  }
}

class ContentWidget extends StatelessWidget {
  final int favoriteCount;

  ContentWidget({required this.favoriteCount});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          child: Text(
            'favoriteCount : $favoriteCount',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
        )
      ],
    );
  }
}