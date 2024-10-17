import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'App Bar',
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
        title: Text('app bar desu!'),
        centerTitle: true,
        backgroundColor: Colors.red,
        elevation: 0.0,
      ),
      body: MySnackBar(),
    );
  }
}

class MySnackBar extends StatelessWidget{
  @override
  Widget build (BuildContext context) {
    return Center(
      child: ElevatedButton(onPressed: (){
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text('Hellow',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.white
            ),
          ),
          backgroundColor: Colors.teal,
          duration: Duration(milliseconds: 1000),
          )
          );
      }, child: Text('button'),),
    );
  }
}