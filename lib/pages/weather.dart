import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:flutter_todo/pages/main_screen.dart';
import 'package:flutter_todo/widgets/rain.dart';
import 'dart:math' as math;
import 'package:flutter_todo/main.dart';
import 'package:flutter_todo/pages/home.dart';
import 'package:flutter_todo/pages/main_screen.dart';
import 'package:flutter_todo/widgets/time.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'dart:core';


class Weather extends StatelessWidget {
  const Weather({super.key});

  @override
  Widget build(BuildContext context) {
    final Key parallaxOne = GlobalKey();

    bool showdate = true;
    
    double res_width = MediaQuery.of(context).size.width;
    double res_height = MediaQuery.of(context).size.height;
  
    Future<Map<String, dynamic>> _getWeatherData() async {
      final String url = 'https://api.weather.yandex.ru/v2/forecast';

      final response = await http.get(Uri.parse(url), headers: {
        'X-Yandex-API-Key': '3092ad91-133b-4de7-9c87-d9d8304b7b3a',
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      });

      if (response.statusCode == 200) {
        final data = jsonDecode(utf8.decode(response.bodyBytes));
        return {
          'temperature': data['fact']['temp'],
          'description': data['fact']['condition'],
          'cityName': data['geo_object']['locality']['name']
        };
      } else {
        throw Exception('Failed to load weather data');
      }
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          'Погода', 
          style: TextStyle(color: Color.fromARGB(255, 59, 114, 215)),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          color: Color.fromARGB(255, 59, 114, 215),
          onPressed: () {
            Navigator.pushNamedAndRemoveUntil(context, '/', (route) => false);
          },
        ),
      ),
      body: FutureBuilder<Map<String, dynamic>>(
        future: _getWeatherData(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final temperature = snapshot.data!['temperature'];
            final description = snapshot.data!['description'];
            final cityName = snapshot.data!['cityName'];

            return Container(
              height: res_height * 1,
              color: Color.fromARGB(255, 59, 119, 215),
              child: Stack(
                children: [
                  //...
                  Positioned(
                    left: 20,
                    top: res_height * 0.05,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          DateFormat('dd-MM-yyyy').format(DateTime.now()),
                          style: TextStyle(fontSize: 25, color: Colors.white),
                        ),
                        Text(
                          DateFormat('HH:mm').format(DateTime.now()),
                          style: TextStyle(fontSize: 25, color: Colors.white),
                        ),
                        Text(
                          '$temperature°C',
                          style: TextStyle(fontSize: 50, color: Colors.white),
                        ),
                        SizedBox(
                          height: 10,
                        ), 
                        Text(
                          description,
                          style: TextStyle(fontSize: 20, color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    bottom: res_height * 0.6,
                    left: 20,
                    child: Text(
                      cityName,
                      style: TextStyle(fontSize: 40, color: Colors.white),
                    ),
                  ),
                ],
              ),
            );
          
          } else if (snapshot.hasError) {
            return Center(child: Text('${snapshot.error}'));
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}