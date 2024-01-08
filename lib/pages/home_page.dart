import 'package:flutter/material.dart';
import 'package:my_weather_app_flutter/models/my_geo_location.dart';
import 'package:my_weather_app_flutter/models/weather_icon.dart';
import 'package:weather_open_meteo_client/weather_open_meteo_client.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  MyGeoLocation? _geoLocation;
  Weather? _weather;
  WeatherIcon? _weatherIcon;
  HourlyWeather? _hourly;
  // Forecast? _forecast;

  Future<void> getWeatherInfo() async {
    // get the current location for the local device
    MyGeoLocation location = MyGeoLocation();
    await location.getCurrentLocation();
    setState(() {
      _geoLocation = location;
    });
    // get the open meteo api to fetch weather data
    OpenMeteoApi openMeteo = OpenMeteoApi();
    var w = await openMeteo.getWeatherByCoordinate(
        latitude: _geoLocation!.latitude!, longitude: _geoLocation!.longitude!);
    setState(() {
      _weather = w;
      _hourly = _weather?.hourly;
    });
    // get the weather icon with hourly weather code
    WeatherIcon icon = WeatherIcon();
    icon.setWeatherDesc(_hourly?.weathercode?[0]);
    setState(() {
      _weatherIcon = icon;
    });
    // _forecast = Forecast(
    //     latitude: _geoLocation!.latitude!, longitude: _geoLocation!.longitude!);
  }

  @override
  void initState() {
    super.initState();
    getWeatherInfo();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page'),
      ),
      body: _buildUI(),
    );
  }

  Widget _buildUI() {
    if (_geoLocation == null) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    }
    return SizedBox(
      height: MediaQuery.sizeOf(context).height,
      width: MediaQuery.sizeOf(context).width,
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          _locationHeader(),
          SizedBox(
            height: MediaQuery.sizeOf(context).height * 0.08,
          ),
          // _weatherIconInfo(),
          SizedBox(
            height: MediaQuery.sizeOf(context).height * 0.02,
          ),
          // _currentTemp(),
          SizedBox(
            height: MediaQuery.sizeOf(context).height * 0.02,
          ),
          // _weekForecastInfo(),
        ],
      ),
    );
  }

  Widget _locationHeader() {
    return Text(
      _geoLocation?.cityName ?? "Loading ... ",
      style: const TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w500,
      ),
    );
  }

  Widget _weatherIconInfo() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          height: MediaQuery.sizeOf(context).height * 0.20,
          width: MediaQuery.sizeOf(context).width * 0.40,
          decoration: BoxDecoration(
            color: Colors.deepPurpleAccent,
            borderRadius: BorderRadius.circular(
              20,
            ),
          ),
          child: Image.asset(_weatherIcon!.getWeatherIcon()),
        ),
        Text(
          _weatherIcon?.description ?? "",
          style: const TextStyle(
            color: Colors.black,
            fontSize: 20,
          ),
        ),
      ],
    );
  }

  Widget _currentTemp() {
    return Text(
      "${_hourly!.temperature_2m?[0]}° C",
      style: const TextStyle(
        color: Colors.black,
        fontSize: 90,
        fontWeight: FontWeight.w500,
      ),
    );
  }

  Widget _weekForecastInfo() {
    return Container(
      height: MediaQuery.sizeOf(context).height * 0.15,
      width: MediaQuery.sizeOf(context).width * 0.80,
      decoration: BoxDecoration(
        color: Colors.deepPurpleAccent,
        borderRadius: BorderRadius.circular(
          20,
        ),
      ),
      padding: const EdgeInsets.all(
        8.0,
      ),
      child: const Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              child: Text(
                "Day 1",
                style: TextStyle(
                  fontSize: 15,
                ),
              ),
            ),
            SizedBox(
              child: Text(
                "Day 2",
                style: TextStyle(
                  fontSize: 15,
                ),
              ),
            ),
            SizedBox(
              child: Text(
                "Day 3",
                style: TextStyle(
                  fontSize: 15,
                ),
              ),
            ),
          ]),
    );
  }
}
