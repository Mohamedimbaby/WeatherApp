import 'package:json_annotation/json_annotation.dart';
part 'search_result_model.g.dart';

@JsonSerializable()
class SearchResultModel {
  final double latitude;
  final double longitude;
  final CurrentWeatherUnits current_weather_units;
  final CurrentWeather current_weather;

  SearchResultModel({
    required this.latitude,
    required this.longitude,
    required this.current_weather_units,
    required this.current_weather,
  });
  factory SearchResultModel.fromJson(Map<String, dynamic> json) => _$SearchResultModelFromJson(json);

  Map<String, dynamic> toJson() => _$SearchResultModelToJson(this);

}
@JsonSerializable()
class CurrentWeather {

  final double temperature;
  final int weathercode;

  CurrentWeather({
    required this.temperature,
    required this.weathercode,
  });
  factory CurrentWeather.fromJson(Map<String, dynamic> json) => _$CurrentWeatherFromJson(json);

  Map<String, dynamic> toJson() => _$CurrentWeatherToJson(this);


}

@JsonSerializable()
class CurrentWeatherUnits {
  final String temperature;

  CurrentWeatherUnits({
    required this.temperature,
  });
  factory CurrentWeatherUnits.fromJson(Map<String, dynamic> json) => _$CurrentWeatherUnitsFromJson(json);

  Map<String, dynamic> toJson() => _$CurrentWeatherUnitsToJson(this);


}
