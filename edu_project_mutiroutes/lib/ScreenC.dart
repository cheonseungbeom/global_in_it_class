import 'package:flutter/material.dart';

class ScreenC extends StatelessWidget {
  const ScreenC({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Screen C'),
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
                Navigator.pushNamed(context, '/b');
              },
              child: const Text('Go to ScreecB')),
        ]),
      ),
    );
  }
}
