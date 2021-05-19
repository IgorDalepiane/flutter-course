import 'package:clima/services/networking.dart';
import 'package:flutter/material.dart';
import '../services/location.dart';

const apiKey = '185cf74b03b470c6c20911f906b8b00c';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  double latitude;
  double longitude;

  @override
  void initState() {
    super.initState();
    getLocationData();
  }

  void getLocationData() async {
    Location location = Location();
    await location.getCurrentLocation();
    latitude = location.latitude;
    longitude = location.longitude;
    NetworkHelper networkHelper = NetworkHelper(Uri.https('api.openweathermap.org', '/data/2.5/weather',
        {"lat": latitude.toString(), "lon": longitude.toString(), "appid": apiKey}));

    var weatherData = await networkHelper.getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
