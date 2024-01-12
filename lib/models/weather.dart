import 'package:json_annotation/json_annotation.dart';
part 'weather.g.dart';

@JsonSerializable()
class Weather {
  @JsonKey(name: "latitude")
  final double? latitude;
  @JsonKey(name: "longitude")
  final double? longitude;
  @JsonKey(name: "current_units")
  final CurrentUnits? currentUnits;
  @JsonKey(name: "current")
  final Current? current;
  @JsonKey(name: "hourly")
  final Hourly? hourly;

  Weather({
    required this.latitude,
    required this.longitude,
    this.currentUnits,
    this.current,
    this.hourly,
  });

  factory Weather.fromJson(Map<String, dynamic> json) =>
      _$WeatherFromJson(json);

  Map<String, dynamic> toJson() => _$WeatherToJson(this);
}

@JsonSerializable()
class CurrentUnits {
  @JsonKey(name: "time")
  final String? time;
  @JsonKey(name: "interval")
  final String? interval;
  @JsonKey(name: "temperature_2m")
  final String? temperature;
  @JsonKey(name: "weather_code")
  final String? weatherCode;

  CurrentUnits({
    this.time,
    this.interval,
    this.temperature,
    this.weatherCode,
  });

  factory CurrentUnits.fromJson(Map<String, dynamic> json) =>
      _$CurrentUnitsFromJson(json);

  Map<String, dynamic> toJson() => _$CurrentUnitsToJson(this);
}

@JsonSerializable()
class Current {
  @JsonKey(name: "time")
  final String? time;
  @JsonKey(name: "interval")
  final num? interval;
  @JsonKey(name: "temperature_2m")
  final num? temperature2m;
  @JsonKey(name: "weather_code")
  final num? weatherCode;

  Current({
    this.time,
    this.interval,
    this.temperature2m,
    this.weatherCode,
  });

  factory Current.fromJson(Map<String, dynamic> json) =>
      _$CurrentFromJson(json);

  Map<String, dynamic> toJson() => _$CurrentToJson(this);
}

@JsonSerializable()
class Hourly {
  @JsonKey(name: "time")
  final List<DateTime>? time;
  @JsonKey(name: "temperature_2m")
  final List<double>? temperature2m;

  Hourly({
    this.time,
    this.temperature2m,
  });

  factory Hourly.fromJson(Map<String, dynamic> json) => _$HourlyFromJson(json);

  Map<String, dynamic> toJson() => _$HourlyToJson(this);
}
