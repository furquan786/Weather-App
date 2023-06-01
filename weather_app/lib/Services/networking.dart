// import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:weather_app/Services/location.dart';

const apikey = '8244b0c2483d2706cf79bb8779147ffc';
var latitude;
var longitude;

class Networking {
  Future<dynamic> getcityweather(String cityname) async {
    var url =
        'https://api.openweathermap.org/data/2.5/weather?q=$cityname&appid=$apikey&units=metric';
    Location location = Location();
    await location.getcurrentloaction();
    latitude = location.latitude;
    longitude = location.longitude;
    try {
      http.Response response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        var data = response.body;
        var jsondata = jsonDecode(data);
        return jsondata;
      } else {
        print(response.statusCode);
      }
    } catch (e) {
      print(e);
    }
  }

  Future<dynamic> apidata() async {
    Location location = Location();
    await location.getcurrentloaction();
    latitude = location.latitude;
    longitude = location.longitude;
    try {
      http.Response response = await http.get(
        Uri.parse(
            'https://api.openweathermap.org/data/2.5/weather?lat=$latitude&lon=$longitude&appid=$apikey&units=metric'),
      );
      print(response);
      if (response.statusCode == 200) {
        var data = response.body;
        var jsondata = jsonDecode(data);
        return jsondata;
      } else {
        print(response.statusCode);
      }
    } catch (e) {
      print(e);
    }
  }
}
