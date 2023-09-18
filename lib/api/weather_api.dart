import 'dart:convert';
import 'package:http/http.dart' as http;

class WeatherApi {
  final String apiKey;

  WeatherApi({required this.apiKey});

  Future<Map<String, dynamic>> fetchWeatherData(String city) async {
    final Uri uri = Uri.parse(
        'https://api.openweathermap.org/data/2.5/weather?q=$city&appid=$apiKey');

    final response = await http.get(uri);

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to load weather data');
    }
  }
}
