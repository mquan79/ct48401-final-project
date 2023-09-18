import 'package:flutter/material.dart';

class WeatherWidget extends StatelessWidget {
  final String city;
  final String temperature;
  final String description;
  final String main;

  WeatherWidget({
    required this.city,
    required this.temperature,
    required this.description,
    required this.main,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            'Thời tiết hiện tại ở $city:',
            style: TextStyle(fontSize: 18),
          ),
          SizedBox(height: 20),
          Text(
            'Nhiệt độ: $temperature°C',
            style: TextStyle(fontSize: 24),
          ),
          Text(
            'Mô tả: $description',
            style: TextStyle(fontSize: 24),
          ),
          Text(
            'Thời tiết: $main',
            style: TextStyle(fontSize: 24),
          ),
        ],
      ),
    );
  }
}
