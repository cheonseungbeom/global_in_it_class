import 'dart:math';
import 'package:http/http.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

class Loading extends StatefulWidget {
  const Loading({super.key});

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  @override
  void initState() {
    //앱을 실행시키는 메소드
    // TODO: implement initState
    super.initState();
    getLocation(); //앱을 키자마자 정보 받아오기
  }

  void getLocation() async {
    try {
      LocationPermission permission = await Geolocator.requestPermission();
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high);
      print(position);
    } catch (e) {
      print('인터넷 연결에 문제가 발생했습니다.');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: ElevatedButton(
        onPressed: () {
          null;
          //getLocation();
        },
        child: const Text(
          'Get my loaction',
          style: TextStyle(color: Colors.white),
        ),
      )),
    );
  }
}
