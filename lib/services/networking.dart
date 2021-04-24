import 'package:http/http.dart' as http;
import 'dart:convert';

const URL =
    'https://api.openweathermap.org/data/2.5/weather?appid=94f6bb5be45f14c64e9f177c21b52c93&units=metric';

Future<Map<String, dynamic>> getData(double lon, double lat) async {
  var uri = Uri.parse('$URL&lon=$lon&lat=$lat');
  var get = await http.Client().get(uri);
  if (get.statusCode == 200) {
    Map<String, dynamic> data = jsonDecode(get.body);
    return data;
  } else
    return null;
}

Future<Map<String, dynamic>> getDataCity(String city) async {
  var uri = Uri.parse('$URL&q=$city');
  var get = await http.Client().get(uri);
  if (get.statusCode == 200) {
    Map<String, dynamic> data = jsonDecode(get.body);
    return data;
  } else
    return null;
}
