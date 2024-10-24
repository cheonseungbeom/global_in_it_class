import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:timer_builder/timer_builder.dart';
import 'package:edu_project_weather/model/model.dart';
import 'package:intl/intl.dart'; //DateFormat을 쓰기위한 패키지

class WeatherScreen extends StatefulWidget {
  const WeatherScreen({super.key, this.parseWeatherData});
  final dynamic parseWeatherData;

  @override
  _WeatherScreenState createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
  late String cityName; //두 변수를 이용해 현재 나의 위치와 온도를 가져온다.
  late int temp; //두 변수를 이용해 현재 나의 위치와 온도를 가져온다.
  var date = DateTime.now();

  //스크린상 표현될 값들 선언

  Widget? icon;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    updateData(widget.parseWeatherData); //로딩 라우트에서 받아온 json데이터를 전달.
  }

  void updateData(dynamic weatherData) {
    Model model = Model();
    double temp2 = weatherData['main']['temp'];
    int condition = weatherData['weather'][0]['id'];

    temp = temp2.round(); //두 변수를 이용해 현재 나의 위치와 온도를 가져온다.
    cityName = weatherData['name']; //두 변수를 이용해 현재 나의 위치와 온도를 가져온다.
    icon = model.getWeatherIcon(condition);

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
            Image.asset(
              'image/background.jpg',
              fit: BoxFit.cover,
              width: double.infinity,
              height: double.infinity,
            ),
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
                            Text(cityName,
                                style: GoogleFonts.lato(
                                  fontSize: 35.0,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                )),
                            Row(
                              children: [
                                TimerBuilder.periodic(
                                    (const Duration(minutes: 1)),
                                    builder: (context) {
                                  print(getSystemTime());
                                  return Text(
                                    getSystemTime(),
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
                          children: [
                            Text('$temp\u2103',
                                style: GoogleFonts.lato(
                                  fontSize: 85.0,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                )),
                            Row(
                              children: [
                                icon!,
                                const SizedBox(
                                  width: 10.0,
                                ),
                                Text(
                                  'Clear Sky',
                                  style: GoogleFonts.lato(
                                    fontSize: 16.0,
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                  Column(
                    children: [
                      const Divider(
                        height: 15.0,
                        thickness: 2.0,
                        color: Colors.white30,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            children: [
                              Text(
                                'AQI (대기질지수)',
                                style: GoogleFonts.lato(
                                  fontSize: 14.0,
                                  color: Colors.white,
                                ),
                              ),
                              const SizedBox(
                                height: 10.0,
                              ),
                              Image.asset(
                                'image/bad.png',
                                width: 37.0,
                                height: 35.0,
                              ),
                              const SizedBox(
                                height: 10.0,
                              ),
                              Text(
                                '"매우나쁨"',
                                style: GoogleFonts.lato(
                                    fontSize: 14.0,
                                    color: Colors.black87,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                          Column(
                            children: [
                              Text(
                                '미세먼지',
                                style: GoogleFonts.lato(
                                  fontSize: 14.0,
                                  color: Colors.white,
                                ),
                              ),
                              const SizedBox(
                                height: 10.0,
                              ),
                              Text(
                                '174.75',
                                style: GoogleFonts.lato(
                                  fontSize: 14.0,
                                  color: Colors.white,
                                ),
                              ),
                              const SizedBox(
                                height: 10.0,
                              ),
                              Text(
                                'ug/m3',
                                style: GoogleFonts.lato(
                                    fontSize: 14.0,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                          Column(
                            children: [
                              Text(
                                '초미세먼지',
                                style: GoogleFonts.lato(
                                  fontSize: 14.0,
                                  color: Colors.white,
                                ),
                              ),
                              const SizedBox(
                                height: 10.0,
                              ),
                              Text(
                                '84.03',
                                style: GoogleFonts.lato(
                                  fontSize: 14.0,
                                  color: Colors.white,
                                ),
                              ),
                              const SizedBox(
                                height: 10.0,
                              ),
                              Text(
                                'ug/m3',
                                style: GoogleFonts.lato(
                                    fontSize: 14.0,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          )
                        ],
                      )
                    ],
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
