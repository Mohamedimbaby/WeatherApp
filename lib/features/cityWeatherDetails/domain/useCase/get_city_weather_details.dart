import 'package:simple_weather_app/features/cityWeatherDetails/data/models/city_weather_response.dart';
import 'package:simple_weather_app/features/cityWeatherDetails/data/services/get_city_weather_details.dart';

class GetCityWeatherDetailsUseCase {
  GetCityWeatherDetailsService getCityWeatherDetailsService;

  GetCityWeatherDetailsUseCase({required this.getCityWeatherDetailsService});

  Future<CityWeatherResponse> getCityWeatherDetails(
      double lat, double lng) async {
    return await getCityWeatherDetailsService.getCityWeatherDetails(lat, lng);
  }
}
