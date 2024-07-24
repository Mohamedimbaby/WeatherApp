
import 'package:json_annotation/json_annotation.dart';
import 'package:simple_weather_app/features/searchCity/data/models/search_result_model.dart';
part 'city_weather_response.g.dart';
@JsonSerializable()
class CityWeatherResponse {
  final double latitude;
  final double longitude;
  final int elevation;
  @JsonKey(name: "hourly_units")
  final HourlyUnits hourlyUnits;
  final Hourly hourly;
  final CurrentWeather current_weather;

  CityWeatherResponse({
    required this.latitude,
    required this.longitude,
    required this.elevation,
    required this.hourlyUnits,
    required this.hourly,
    required this.current_weather,
  });
  factory CityWeatherResponse.fromJson(Map<String, dynamic> json) => _$CityWeatherResponseFromJson(json);

  Map<String, dynamic> toJson() => _$CityWeatherResponseToJson(this);

}

@JsonSerializable()
class Hourly {
  final List<String> time;
  final List<double> temperature_2m;
  @JsonKey(name: "wind_speed_10m")
  final List<double> windSpeed_10m;
  @JsonKey(name: "wind_direction_10m")
  final List<int> windDirection_10m;
  @JsonKey(name: "soil_temperature_0cm")
  final List<double> soilTemperature0Cm;
  @JsonKey(name: "weather_code")
  final List<int> weatherCode;
  final List<double> rain;
  final List<int> snowfall;
  Hourly({
    required this.time,
    required this.temperature_2m,
    required this.windSpeed_10m,
    required this.windDirection_10m,
    required this.rain,
    required this.snowfall,
    required this.weatherCode,
    required this.soilTemperature0Cm,
  });
  factory Hourly.fromJson(Map<String, dynamic> json) => _$HourlyFromJson(json);

  Map<String, dynamic> toJson() => _$HourlyToJson(this);

}
@JsonSerializable()
class HourlyUnits {
  final String temperature_2m;

  HourlyUnits({
    required this.temperature_2m,
  });
  factory HourlyUnits.fromJson(Map<String, dynamic> json) => _$HourlyUnitsFromJson(json);

  Map<String, dynamic> toJson() => _$HourlyUnitsToJson(this);

}
