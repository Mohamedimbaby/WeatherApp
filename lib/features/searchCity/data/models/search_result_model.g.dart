// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_result_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SearchResultModel _$SearchResultModelFromJson(Map<String, dynamic> json) =>
    SearchResultModel(
      latitude: (json['latitude'] as num).toDouble(),
      longitude: (json['longitude'] as num).toDouble(),
      current_weather_units: CurrentWeatherUnits.fromJson(
          json['current_weather_units'] as Map<String, dynamic>),
      current_weather: CurrentWeather.fromJson(
          json['current_weather'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$SearchResultModelToJson(SearchResultModel instance) =>
    <String, dynamic>{
      'latitude': instance.latitude,
      'longitude': instance.longitude,
      'current_weather_units': instance.current_weather_units,
      'current_weather': instance.current_weather,
    };

CurrentWeather _$CurrentWeatherFromJson(Map<String, dynamic> json) =>
    CurrentWeather(
      temperature: (json['temperature'] as num).toDouble(),
      weathercode: (json['weathercode'] as num).toInt(),
    );

Map<String, dynamic> _$CurrentWeatherToJson(CurrentWeather instance) =>
    <String, dynamic>{
      'temperature': instance.temperature,
      'weathercode': instance.weathercode,
    };

CurrentWeatherUnits _$CurrentWeatherUnitsFromJson(Map<String, dynamic> json) =>
    CurrentWeatherUnits(
      temperature: json['temperature'] as String,
    );

Map<String, dynamic> _$CurrentWeatherUnitsToJson(
        CurrentWeatherUnits instance) =>
    <String, dynamic>{
      'temperature': instance.temperature,
    };
