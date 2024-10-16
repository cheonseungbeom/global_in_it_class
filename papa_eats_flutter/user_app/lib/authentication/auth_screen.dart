import 'dart:math';

import 'package:flutter/material.dart';
import 'package:user_app/authentication/login.dart';
import 'package:user_app/authentication/register.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          flexibleSpace: Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [Color.fromARGB(255, 145, 116, 113), Color.fromARGB(255, 87, 58, 58)],
                begin: FractionalOffset(0.0, 0.0),
                end: FractionalOffset(1.0, 0.0),
                stops: [0.0, 1.0],
                tileMode: TileMode.clamp,
              ),
            ),
          ),
          automaticallyImplyLeading:
              false, //removes the default back arrow button from screen
          title: const Text(
            'PAPA-Eats',
            style: TextStyle(
                fontSize: 50, color: Colors.white, fontFamily: "Train"),
          ),
          centerTitle: true,
          bottom: const TabBar(
            tabs: [
              Tab(
                icon: Icon(
                  Icons.lock,
                  color: Colors.white,
                ),
                text: ('로그인'),
              ),
              Tab(
                icon: Icon(
                  Icons.lock,
                  color: Colors.white,
                ),
                text: ('가입'),
              ),
            ],
            indicatorColor: Colors.white38,
            indicatorWeight: 6,
          ),
        ),
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [Color.fromARGB(255, 119, 79, 92), Color.fromARGB(255, 145, 104, 101)],
            ),
          ),
          child: const TabBarView(children: [
            LoginScreen(),
            RegisterScreen(),
          ]),
        ),
      ),
    );
  }
}
