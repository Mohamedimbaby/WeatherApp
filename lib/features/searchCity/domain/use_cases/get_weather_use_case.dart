import 'package:simple_weather_app/features/searchCity/data/models/search_result_model.dart';
import 'package:simple_weather_app/features/searchCity/data/services/city_weather_search_service.dart';

class GetWeatherUseCase {
  GetWeatherService getWeatherService ;

  GetWeatherUseCase({required this.getWeatherService});
  Future<SearchResultModel> getWeather(double lat , double lng)async{
    return await getWeatherService.getCityWeather(lat , lng);
  }
}