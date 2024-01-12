// ***************************
// JsonSerializableGenerator
// ***************************
part of 'weather.dart';

Weather _$WeatherFromJson(Map<String, dynamic> json) => Weather(
      latitude: (json['latitude'] as num?)?.toDouble(),
      longitude: (json['longitude'] as num?)?.toDouble(),
      currentUnits: json['current_units'] == null
          ? null
          : CurrentUnits.fromJson(
              json['current_units'] as Map<String, dynamic>),
      current: json['current'] == null
          ? null
          : Current.fromJson(json['current'] as Map<String, dynamic>),
      hourly: json['hourly'] == null
          ? null
          : Hourly.fromJson(json['hourly'] as Map<String, dynamic>),
    );
Map<String, dynamic> _$WeatherToJson(Weather instance) => <String, dynamic>{
      'latitude': instance.latitude,
      'longitude': instance.longitude,
      'current_units': instance.currentUnits,
      'current': instance.current,
      'hourly': instance.hourly,
    };

CurrentUnits _$CurrentUnitsFromJson(Map<String, dynamic> json) => CurrentUnits(
      time: json['time'] as String?,
      interval: json['interval'] as String?,
    );
Map<String, dynamic> _$CurrentUnitsToJson(CurrentUnits instance) =>
    <String, dynamic>{
      'time': instance.time,
      'interval': instance.interval,
    };

Current _$CurrentFromJson(Map<String, dynamic> json) => Current(
      time: json['time'] as String?,
      interval: json['interval'] as num?,
      temperature2m: json['temperature_2m'] as num?,
      weatherCode: json['weather_code'] as num?,
    );
Map<String, dynamic> _$CurrentToJson(Current instance) => <String, dynamic>{
      'time': instance.time,
      'interval': instance.interval,
      'temperature_2m': instance.temperature2m,
      'weather_code': instance.weatherCode,
    };

Hourly _$HourlyFromJson(Map<String, dynamic> json) => Hourly(
      time: (json['time'] as List<dynamic>?)
          ?.map((e) => DateTime.parse(e as String))
          .toList(),
      temperature2m: (json['temperature_2m'] as List<dynamic>?)
          ?.map((e) => (e as num).toDouble())
          .toList(),
    );
Map<String, dynamic> _$HourlyToJson(Hourly instance) => <String, dynamic>{
      'time': instance.time?.map((e) => e.toIso8601String()).toList(),
      'temperature_2m':
          instance.temperature2m?.map((e) => e.toDouble()).toList(),
    };
