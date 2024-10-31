import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final _authentication = FirebaseAuth.instance;
  User? loggedUser; //초기화 되지 않을 값이므로 널값 가질 수 있게 물음표

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getCurrentUser();
  }

  void getCurrentUser() {
    final user = _authentication.currentUser;

    try {
      if (user != null) {
        loggedUser = user;
        print(loggedUser!.email);
      }
    } catch (e) {
      print(e);
    }
  } //새로운 유저의 등록이 성공되면 그 유저는 커런트 유저로서 _authentication에 잘 등록이 되었을 것이다.
  //그래서 우리는 final user 라는 변수를 생성해서 _authentication 객체에 커런트 유저의 값을 전달해 줄 수 있을 것이다.
  //그 다음 등록된 유저를 관리해 주는 User타입의 변수를 생성해서 user의 값을 전달해 주면
  //우리가 원하는 user의 정보를 확인해 볼 수 있을 것
  //이를 위해 loggedUser 변수를 생성

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Chat screen'),
        actions: [
          IconButton(
              onPressed: () {
                _authentication.signOut(); //로그아웃 구현
                Navigator.pop(context); //로그아웃은 팝 메소드로 구현
              },
              icon: const Icon(
                Icons.exit_to_app_sharp,
                color: Colors.white,
              ))
        ],
      ),
      body: const Center(
        child: Text('Chat screen'),
      ),
    );
  }
}
