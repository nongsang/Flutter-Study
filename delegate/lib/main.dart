// 안드로이드 앱, iOS 앱이 아니라 웹 앱을 구현해야 할 때 uri 등의 정보를 받아 처리하는 코드다.

import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => MyAppState();
}

class MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(  // 앱이 시작될 때 경로를 받아 화면을 출력하는 방식을 사용
      routeInformationParser: MyRouteInformationParser(), // 경로를 받아 라우트 경로를 반환하는 처리기
      routerDelegate: MyRouterDelegate(), // 라우트 경로를 분석해서 라우팅하는 내비게이터
    );
  }
}

class MyRoutePath { // 경로를 저장하는 개발자 클래스
  String? id;

  MyRoutePath.home() : this.id = null;
  MyRoutePath.detail(this.id);
}

class MyRouteInformationParser extends RouteInformationParser<MyRoutePath> {  // 경로를 받아 라우트 경로를 반환하는 처리기
  @override
  Future<MyRoutePath> parseRouteInformation(RouteInformation routeInformation) async {
    final uri = Uri.parse(routeInformation.location ?? '/');
    print('routeInformation.location : ${routeInformation.location}');
    if (uri.pathSegments.length >= 2) {
      var remaining = uri.pathSegments[1];
      return MyRoutePath.detail(remaining);
    } else {
      return MyRoutePath.home();
    }
  }

  @override
  RouteInformation restoreRouteInformation(MyRoutePath configuration) {
    print('restoreRouteInformation id : ${configuration.id}');

    if (configuration.id != null)
      return RouteInformation(location: '/detail/${configuration.id}');
    else
      return RouteInformation(location: '/');
  }
}

class MyRouterDelegate extends RouterDelegate<MyRoutePath>
    with ChangeNotifier, PopNavigatorRouterDelegateMixin<MyRoutePath> { // 라우트 경로를 분석해서 라우팅하는 내비게이터
  String? selectId;
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  @override
  MyRoutePath get currentConfiguration {
    if (selectId != null) {
      return MyRoutePath.detail(selectId);
    } else {
      return MyRoutePath.home();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: navigatorKey,
      pages: [
        MaterialPage(child: HomeScreen(_handleOnPressed)),  // 첫 화면은 HomeScreen()으로 출력
        if (selectId != null) MaterialPage(child: DetailScreen(selectId))
      ],
      onPopPage: (route, result) {
        if (!route.didPop(result)) {
          return false;
        }
        selectId = null;
        notifyListeners();
        return true;
      },
    );
  }

  @override
  Future<void> setNewRoutePath(MyRoutePath configuration) async {
    if (configuration.id != null) {
      selectId = configuration.id;
    }
  }

  void _handleOnPressed(String id) {  // 
    selectId = id;
    notifyListeners();
  }
}

class HomeScreen extends StatelessWidget {
  final ValueChanged<String> onPressed;

  HomeScreen(this.onPressed);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        color: Colors.red,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Home Screen',
                style: TextStyle(color: Colors.white, fontSize: 30),
              ),
              ElevatedButton(
                child: Text('go detail with 1'),
                onPressed: () => onPressed('1'),
              ),
              ElevatedButton(
                child: Text('go detail with 2'),
                onPressed: () => onPressed('2'),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class DetailScreen extends StatelessWidget {
  String? id;

  DetailScreen(this.id);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        color: Colors.green,
        child: Center(
          child: Text(
            'Detail Screen $id',
            style: TextStyle(color: Colors.white, fontSize: 30),
          ),
        ),
      ),
    );
  }
}
