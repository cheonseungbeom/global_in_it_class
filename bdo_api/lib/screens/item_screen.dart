import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:timer_builder/timer_builder.dart';
import 'package:intl/intl.dart'; //DateFormat을 쓰기위한 패키지

class WeatherScreen extends StatefulWidget {
  const WeatherScreen(
      {super.key, this.parseItemData});
  final dynamic parseItemData;
 // final dynamic parseAirPollution;

  @override
  _WeatherScreenState createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
  //스크린상 표현될 값들 선언
  //Model model = Model();

  late String itemName; //두 변수를 이용해 현재 나의 위치와 온도를 가져온다.
  late int price; //두 변수를 이용해 현재 나의 위치와 온도를 가져온다.

  var date = DateTime.now();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    updateData(widget.parseItemData);
    //로딩 라우트에서 받아온 json데이터를 전달.
  }

  void updateData(dynamic itemData) {
    itemName = itemData['name'];
    price = itemData['orders'][0]['price'];
    // int index = airData['list'][0]['main']['aqi'];
    // pm25 = airData['list'][0]['components']['pm2_5']; //초미세먼지
    // pm10 = airData['list'][0]['components']['pm10']; //미세먼지

    
    // temp = temp2.round(); //두 변수를 이용해 현재 나의 위치와 온도를 가져온다.
    // cityName = itemData['name']; //두 변수를 이용해 현재 나의 위치와 온도를 가져온다.
    // icon = model.getWeatherIcon(condition);
    // airIcon = model.getAirIcon(index);
    // airState = model.getAirCondition(index);
  }

  String getSystemTime() {
    var now = DateTime.now();
    return DateFormat("h:mm a").format(now);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0.0,
        //title: Text(''),
        backgroundColor: Colors.transparent,
        leading: IconButton(
          icon: const Icon(Icons.near_me),
          onPressed: () {},
          iconSize: 30.0,
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.location_searching),
            onPressed: () {},
            iconSize: 30.0,
          ),
        ],
      ),
      body: Container(
        child: Stack(
          children: [
            
            Container(
              padding: const EdgeInsets.all(20),
              child: Column(
                //최상위 컬럼
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(
                              height: 150.0,
                            ),
                            Text(itemName,
                                style: const TextStyle(
                                  fontSize: 35.0,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,)
                                ),
                            Row(
                              children: [
                                TimerBuilder.periodic(
                                    (const Duration(minutes: 1)),
                                    builder: (context) {
                                  print(getSystemTime());
                                  return Text(
                                    getSystemTime(),
                                    style: GoogleFonts.lato(
                                        fontSize: 16.0, color: Colors.black),
                                  );
                                }),
                                Text(
                                  DateFormat(' ').format(date),
                                  style: GoogleFonts.lato(
                                      fontSize: 16.0, color: Colors.black),
                                ),
                                Text(
                                  DateFormat(' ').format(date),
                                  style: GoogleFonts.lato(
                                      fontSize: 16.0, color: Colors.black),
                                )
                              ],
                            )
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          //기온을 넣을 자리
                          children: [
                            Text('$price',
                                style: GoogleFonts.lato(
                                  fontSize: 85.0,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                )),
                            Row(
                              children: [
                                
                                const SizedBox(
                                  width: 10.0,
                                ),
                                Text(
                                  '현재 거래소 가격',
                                  style: GoogleFonts.lato(
                                    fontSize: 16.0,
                                    color: Colors.black,
                                  ),
                                ),
                              ],
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                  
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
