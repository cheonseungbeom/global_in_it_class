import 'package:flutter/material.dart';

class ScreenB extends StatelessWidget {
  const ScreenB({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Screen B'),
      ),
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          TextButton(
              onPressed: () {
                Navigator.pushNamed(context, '/');
              },
              child: const Text('Go to ScreenA')),
          TextButton(
              onPressed: () {
                Navigator.pushNamed(context, '/c');
              },
              child: const Text('Go to ScreecC')),
        ]),
      ),
    );
  }
}
