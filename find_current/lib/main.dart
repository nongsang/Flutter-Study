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

class ParentWidgetState extends State<ParentWidget> {
  bool favorited = false;
  int favoriteCount = 10;

  GlobalKey<ChildWidgetState> childKey = GlobalKey(); // 1. 부모 위젯 상태에서 자식 위젯 상태의 키를 생성
  int childCount = 0;

  void toggleFavorite() {
    setState(() {
      if (favorited) {
        --favoriteCount;
        favorited = false;
      } else {
        ++favoriteCount;
        favorited = true;
      }
    });
  }

  void getChildData() {
    ChildWidgetState? childState = childKey.currentState; // 3. 자식 위젯의 현재 상태를 알 수 있다.
    setState(() {
      childCount = childState?.childCount ?? 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Test', style: TextStyle(color: Colors.white)),
          backgroundColor: Colors.blue,
          centerTitle: true,
        ),

      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                child: Text('I am Parent, child count : $childCount'),
              ),
              ElevatedButton(
                child: Text('get child data'),
                onPressed: getChildData,
              )
            ],
          ),
          ChildWidget(key: childKey), // 2. 부모 위젯에서 자식 위젯을 생성하면서 생성했던 키를 할당해준다.
                                      // 이제 부모 위젯에서 자식 위젯이 누구인지 알 수 있다.
          IconWidget(),
          ContentWidget(),
        ],
      ),
      ),
    );
  }
}

class ChildWidget extends StatefulWidget {
  ChildWidget({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return ChildWidgetState();
  }
}

class ChildWidgetState extends State<ChildWidget> {
  int childCount = 0;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          child: Text('I am Child, $childCount'),
        ),
        ElevatedButton(
          child: Text('increment'),
          onPressed: () {
            setState(() {
              ++childCount;
            });
          },
        )
      ],
    );
  }
}

class IconWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ParentWidgetState? state = context.findAncestorStateOfType<ParentWidgetState>();
    return Center(
      child: IconButton(
        icon: ((state?.favorited ?? false)
          ? Icon(Icons.favorite)
          : Icon(Icons.favorite_border)),
        color: Colors.red,
        iconSize: 200,
        onPressed: state?.toggleFavorite,
      ),
    );
  }
}

class ContentWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ParentWidgetState? state
      = context.findAncestorStateOfType<ParentWidgetState>();  // 자식 위젯에서 부모 위젯을 찾는 방법

    return Center(
      child: Text(
          'favoriteCount : ${state?.favoriteCount}',
        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
      ),
    );
  }

}