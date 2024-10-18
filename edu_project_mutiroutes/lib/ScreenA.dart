import 'package:flutter/material.dart';

class ScreenA extends StatelessWidget {
  const ScreenA({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Screen A'),
      ),
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          TextButton(
              onPressed: () {
                Navigator.pushNamed(context, '/b'); //스크린b의 context 값
              },
              child: Text('Go to ScreenB')),
          TextButton(
              onPressed: () {
                Navigator.pushNamed(context, '/c'); //스크린c의 context 값
              },
              child: Text('Go to ScreecC')),
        ]),
      ),
    );
  }
}
