import 'package:simple_weather_app/features/cityWeatherDetails/data/models/city_weather_response.dart';
import 'package:simple_weather_app/features/searchCity/data/models/search_result_model.dart';

class CityWeatherModel {
  final double latitude;
  final double longitude;
  final int elevation;
  final HourlyUnits hourlyUnits;
  final Hourly hourly;
  final CurrentWeather currentWeather;
  Map<String, CurrentWeather>? nextDays ;

  CityWeatherModel({required this.latitude,required this.longitude,required this.elevation,
    required  this.hourlyUnits,required this.hourly,required this.currentWeather,this.nextDays});
}