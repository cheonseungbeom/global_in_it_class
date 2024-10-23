import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:timer_builder/timer_builder.dart';
import 'package:timer_builder/timer_builder.dart';
import 'package:intl/intl.dart'; //DateFormat을 쓰기위한 패키지

class WeatherScreen extends StatefulWidget {
  WeatherScreen({this.parseWeatherData});
  final dynamic parseWeatherData;

  @override
  _WeatherScreenState createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
  late String cityName;
  late int temp;
  var date = DateTime.now();
  //스크린상 표현될 값들 선언

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    updateData(widget.parseWeatherData);
  }

  void updateData(dynamic weatherData) {
    double temp2 = weatherData['main']['temp'];
    temp = temp2.round();
    cityName = weatherData['name'];

    print(temp);
    print(cityName);
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
          icon: Icon(Icons.near_me),
          onPressed: () {},
          iconSize: 30.0,
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.location_searching),
            onPressed: () {},
            iconSize: 30.0,
          ),
        ],
      ),
      body: Container(
        child: Stack(
          children: [
            Image.asset(
              'image/background.jpg',
              fit: BoxFit.cover,
              width: double.infinity,
              height: double.infinity,
            ),
            Container(
              padding: EdgeInsets.all(20),
              child: Column(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 150.0,
                      ),
                      Text('Seoul',
                          style: GoogleFonts.lato(
                            fontSize: 35.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          )),
                      Row(
                        children: [
                          TimerBuilder.periodic((Duration(minutes: 1)),
                              builder: (context) {
                            print('${getSystemTime()}');
                            return Text(
                              '${getSystemTime()}',
                              style: GoogleFonts.lato(
                                  fontSize: 16.0, color: Colors.white),
                            );
                          }),
                          Text(
                            DateFormat(' - EEEE').format(date),
                            style: GoogleFonts.lato(
                                fontSize: 16.0, color: Colors.white),
                          ),
                          Text(
                            DateFormat(' - d MMM, yyy').format(date),
                            style: GoogleFonts.lato(
                                fontSize: 16.0, color: Colors.white),
                          )
                        ],
                      )
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    //기온을 넣을 자리
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
