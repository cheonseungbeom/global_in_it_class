import 'package:flutter/material.dart';

//코드 상으론 문제가 없지만 실행시켜보면 오류가 뜬다. 무엇이 잘못된 걸까?
//이는 30번째 줄에 있는 push함수의 context가 MyApp의 context라서 그렇다.
//모든 위젯은 머테리얼 앱의 차일드여야 한다. 그런데 MyApp의 context를 써서 push를 하면 MyApp 위에 쌓는 것이라
//머테리얼 앱에 포함되지가 않게된다.
//이를 위한 해결방법은 두 가지이다. 첫 번째는 머테리얼앱 밑에 빌더를 통해 머테리얼앱을 위치정보 context를 만들어 이를 push함수가 참조하게하거나
//두 번째는 머테리얼 앱의 차일드위젯의 context 를 push함수가 참조하게 하는 것이다.
//두 가지 다 머테리얼앱의 context를 push함수가 이용하게 하면 되는 것이다.
//이 코드에선 빌더를 활용해서 문제를 해결하였다.
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: Builder(builder: (context) {
          return Center(
              child: TextButton(
            style: TextButton.styleFrom(backgroundColor: Colors.white),
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (_) {
                return ScreenA();
              }));
            },
            child: Text('hi'),
          ));
        }));
  }
}

class ScreenA extends StatelessWidget {
  const ScreenA({super.key});

  @override
  Widget build(BuildContext context2) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [Text('HIHIHI')],
        ),
      ),
    );
  }
}
