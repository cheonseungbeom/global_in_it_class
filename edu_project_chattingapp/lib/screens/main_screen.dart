import 'package:flutter/material.dart';
import 'package:edu_project_chattingapp/config/palette.dart';

class LoginSignupScreen extends StatefulWidget {
  const LoginSignupScreen({super.key});

  @override
  State<LoginSignupScreen> createState() => _LoginSignupScreenState();
}

class _LoginSignupScreenState extends State<LoginSignupScreen> {
  bool isSignupScreen = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Palette.backgroundColor,
        body: Stack(
          //stack 위젯을 사용하면 위젯을 원하는 위치에 둘 수가 있다.
          children: [Positioned(child: child)],
        ));
  }
}
