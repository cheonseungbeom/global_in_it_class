import 'package:flutter/material.dart';
import 'package:papa_eats/home/home.dart';

void main() async {
  // WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'PAPA EATS',
        theme: ThemeData(primarySwatch: Colors.blue),
        home: const HomeScreen());
  }
}
