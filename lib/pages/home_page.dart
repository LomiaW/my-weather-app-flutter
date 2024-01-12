import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:my_weather_app_flutter/models/constants.dart';
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
  CurrentWeather? _currentWeather;
  WeatherIcon? _weatherIcon;
  Constants myConstants = Constants();

  Future<void> getWeatherInfo() async {
    // get the current location for the local device
    MyGeoLocation location = MyGeoLocation();
    await location.getCurrentLocation();
    setState(() {
      _geoLocation = location;
    });
    // get the open meteo api to fetch weather data
    OpenMeteoApi openMeteo = OpenMeteoApi();
    _weather = await openMeteo.getWeatherByCoordinate(
        latitude: _geoLocation!.latitude!,
        longitude: _geoLocation!.longitude!,
        current_weather: true);
    setState(() {
      _currentWeather = _weather!.current_weather!;
    });
    // get the weather icon with the weather code
    WeatherIcon icon = WeatherIcon();
    icon.setWeatherDesc(_currentWeather!.weathercode!);
    setState(() {
      _weatherIcon = icon;
    });
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
        title: const Text(
          'Home',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: myConstants.secondaryColor,
      ),
      drawer: Drawer(
          backgroundColor: myConstants.primaryColor,
          child: const Column(
            children: [
              DrawerHeader(
                child: Icon(
                  Icons.face,
                  size: 48,
                  color: Color.fromARGB(176, 255, 255, 255),
                ),
              ),
              ListTile(
                leading: Icon(
                  Icons.home_rounded,
                  color: Color.fromARGB(176, 255, 255, 255),
                ),
                title: Text(
                  "H O M E",
                  style: TextStyle(
                      color: Color.fromARGB(176, 255, 255, 255),
                      fontWeight: FontWeight.bold),
                ),
              ),
              ListTile(
                leading: Icon(
                  Icons.settings,
                  color: Color.fromARGB(176, 255, 255, 255),
                ),
                title: Text(
                  "S E T T I N G S",
                  style: TextStyle(
                      color: Color.fromARGB(176, 255, 255, 255),
                      fontWeight: FontWeight.bold),
                ),
              ),
            ],
          )),
      body: _buildUI(),
    );
  }

  Widget _buildUI() {
    return SizedBox(
      height: MediaQuery.sizeOf(context).height,
      width: MediaQuery.sizeOf(context).width,
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          _locationHeader(),
          _weatherIconInfo(),
          _weatherTemp(),
        ],
      ),
    );
  }

  Widget _locationHeader() {
    return Text(
      _geoLocation?.cityName ?? "Loading ... ",
      style: const TextStyle(
        fontSize: 24,
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
            color: Colors.white,
            borderRadius: BorderRadius.circular(
              20,
            ),
          ),
          padding: const EdgeInsets.all(16.0),
          child:
              Image.asset(_weatherIcon?.getWeatherIcon() ?? 'assets/sun.png'),
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

  Widget _weatherTemp() {
    return Text(
      "${_currentWeather?.temperature}° C",
      style: const TextStyle(
        color: Colors.black,
        fontSize: 24,
        fontWeight: FontWeight.w500,
      ),
    );
  }

  // /Widget _weatherForecast() {}
}
