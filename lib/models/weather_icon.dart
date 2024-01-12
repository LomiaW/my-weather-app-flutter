class WeatherIcon {
  num? weatherCode;
  String? description;

  void setWeatherDesc(num? wcode) {
    weatherCode = wcode;
    if (wcode == null) {
      description = "Unknown";
    }
    switch (weatherCode) {
      case 0:
        description = "Clear sky";
      case 1:
        description = "Mainly clear";
      case 2:
        description = "Partly cloudy";
      case 3:
        description = "Overcast";
      case 45:
        description = "Fog";
      case 48:
        description = "Depositing rime fog";
      case 51:
        description = "Light Drizzle";
      case 53:
        description = "Moderate Drizzle";
      case 55:
        description = "Dense Drizzle";
      case 56:
        description = "Light Freezing Drizzle";
      case 57:
        description = "Dense Freezing Drizzle";
      case 61:
        description = "Slight Rain";
      case 63:
        description = "Moderate Rain";
      case 65:
        description = "Heavy Rain";
      case 66:
        description = "Light Freezing Rain";
      case 67:
        description = "Heavy Freezing Rain";
      case 71:
        description = "Slight snow fall";
      case 73:
        description = "Moderate snow fall";
      case 75:
        description = "Heavy snow fall";
      case 77:
        description = "Snow grains";
      case 80:
        description = "Slight rain shower";
      case 81:
        description = "Moderate rain shower";
      case 82:
        description = "Violent rain shower";
      case 85:
        description = "Slight snow shower";
      case 86:
        description = "Heavy snow shower";
      case 95:
        description = "Thunderstorm";
      case 96:
        description = "Thunderstorm with slight hail";
      case 99:
        description = "Thunderstorm with heavy hail";
      default:
        description = "Sunny";
    }
  }

  String getWeatherIcon() {
    if (weatherCode == 0 || weatherCode == 1) return 'assets/sun.png';
    if (weatherCode == 2 || weatherCode == 3) return 'assets/cloudy.png';
    if (weatherCode == 45 || weatherCode == 48) return 'assets/fog.png';
    if (weatherCode == 51 || weatherCode == 53 || weatherCode == 55) {
      return 'assets/drizzle.png';
    }
    if (weatherCode == 56 ||
        weatherCode == 57 ||
        weatherCode == 85 ||
        weatherCode == 86) {
      return 'assets/freezing-rain.png';
    }
    if (weatherCode == 61 ||
        weatherCode == 63 ||
        weatherCode == 65 ||
        weatherCode == 66 ||
        weatherCode == 67) {
      return 'assets/rain.png';
    }
    if (weatherCode == 71 ||
        weatherCode == 73 ||
        weatherCode == 75 ||
        weatherCode == 77) {
      return 'assets/snow.png';
    }
    if (weatherCode == 80 || weatherCode == 81 || weatherCode == 82) {
      return 'assets/shower.png';
    }
    if (weatherCode == 95 || weatherCode == 96 || weatherCode == 99) {
      return 'assets/storm.png';
    }
    return 'assets/weather-forecast.png';
  }
}
