import 'package:flutter/material.dart';
import 'package:bdo_api/data/network.dart';

import 'item_screen.dart';

class Loading extends StatefulWidget {
  const Loading({super.key});
  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  String a1= 'https://api.arsha.io/v2/kr/orders?id=16004&sid=0&lang=kr';
  String a2= 'https://api.arsha.io/v2/kr/orders?id=4918&sid=0&lang=kr';
  String a3= 'https://api.arsha.io/v2/kr/orders?id=44195&sid=0&lang=kr';
  String a4= '';
  String a5= '';
  String a6= '';
  String a7= '';
  String a8= '';
  String a9= '';



  @override
  void initState() {
    //앱을 실행시키는 메소드
    // TODO: implement initState
    super.initState();
    getItem(); //앱을 키자마자 정보 받아오기
  }

  void getItem() async {
    // MyLocation myLocation = MyLocation();
    // await myLocation.getMyCurrentLocation();
    // latutude3 = myLocation.latitude2;
    // longitude3 = myLocation.longitude2;

    Network network = Network(
        a1,
        );

    var itemData = await network.getJsonData();

    //print(itemData);

    

    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return WeatherScreen(
          parseItemData: itemData);
      //웨더 스크린으로 이동시 두 웨더 데이터와 에어 데이터가 동시에 전달된다.
    }));
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
