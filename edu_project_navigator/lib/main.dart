import 'package:flutter/material.dart';

// 1. Route의 개념
// 2. Navigator의 정의와 push, pop함수, stack 자료구조
// 3. MaterialPageRoute 위젯과 context
// 4. 패이지 이동 기능 구현 완성

//navigator란 모든 routes를 관리하며 stack이라는 자료구조로 route객체들을 관리한다.
//stack 자료구조이기 때문에 push, pop 메소드를 제공한다.
//push 데이터를 스택에 쌓는다.
//pop 데이터를 스택에서 꺼낸다.
void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Navigator',
      theme: ThemeData(primarySwatch: Colors.amber),
      home: FirstPage(),
    );
  } //위젯트리 구조상 모든 라우트는 반드시 머티리얼앱 아래에서
  //차일드 형태로 구현되어야 한다.
}

class FirstPage extends StatelessWidget {
  const FirstPage({super.key});

  @override
  Widget build(BuildContext context2) {
    return Scaffold(
      appBar: AppBar(
        title: Text('First Pages app bar'),
      ),
      body: Center(
        child: TextButton(
            onPressed: () {
              Navigator.push(context2, MaterialPageRoute(builder: (_) {
                return SecondPage(); //_는 사용 안하는 context대신 쓰는것. 사용 하지 않은 context는 웬만하면 _처리를 해주자.
                //필료없은 매개변수는 _처리하는 게 플러터에선 권장한다.
              }));
              //빌더는 어떤 MarialPageRoute도움을 받아서 생성되어야 할 지 정의하는 것
              //그럼 push 메소드를 부를때마다 왜 MarialPageRoute를 사용하고 이 안에서 빌더를 통해서 컨텍스트를 flutter에 의해서 할당받아야 할 까 ?
              //라우트의 이동을 자주하거나 하면 에러가 뜰 수도 있으니 각 라우트별로 context를 만들어 햇갈리지 않게 하는것. 페이지 별로 고유의 주소를 남긴다고 생각한다. 일종의 안전장치.
            }, //여기서 context가 필요한 이유? 첫 번째 페이지 위치를 알아야 그 위치 위에 쌓을 수 있으니깐.
            //MarialPageRoute라는 생성자를 이용
            child: Text('2page로 가는 버튼'),
            style: TextButton.styleFrom(
                foregroundColor: Colors.black,
                backgroundColor: Colors.amber,
                textStyle: TextStyle(fontSize: 10.0))),
      ),
    );
  }
}

//세컨드 페이지는 머테리얼 앱에 감싸져 있지않으므로
//inspector로 보면 로드가 되지않아있다.
//하지만 2페이지로 가는 버튼을 누르면 위젯트리에 추가된다.
//스택의 자료구조상 페이지를 이동하는 매커니즘은 1페이지를 제거하고 2페이지가 나오는 게 아니고
//1페이지 위에 2페이지를 쌓는다라고 생각해야된다.
class SecondPage extends StatelessWidget {
  const SecondPage({super.key});

  @override
  Widget build(BuildContext context3) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Second Pages app bar'),
      ),
      body: Center(
        child: TextButton(
          onPressed: () {
            Navigator.pop(context3);
          },
          child: const Text('1page로 가는 버튼'),
        ),
      ),
    );
  }
}
//MaterialPageRoute는 페이지를 이동할 때 기본적으로 제공되는 애니메이션이 있다.
//안드로이드는 위로 올라오는 페이드인, 나갈 땐 아래로 내려가며 페이드아웃
//ios는 좌우로 화면이 움직인다.