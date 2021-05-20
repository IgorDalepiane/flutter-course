import 'package:clima/services/networking.dart';
import '../services/location.dart';

const apiKey = '185cf74b03b470c6c20911f906b8b00c';
const openWeatherMapURL = 'api.openweathermap.org';

class WeatherModel {
  Future<dynamic> getCityWeather(String cityName) async {
    NetworkHelper networkHelper = NetworkHelper(Uri.https(
        openWeatherMapURL, '/data/2.5/weather', {"q": cityName, "appid": apiKey, "units": "metric"}));
    return await networkHelper.getData();
  }

  Future<dynamic> getLocationWeather() async {
    Location location = Location();
    await location.getCurrentLocation();
    NetworkHelper networkHelper = NetworkHelper(Uri.https(openWeatherMapURL, '/data/2.5/weather', {
      "lat": location.latitude.toString(),
      "lon": location.longitude.toString(),
      "appid": apiKey,
      "units": "metric"
    }));

    return await networkHelper.getData();
  }

  String getWeatherIcon(int condition) {
    if (condition < 300) {
      return '🌩';
    } else if (condition < 400) {
      return '🌧';
    } else if (condition < 600) {
      return '☔️';
    } else if (condition < 700) {
      return '☃️';
    } else if (condition < 800) {
      return '🌫';
    } else if (condition == 800) {
      return '☀️';
    } else if (condition <= 804) {
      return '☁️';
    } else {
      return '🤷‍';
    }
  }

  String getMessage(int temp) {
    if (temp > 25) {
      return 'It\'s 🍦 time';
    } else if (temp > 20) {
      return 'Time for shorts and 👕';
    } else if (temp < 10) {
      return 'You\'ll need 🧣 and 🧤';
    } else {
      return 'Bring a 🧥 just in case';
    }
  }
}
