import 'package:dio/dio.dart';
import 'package:simple_weather_app/core/service/base_service.dart';
import 'package:simple_weather_app/features/cityWeatherDetails/data/models/city_weather_response.dart';

class GetCityWeatherDetailsService extends BaseService{
  Future<CityWeatherResponse> getCityWeatherDetails (double lat , double lng)async{
   Response response =  await dio.get("latitude=$lat&longitude=$lng&hourly=temperature_2m,wind_speed_10m,,soil_temperature_0cm,rain,snowfall,wind_direction_10m,weather_code&forecast_days=5&current_weather=true");
    return CityWeatherResponse.fromJson(response.data);
  }
}