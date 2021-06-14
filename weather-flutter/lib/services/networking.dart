import 'dart:convert';

import 'package:http/http.dart';

const apiKey = '876f48905be5e7bd09942e3183e0d6cc';

class NetworkHelper {
  NetworkHelper(this.url);
  final String url;

  Future getData() async {
    //request - response
    Response response = await get(url);

    if (response.statusCode == 200) {
      String data = response.body;
      print(data); //Json format data {key:value}

      return jsonDecode(data);
    } else {
      print(response
          .statusCode); //2xx Success 3xx 접근 x 4xx Client Error 5xx Server Error
    }
  }
}
