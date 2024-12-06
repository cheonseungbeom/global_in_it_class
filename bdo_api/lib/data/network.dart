import 'package:http/http.dart' as http;
import 'dart:convert';

class Network {
  final String url1;
  //final String url2;

  Network(this.url1);

  Future<dynamic> getJsonData() async {
    http.Response response = await http.get(Uri.parse(url1));
    if (response.statusCode == 200) {
    // UTF-8로 명시적으로 디코딩
    String jsonData = utf8.decode(response.bodyBytes);

    // JSON 데이터 파싱
    var parsingData = jsonDecode(jsonData);
    return parsingData;
  } else {
    throw Exception('Failed to load data');
  }
  }

  // Future<dynamic> getAirData() async {
  //   http.Response response = await http.get(Uri.parse(url2));
  //   if (response.statusCode == 200) {
  //     String jasonData = response.body;
  //     var parsingData = jsonDecode(jasonData);
  //     return parsingData;
  //   }
  // }
}
