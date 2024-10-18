import 'package:flutter/material.dart';
import 'dice.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Dice game',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: LogIn(),
    );
  }
}

//로그인 화면에는 자판을 치면 문자가 입력되어 실시간으로 화면이 변경되기 때문에 스테이트풀로 작성해야한다.
class LogIn extends StatefulWidget {
  const LogIn({super.key});
  @override
  State<LogIn> createState() => _LogInState();
}

//텍스트필드에서 받은 값을 저장하려면 필요한 인스턴스
TextEditingController controller = TextEditingController();
TextEditingController controller2 = TextEditingController();

class _LogInState extends State<LogIn> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Log in'),
        backgroundColor: Colors.redAccent,
        centerTitle: true,
        leading: IconButton(icon: Icon(Icons.menu), onPressed: () {}),
        //앱바 왼쪽 끝을 나타내는 leading
      ),
      body: Builder(
        builder: (context) {
          return GestureDetector(
            //사용자의 제스쳐를 감지한다. 두번탭, 롱탭, 드래그 등등을 감지한다. 여기선 화면 전체로 감싸주면서 탭을 감지하여 자판을 밑으로 내리기 위해 선언했다.
            onTap: () {
              FocusScope.of(context).unfocus();
            },
            child: SingleChildScrollView(
              //인풋필드에 클릭시 키보드가 올라오면서 화면이 짤리는 경우가 생기는데, 이때 이걸로 처리하면 화면이 스크롤이 가능해서 짤려도 유연하게 대처가능하다.
              child: Column(
                children: [
                  Padding(padding: EdgeInsets.only(top: 50)),
                  Center(
                    child: Image(
                      image: AssetImage('image/chef.gif'),
                      width: 170.0,
                      height: 190.0,
                    ),
                  ),
                  Form(
                      //폼 위젯을 통해 자식 위젯들 전부 특성설정이 가능하다.
                      child: Theme(
                          data: ThemeData(
                              primaryColor: Colors.teal,
                              inputDecorationTheme: InputDecorationTheme(
                                  labelStyle: TextStyle(
                                      color: Colors.teal, fontSize: 15.0))),
                          child: Container(
                            padding: EdgeInsets.all(40.0),
                            child: Column(
                              children: [
                                TextField(
                                  //autofocus: true, 텍스트 필드에 입력을 용이하게 하는 것을 focus라고 한다. 오토포커스를 켜면 클릭을 하지않아도 입력이 가능한 상태가 된다.
                                  //FocusNode:포커스를 받는 특정 위젯을 식별
                                  //FocusScope:어떤 위젯들까지 포커스를 받을 수 있는 지 나타낸다.
                                  controller:
                                      controller, //이것만 넣으면 텍스트를 받아 올 수 있다.
                                  decoration: InputDecoration(
                                      labelText: 'Enter "dice"'),
                                  keyboardType: TextInputType.emailAddress,
                                ),
                                TextField(
                                  controller: controller2,
                                  decoration: InputDecoration(
                                      labelText: 'Enter password'),
                                  keyboardType: TextInputType.text,
                                  obscureText: true, //비번칠때 *자로 숨겨주는기능
                                ),
                                SizedBox(
                                  height: 40.0,
                                ),
                                ButtonTheme(
                                    minWidth: 100.0,
                                    height: 50.0,
                                    child: ElevatedButton(
                                      style: ButtonStyle(
                                          backgroundColor:
                                              MaterialStatePropertyAll(
                                                  Colors.orangeAccent)),
                                      onPressed: () {
                                        if (controller.text == 'dice' &&
                                            controller2.text == '1234') {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder:
                                                      (BuildContext context) =>
                                                          Dice()));
                                        } else if (controller.text == 'dice' &&
                                            controller2.text != '1234') {
                                          showSnackBar2(context);
                                        } else if (controller.text != 'dice' &&
                                            controller2.text == '1234') {
                                          showSnackBar3(context);
                                        } else {
                                          showSnackBar(context);
                                        }
                                      },
                                      child: Icon(Icons.arrow_forward),
                                    )),
                              ],
                            ),
                          )))
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

class Dice {}

void showSnackBar(BuildContext context) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    content: Text(
      '로그인 정보를 다시 확인하세요.',
      textAlign: TextAlign.center,
    ),
    duration: Duration(seconds: 2),
    backgroundColor: Colors.blue,
  ));
}

void showSnackBar2(BuildContext context) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    content: Text(
      '비밀번호가 일치하지 않습니다..',
      textAlign: TextAlign.center,
    ),
    duration: Duration(seconds: 2),
    backgroundColor: Colors.blue,
  ));
}

void showSnackBar3(BuildContext context) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    content: Text(
      '다이스의 철자를 확인하세요.',
      textAlign: TextAlign.center,
    ),
    duration: Duration(seconds: 2),
    backgroundColor: Colors.blue,
  ));
}
