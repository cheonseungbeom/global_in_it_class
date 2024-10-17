import 'package:flutter/material.dart';
//캐릭터의 정보를 나타내는 화면을 구성
void main() => runApp(MyApp());//가장 먼저 참조하는 함수인 main
//메인 함수는 runApp 함수를 실행을 한다.
//runApp 함수는 MyApp()클래스를 아규먼트로 받아온다.

class MyApp extends StatelessWidget {
  // 이번 페이지에는 숫자나 그림 변화가 없기 때문에 StatelessWidget으로 구현한다.

  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp( //머티어리얼앱을 쓴다는 건 플러터에서 제공해주는 것들을 사용할 수 있다는 것.
      debugShowCheckedModeBanner: false,//디버그 띠 없애기
      title: 'BBANTO',
      home: Grade(), //앱을 실행시키면 가장 먼저 뜨는 화면
      //Grade()라는 커스텀 위젯을 가져오도록 한다.
      //여기서 사용된 :(콜론)은 플러터에서 위젯과 클래스의 관계를 알아야 이해할 수 있다.
      //플러터에서 위젯과 클래스의 관계는 매우 중요하다.

    );
  }
}

class Grade extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold( //Scaffold는 뼈대가 되는 위젯
      backgroundColor: Colors.amber[800],//바디의 배경색
      appBar: AppBar(
        title: Text('BBANTO'), //앱바의 타이틀
        backgroundColor: Colors.amber[700],//앱바의 배경색
        centerTitle: true, //앱바의 타이틀을 중간으로 boolean 타입
        elevation: 0.0,//앱바의 음영제거
      ),
      body: Padding(//바디에 적당한 위치에 이미지를 넣기위해 패딩을 준다.
        padding: EdgeInsets.fromLTRB(30.0, 40.0, 0.0, 0.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,          
          children: <Widget> [
            Center(
              child: CircleAvatar( //아바타 이미지 위젯
                backgroundImage: AssetImage('assets/icon.png'),
                radius: 60.0, //원 크기
                backgroundColor: Colors.black,//아바타 이미지 배경색
              ),
            ),
            Divider( //구분선 위젯이다.
              height: 60.0,//디바이더를 중심으로 아래위 합친 높이가 60이란 얘기
              color: Colors.grey[850],//디바이더의 색
              thickness: 0.5,//디바이더의 굵기
              endIndent: 30.0,//화면과 디바이더 끝 간의 인덴트
            ),
            Text('NAME',//Text 위젯을 불러온다
            style: TextStyle(//컨트롤 누르면 어떤 스타일 쓸 수 있을 지 보임.
              color: Colors.white, //글자 색상
              letterSpacing: 2.0, //글자들 간의 간격
              ),
            ),
            SizedBox(//아래 위 텍스트 간에 투명 박스를 넣어 간격을 띄운다.
              height: 10.0,
            ),
            Text('BBANTO', //두 번째 Text 위젯을 불러온다
            style: TextStyle( 
              color: Colors.white,//글자색상
              letterSpacing: 2.0,//글자간 간격
              fontSize: 28.0, //폰트사이즈
              fontWeight: FontWeight.bold//글자를 볼드체로 변경
            ),
            ),
            SizedBox(
              height: 50.0,
            ),
            Text('BBAMTO POWER LEVEL',//세 번째 Text 위젯을 불러온다
            style: TextStyle(//컨트롤 누르면 어떤 스타일 쓸 수 있을 지 보임.
              color: Colors.white, //글자 색상
              letterSpacing: 2.0, //글자들 간의 간격
              ),
            ),
            SizedBox(//아래 위 텍스트 간에 투명 박스를 넣어 간격을 띄운다.
              height: 10.0,
            ),
            Text('14', //네 번째 Text 위젯을 불러온다
            style: TextStyle( 
              color: Colors.white,//글자색상
              letterSpacing: 2.0,//글자간 간격
              fontSize: 28.0, //폰트사이즈
              fontWeight: FontWeight.bold//글자를 볼드체로 변경
            ),
            ),
            SizedBox(//간격을 위해 투명박스
              height: 30.0,
            ),
            Row(
              children: <Widget>[
                Icon(Icons.check_circle_outline),//'.'(쩜)은 위젯이 가지고있는 여러 기능을 사용할 때 쓴다.
                SizedBox(  //아이콘과 텍스트 간의 간격을 위해 투명박스 넣기
                  width: 10.0,
                ),
                Text('using lightsaver', 
                style: TextStyle(
                  fontSize: 16.0,
                  letterSpacing: 1.0
                ),
                ),
              ], //Row의 children
            ),
            Row(
              children: <Widget>[
                Icon(Icons.check_circle_outline),//'.'(쩜)은 위젯이 가지고있는 여러 기능을 사용할 때 쓴다.
                SizedBox(  //아이콘과 텍스트 간의 간격을 위해 투명박스 넣기
                  width: 10.0,
                ),
                Text('face hero tattoo', 
                style: TextStyle(
                  fontSize: 16.0,
                  letterSpacing: 1.0
                ),
                ),
              ], //Row의 children
            ),
            Row(
              children: <Widget>[
                Icon(Icons.check_circle_outline),//'.'(쩜)은 위젯이 가지고있는 여러 기능을 사용할 때 쓴다.
                SizedBox(  //아이콘과 텍스트 간의 간격을 위해 투명박스 넣기
                  width: 10.0,
                ),
                Text('fire flame', 
                style: TextStyle(
                  fontSize: 16.0,
                  letterSpacing: 1.0
                ),
                ),
              ], //Row의 children
            ),
            Center(
              child: CircleAvatar(
                
                backgroundImage: AssetImage('assets/pic.png'),
                radius: 70.0,
                backgroundColor: Colors.black,

              ),
            )
          ], //Column의 children
        ),
      ),
    );
  }
}
