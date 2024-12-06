import 'package:bdo_api/screens/loading.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

 
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BDO_API',
      theme: ThemeData(
       
        primarySwatch: Colors.blue,
      ),
      home: const Loading(),
    );
  }
}