//스트림빌더 위젯을 한 번 사용해보는 프로젝트
//언제라도 데이터가 도착할 수 있는 곳에선 스트림을 사용해야 한다.
import 'package:edu_project_stream/counter.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Stream builder',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const Counter(),
    );
  }
}
