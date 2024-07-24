// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'city_weather_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CityWeatherResponse _$CityWeatherResponseFromJson(Map<String, dynamic> json) =>
    CityWeatherResponse(
      latitude: (json['latitude'] as num).toDouble(),
      longitude: (json['longitude'] as num).toDouble(),
      elevation: (json['elevation'] as num).toInt(),
      hourlyUnits:
          HourlyUnits.fromJson(json['hourly_units'] as Map<String, dynamic>),
      hourly: Hourly.fromJson(json['hourly'] as Map<String, dynamic>),
      current_weather: CurrentWeather.fromJson(
          json['current_weather'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$CityWeatherResponseToJson(
        CityWeatherResponse instance) =>
    <String, dynamic>{
      'latitude': instance.latitude,
      'longitude': instance.longitude,
      'elevation': instance.elevation,
      'hourly_units': instance.hourlyUnits,
      'hourly': instance.hourly,
      'current_weather': instance.current_weather,
    };

Hourly _$HourlyFromJson(Map<String, dynamic> json) => Hourly(
      time: (json['time'] as List<dynamic>).map((e) => e as String).toList(),
      temperature_2m: (json['temperature_2m'] as List<dynamic>)
          .map((e) => (e as num).toDouble())
          .toList(),
      windSpeed_10m: (json['wind_speed_10m'] as List<dynamic>)
          .map((e) => (e as num).toDouble())
          .toList(),
      windDirection_10m: (json['wind_direction_10m'] as List<dynamic>)
          .map((e) => (e as num).toInt())
          .toList(),
      rain: (json['rain'] as List<dynamic>)
          .map((e) => (e as num).toDouble())
          .toList(),
      snowfall: (json['snowfall'] as List<dynamic>)
          .map((e) => (e as num).toInt())
          .toList(),
      weatherCode: (json['weather_code'] as List<dynamic>)
          .map((e) => (e as num).toInt())
          .toList(),
      soilTemperature0Cm: (json['soil_temperature_0cm'] as List<dynamic>)
          .map((e) => (e as num).toDouble())
          .toList(),
    );

Map<String, dynamic> _$HourlyToJson(Hourly instance) => <String, dynamic>{
      'time': instance.time,
      'temperature_2m': instance.temperature_2m,
      'wind_speed_10m': instance.windSpeed_10m,
      'wind_direction_10m': instance.windDirection_10m,
      'soil_temperature_0cm': instance.soilTemperature0Cm,
      'weather_code': instance.weatherCode,
      'rain': instance.rain,
      'snowfall': instance.snowfall,
    };

HourlyUnits _$HourlyUnitsFromJson(Map<String, dynamic> json) => HourlyUnits(
      temperature_2m: json['temperature_2m'] as String,
    );

Map<String, dynamic> _$HourlyUnitsToJson(HourlyUnits instance) =>
    <String, dynamic>{
      'temperature_2m': instance.temperature_2m,
    };
