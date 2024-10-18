import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Appbar',
      theme: ThemeData(primarySwatch: Colors.red),
      home: MyPage(),
    );
  }
}

class MyPage extends StatelessWidget {
  const MyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Appbar icon menu'),
        centerTitle: true,
        elevation: 0.0,
        // leading: IconButton(//리딩:간단한 위젯이나 아이콘을 왼쪽에 위치시키는것, listtile에서도 쓰인다.
        //   icon: Icon(Icons.menu),
        //   onPressed: () {//버튼을 누르면 이벤트 발생
        //       print('menu botton is clicked');
        //     },
        //   ),
        actions: <Widget>[
          //액션즈:복수의 아이콘 버튼 등을 오른쪽에 배치할 때
          IconButton(
            icon: Icon(Icons.shopping_cart),
            onPressed: () {
              print('Shopping cart botton is clicked');
            },
          ),
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              print('Search botton is clicked');
            },
          )
        ],
      ),
      body: Center(
        child: TextButton(
          child: Text(
            'Show me',
            style: TextStyle(color: Colors.white),
          ),
          style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Colors.red)),
          onPressed: () {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Text('Hellow'), //밑에 팝업 형식으로 뜨는 메세지가 스낵바이다.
            ));
          },
        ),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            UserAccountsDrawerHeader(
              currentAccountPicture: CircleAvatar(
                backgroundImage: AssetImage('assets/kuromi.png'),
                backgroundColor: Colors.white,
              ),
              otherAccountsPictures: <Widget>[
                CircleAvatar(
                  backgroundColor: Colors.white,
                  backgroundImage: AssetImage('assets/miffy.png'),
                )
              ],
              accountName: Text('KUROMI'),
              accountEmail: Text('kuromi@gmail.com'),
              onDetailsPressed: () {
                print('arrow is clicked');
              },
              decoration: BoxDecoration(
                  color: Colors.red[200],
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(40.0),
                      bottomRight: Radius.circular(40.0))),
            ),
            ListTile(
              leading: Icon(Icons.home),
              title: Text('home'),
              iconColor: Colors.grey[800],
              onTap: () {
                print('Home is tapped');
              },
              trailing: Icon(Icons.add),
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text('settings'),
              iconColor: Colors.grey[800],
              onTap: () {
                print('setting is tapped');
              },
              trailing: Icon(Icons.add),
            ),
            ListTile(
              leading: Icon(Icons.question_answer),
              title: Text('Q&A'),
              iconColor: Colors.grey[800],
              onTap: () {
                print('Q&A is tapped');
              },
              trailing: Icon(Icons.add),
            )
          ],
        ), //세로 방향으로 여러 줄로 되는 것을 나열, 컬럼이나 로우 위젯처럼 복수의 위젯을 나열하는 위젯 리스트가 칠드런 속성을 통해서 호출될 것. 리스트의 한줄한줄을 플러터에선 ListTile이라고 한다.
        //listtile안엔 여러가지 것들이 들어가는데, 타이틀, 서브타이틀, 버튼, 아이콘 etc. 이것들을 마진이나 패딩을 주지않아도 보기 좋게 배치한다.
      ),
    );
  }
}
