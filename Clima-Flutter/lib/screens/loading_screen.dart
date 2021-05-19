import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../services/location.dart';
import 'dart:convert';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  void getLocation() async {
    Location location = Location();
    await location.getCurrentLocation();
    print(location.latitude);
    print(location.longitude);
  }

  @override
  void initState() {
    super.initState();
    getLocation();
  }

// ?lat=35&lon=139&appid=b6907d289e10d714a6e88b30761fae22'
  void getData() async {
    http.Response response = await http.get(Uri.https('samples.openweathermap.org', '/data/2.5/weather',
        {"lat": "35", "lon": "139", "appid": "b6907d289e10d714a6e88b30761fae22"}));
    if (response.statusCode == 200) {
      String data = response.body;

      var decodedData = jsonDecode(data);

      double temperature = decodedData['main']['temp'];
      int conditionNumber = decodedData['weather'][0]['id'];
      String cityName = decodedData['name'];
      print(temperature);
    } else {
      print(response.body);
    }
  }

  @override
  Widget build(BuildContext context) {
    getData();
    return Scaffold();
  }
}
