import 'package:flutter/material.dart';
import 'package:my_weather_app_flutter/pages/start_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'My Weather App',
      home: StartPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
