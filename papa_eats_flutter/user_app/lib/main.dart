import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:user_app/assistant_methods/address_changer.dart';
import 'package:user_app/assistant_methods/cart_item_counter.dart';
import 'package:user_app/assistant_methods/total_ammount.dart';
import 'package:user_app/splashScreen/splash_screen.dart';
import 'global/global.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  sharedPreferences = await SharedPreferences.getInstance();
  await Firebase.initializeApp(); //firebase 연결 (백엔드 연결)
  runApp(const MyApp()); // 앱 시작 명령어
}

class MyApp extends StatelessWidget {
  //본격적으로 앱 실행됐을 때 가장 먼저 실행되는 곳
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => CartItemCounter()),
        ChangeNotifierProvider(create: (context) => TotalAmmount()),
        ChangeNotifierProvider(create: (context) => AddressChanger()),
      ], //MultiProvider를 사용하여
      child: MaterialApp(
        title: 'Users App', // 앱의 이름
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home:
            const MySplashScreen(), //처음 로딩 화면을 보여준다."Cold Start"와 "Warm Start"일때만 동작
      ),
    );
  }
} // StatelessWidget는 UI화면을 구성할 때 사용하는 위젯 클래스
