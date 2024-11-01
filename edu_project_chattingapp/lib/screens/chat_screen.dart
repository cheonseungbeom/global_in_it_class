import 'package:edu_project_chattingapp/chatting/chat/message.dart';
import 'package:edu_project_chattingapp/chatting/chat/new_message.dart';
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
                  // Navigator.pop(context); //로그아웃은 팝 메소드로 구현
                },
                icon: const Icon(
                  Icons.exit_to_app_sharp,
                  color: Colors.white,
                ))
          ],
        ),
        body: Container(
          child: Column(
            children: const [
              Expanded(child: Messages()),
              NewMessage(),
            ],
          ),
        )
        // StreamBuilder(
        //   //스냅샷 메소드는 스트림을 반환한다. 따라서 데이터가 바뀔 때마다 새로운 밸류값을 반환해준다.
        //   builder: (BuildContext context,
        //       AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot) {
        //     if (snapshot.connectionState == ConnectionState.waiting) {
        //       return const Center(
        //         child: CircularProgressIndicator(),
        //       );
        //     } //로딩 창 구현
        //     final docs = snapshot.data!.docs;
        //     return ListView.builder(
        //       itemBuilder: (context, index) {
        //         return Container(
        //           padding: const EdgeInsets.all(8.0),
        //           child: Text(
        //             docs[index]['text'],
        //             style: const TextStyle(fontSize: 20.0),
        //           ),
        //         );
        //       },
        //       itemCount: docs.length,
        //     );
        //   },
        //   stream: FirebaseFirestore.instance
        //       .collection('/chats/TCMWmL83O6PA3cA8NrJs/message')
        //       .snapshots(),
        // )
        );
  }
}
