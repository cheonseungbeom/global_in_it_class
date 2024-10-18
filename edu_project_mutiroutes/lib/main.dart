import 'package:flutter/material.dart';
import 'package:edu_project_mutiroutes/ScreenA.dart';
import 'ScreenB.dart';
import 'ScreenC.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute:
          '/', //home 대신 initialRoute를 썼다. 멀티라우트를 구현할 땐 이걸로 대신 사용한다. 아규먼트는 자료구조 Map 형태로 전달 받으며 key : value / 이고 key엔 string, value엔 라우트 / string 엔 페이지 이름,
      routes: {
        '/': (context) => ScreenA(), // /뒤에 내가 원하는 이름 키값을 정한다. 첫페이지는 그냥 /
        '/b': (context) =>
            ScreenB(), // key 값이 '/' 가 불려지면 value 값인 ScreenA()가 불려진다는 뜻이다.
        '/c': (context) => ScreenC()
      },
    );
  }
}
