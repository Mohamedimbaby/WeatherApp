import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:simple_weather_app/features/searchCity/data/models/auto_complete_response_model.dart';
import 'package:simple_weather_app/features/searchCity/data/models/search_result_model.dart';
import 'package:simple_weather_app/features/searchCity/domain/ui_models/city_model.dart';
import 'package:simple_weather_app/features/searchCity/domain/use_cases/auto_complete_cities_search.dart';
import 'package:simple_weather_app/features/searchCity/domain/use_cases/get_weather_use_case.dart';
import 'package:simple_weather_app/features/searchCity/presentation/cubit/cities_search_state.dart';

class CitiesSearchCubit extends Cubit<CitiesSearchState> {
  AutoCompleteCitiesSearchUseCase autoCompleteCitiesSearchUseCase;
  GetWeatherUseCase getWeatherUseCase;
  double opacity = 1.0;

  CitiesSearchCubit({
    required this.autoCompleteCitiesSearchUseCase,
    required this.getWeatherUseCase,
  }) : super(CitiesSearchEmptyState()..opacity=1);

  autoCompleteCitiesSearch(String keyword) async {
    opacity = 1.0;
    if (keyword.isNotEmpty) {
      emit(CitiesSearchLoadingState()..opacity=0);
      try {
        AutoCompleteResponseModel responseModel =
            await autoCompleteCitiesSearchUseCase
                .autoCompleteCitiesSearch(keyword);
        List<CityModel> cities = [];
        for (Result city in responseModel.results) {
          SearchResultModel resultModel =
              await _getWeather(city.geometry.lat, city.geometry.lng);
          cities.add(CityModel(
              flag: city.annotations.flag,
              name: city.formatted,
              temperature:
                  "${resultModel.current_weather.temperature} ${resultModel.current_weather_units.temperature}",
              summary: _getWeatherDescription(
                  resultModel.current_weather.weathercode)));
        }
        emit(CitiesSearchResultState(cities: cities));
      } on DioError catch (e) {

        emit(CitiesSearchErrorState(error: e.message)..opacity=1.0);
      }
    }
  }

  Future<SearchResultModel> _getWeather(double lat, double lng) async {
    return await getWeatherUseCase.getWeather(lat, lng);
  }

  String _getWeatherDescription(int weatherCode) {
    // Map weather codes to descriptions
    // Refer to Open-Meteo API documentation for weather codes
    switch (weatherCode) {
      case 0:
        return 'Clear sky';
      case 1:
        return 'Mainly clear';
      case 2:
        return 'Partly cloudy';
      case 3:
        return 'Overcast';
      case 45:
      case 48:
        return 'Fog';
      case 51:
      case 53:
      case 55:
        return 'Drizzle';
      case 56:
      case 57:
        return 'Freezing Drizzle';
      case 61:
      case 63:
      case 65:
        return 'Rain';
      case 66:
      case 67:
        return 'Freezing Rain';
      case 71:
      case 73:
      case 75:
        return 'Snow fall';
      case 77:
        return 'Snow grains';
      case 80:
      case 81:
      case 82:
        return 'Rain showers';
      case 85:
      case 86:
        return 'Snow showers';
      case 95:
        return 'Thunderstorm';
      case 96:
      case 99:
        return 'Thunderstorm with hail';
      default:
        return 'Unknown weather';
    }
  }
}
