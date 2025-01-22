import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class User {
  String name;
  String phone;
  String email;
  User(this.name, this.phone, this.email);
}

class MyApp extends StatelessWidget {

  List<User> users = [
    User('신창섭', '0100001', 'a@a.com'), User('전재학', '0100002', 'b@a.com'),
    User('빛강선', '0200001', 'a@b.com'), User('강원기', '0200002', 'b@b.com'),
    User('조재윤', '0300001', 'a@c.com'), User('주호민', '0300002', 'b@c.com'),
    User('이말년', '0400001', 'a@d.com'), User('레바', '0400002', 'b@d.com'),
  ];

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Test', style: TextStyle(color: Colors.white)),
          backgroundColor: Colors.blue,
          centerTitle: true,
        ),

        body: ListView.separated(
          itemCount: users.length,
          separatorBuilder: (context, index) {
            return const Divider(height: 2, color: Colors.black);
          },
          itemBuilder: (context, index) {
            return ListTile(  // flutter에서 제공하는 항목 템플릿
              leading: const CircleAvatar(  // Container Decoration으로 구현하던 썸네일 마스크
                radius: 25,
                backgroundImage: AssetImage('images/big.jpeg'),
              ),
              title: Text(users[index].name), // 제목
              subtitle: Text(users[index].phone), // 부제
              trailing: const Icon(Icons.more_vert),  // 최후미에 출력되는 아이콘
              onTap: () { // 클릭시 호출할 이벤트
                return print(users[index].name);
              },
            );
          },
        )
      ),
    );
  }
}
