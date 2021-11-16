import 'dart:convert';

import 'package:weather_bloc/data/models/weather_model.dart';
import 'package:http/http.dart' as http;

abstract class WeatherRemoteData {
  Future<Weather> getWeather(String city);
}

class WeatherRemoteDataImpl implements WeatherRemoteData {
  static const _apiUrl = 'http://api.openweathermap.org/data/2.5/';
  static const _apiKey = 'd319d4b51f79bf3f3315418ae33c658d';

  @override
  Future<Weather> getWeather(String city) async {
    try {
      final response =
          await http.get(Uri.parse('$_apiUrl/weather?q=$city&appid=$_apiKey'));
      if (response.statusCode == 200) {
        return Weather.fromJson(jsonDecode(response.body));
      } else {
        throw Exception('Response status code is ${response.statusCode}');
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
