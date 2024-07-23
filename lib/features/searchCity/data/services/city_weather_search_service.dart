import 'package:dio/dio.dart';
import 'package:simple_weather_app/core/service/base_service.dart';
import 'package:simple_weather_app/features/searchCity/data/models/search_result_model.dart';

class GetWeatherService extends BaseService{
  Future<SearchResultModel> getCityWeather (double lat ,double long)async{
    Response response = await dio.get("latitude=$lat&longitude=$long&current=temperature_2m&current_weather=true");
    return SearchResultModel.fromJson(response.data);
  }
}