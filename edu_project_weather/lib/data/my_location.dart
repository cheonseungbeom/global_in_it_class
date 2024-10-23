import 'package:geolocator/geolocator.dart';

class MyLocation {
  late double latitude2;
  late double longitude2;

  Future<void> getMyCurrentLocation() async {
    try {
      LocationPermission permission = await Geolocator.requestPermission();
      //널세이프티로 추가된 코드.
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high);
      latitude2 = position.latitude;
      longitude2 = position.longitude;

      print(latitude2);
      print(longitude2);
    } catch (e) {
      print('인터넷 연결에 문제가 발생했습니다.');
    }
  }
}
