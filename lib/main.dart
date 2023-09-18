import 'package:flutter/material.dart';
import 'api/weather_api.dart';
import 'widget/weather_widget.dart';

void main() => runApp(MyWeatherApp());

class MyWeatherApp extends StatefulWidget {
  @override
  _MyWeatherAppState createState() => _MyWeatherAppState();
}

class _MyWeatherAppState extends State<MyWeatherApp> {
  final String apiKey = 'd4fb828009d0941756bdad9f929a114d';
  final String city = 'Hà Nội';
  String temperature = '';
  String description = '';
  String main = '';
  bool isLoading = true;

  Future<void> fetchWeatherData() async {
    try {
      final WeatherApi weatherApi = WeatherApi(apiKey: apiKey);
      final weatherData = await weatherApi.fetchWeatherData(city);
      setState(() {
        temperature = (weatherData['main']['temp'] - 273.15).toStringAsFixed(1);
        description = weatherData['weather'][0]['description'];
        main = weatherData['weather'][0]['main'];
        isLoading = false;
      });
    } catch (error) {
      print('Error fetching weather data: $error');
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    fetchWeatherData();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Weather App'),
        ),
        body: Center(
          child: isLoading
              ? CircularProgressIndicator()
              : WeatherWidget(
                  city: city,
                  temperature: temperature,
                  description: description,
                  main: main,
                ),
        ),
      ),
    );
  }
}
