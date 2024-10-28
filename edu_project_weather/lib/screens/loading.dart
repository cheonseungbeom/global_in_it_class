import 'package:flutter/material.dart';
import 'package:edu_project_weather/data/my_location.dart';
import 'package:edu_project_weather/screens/weather_screen.dart';
import 'package:edu_project_weather/data/network.dart';

const apikey = '967a54f9dc0f757142dabab406009dcb';

class Loading extends StatefulWidget {
  const Loading({super.key});
  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  late double latutude3;
  late double longitude3;

  @override
  void initState() {
    //앱을 실행시키는 메소드
    // TODO: implement initState
    super.initState();
    getLocation(); //앱을 키자마자 정보 받아오기
  }

  void getLocation() async {
    MyLocation myLocation = MyLocation();
    await myLocation.getMyCurrentLocation();
    latutude3 = myLocation.latitude2;
    longitude3 = myLocation.longitude2;
    print(latutude3);
    print(longitude3);

    Network network = Network(
        'https://api.openweathermap.org/data/2.5/weather?lat=$latutude3&lon=$longitude3&appid=$apikey&units=metric',
        'http://api.openweathermap.org/data/2.5/air_pollution?lat=$latutude3&lon=$longitude3&appid=$apikey');

    var weatherData = await network.getJsonData();
    print(weatherData);

    var airData = await network.getAirData();
    print(airData);

    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return WeatherScreen(
          parseWeatherData: weatherData, parseAirPollution: airData);
      //웨더 스크린으로 이동시 두 웨더 데이터와 에어 데이터가 동시에 전달된다.
    }));
  }

  // void fetchData() async {

  //     var myJson = jsonDecode(jasonData)['weather'][0]['description'];

  //     var wind = jsonDecode(jasonData)['wind']['speed'];
  //     print(wind);

  //     var id = jsonDecode(jasonData)['id'];
  //     print(id);

  //     print(myJson);
  //   } else {
  //     print(response.body);
  //   }

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
