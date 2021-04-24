import 'package:clima/services/location.dart';
import 'package:clima/services/networking.dart';

class WeatherModel {
  Future<Map<String, dynamic>> getLocationWeather() async {
    print('Get location weather ...');
    Location location = Location();
    await location.determinePosition();
    return await getData(location.lon, location.lat);
  }

  Future<Map<String, dynamic>> getCityWeather(city) async {
    print('Get City weather ...');
    return await getDataCity(city);
  }

  String getWeatherIcon(int condition) {
    print(condition);
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

  String getMessage(double temp) {
    print(temp);
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
