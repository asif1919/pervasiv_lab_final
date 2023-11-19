import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class WeatherAppByCity extends StatefulWidget {
  @override
  _WeatherAppByCityState createState() => _WeatherAppByCityState();
}

class _WeatherAppByCityState extends State<WeatherAppByCity> {
  TextEditingController _searchController = TextEditingController();
  String _city = '';
  String _weatherData = '';

  Future<void> _getWeatherData(String city) async {
    // Replace 'YOUR_API_KEY' with your actual OpenWeatherMap API key
    const apiKey = 'f54a5c68f5b38d4719ff2cd73aa37e9e';
    final apiUrl =
        'https://api.openweathermap.org/data/2.5/weather?q=$city&appid=$apiKey';

    final response = await http.get(Uri.parse(apiUrl));

    if (response.statusCode == 200) {
      final weatherData = json.decode(response.body);
      setState(() {
        _weatherData = 'Temperature: ${weatherData["main"]["temp"]}°C\n'
            'Description: ${weatherData["weather"][0]["description"]}';
      });
    } else {
      setState(() {
        _weatherData = 'Failed to load weather data';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Weather App'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _searchController,
              decoration: const InputDecoration(
                labelText: 'Enter City',
              ),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  _city = _searchController.text;
                });
                _getWeatherData(_city);
              },
              child: const Text('Search'),
            ),
            const SizedBox(height: 16),
            Text(
              'Weather for $_city:',
              style: TextStyle(
                            color: Colors.black.withOpacity(0.7),
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                          ),
            ),
            const SizedBox(height: 20,),
           _weatherData ==''?const SizedBox(): Card(
              color: Colors.black,
                child: Padding(
              padding: const EdgeInsets.all(20),
              child: SizedBox(width: 300,
                child: Text(_weatherData ,
                style: const TextStyle(
                              color: Colors.white,
                              fontSize: 17,
                              fontWeight: FontWeight.bold,
                            ),
                ),
              ),
            )),
          ],
        ),
      ),
    );
  }
}
