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
      return '๐ฉ';
    } else if (condition < 400) {
      return '๐ง';
    } else if (condition < 600) {
      return 'โ๏ธ';
    } else if (condition < 700) {
      return 'โ๏ธ';
    } else if (condition < 800) {
      return '๐ซ';
    } else if (condition == 800) {
      return 'โ๏ธ';
    } else if (condition <= 804) {
      return 'โ๏ธ';
    } else {
      return '๐คทโ';
    }
  }

  String getMessage(double temp) {
    print(temp);
    if (temp > 25) {
      return 'It\'s ๐ฆ time';
    } else if (temp > 20) {
      return 'Time for shorts and ๐';
    } else if (temp < 10) {
      return 'You\'ll need ๐งฃ and ๐งค';
    } else {
      return 'Bring a ๐งฅ just in case';
    }
  }
}
