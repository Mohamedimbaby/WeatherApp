import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:simple_weather_app/features/cityWeatherDetails/data/services/get_city_weather_details.dart';
import 'package:simple_weather_app/features/cityWeatherDetails/domain/useCase/get_city_weather_details.dart';
import 'package:simple_weather_app/features/cityWeatherDetails/presentation/cubit/city_weather_details_cubit.dart';
import 'package:simple_weather_app/features/searchCity/data/services/auto_complete_cities_search_service.dart';
import 'package:simple_weather_app/features/searchCity/data/services/city_weather_search_service.dart';
import 'package:simple_weather_app/features/searchCity/domain/use_cases/auto_complete_cities_search.dart';
import 'package:simple_weather_app/features/searchCity/domain/use_cases/get_weather_use_case.dart';
import 'package:simple_weather_app/features/searchCity/presentation/cubit/search_cubit.dart';
import 'package:dio_logger/dio_logger.dart';

final getIt = GetIt.instance;

void setup() {
 Dio dio =  Dio(BaseOptions(
    baseUrl: "https://api.open-meteo.com/v1/forecast?",
  ),
  )..interceptors.add(dioLoggerInterceptor);
  getIt.registerSingleton<Dio>(dio);
  getIt.registerSingleton<AutoCompleteSearchService>(AutoCompleteSearchService());
  getIt.registerSingleton<GetCityWeatherDetailsService>(GetCityWeatherDetailsService());
  getIt.registerSingleton<GetWeatherService>(GetWeatherService());
  getIt.registerSingleton<AutoCompleteCitiesSearchUseCase>(AutoCompleteCitiesSearchUseCase(searchService: getIt<AutoCompleteSearchService>()));
  getIt.registerSingleton<GetWeatherUseCase>(GetWeatherUseCase(getWeatherService: getIt<GetWeatherService>()));
  getIt.registerSingleton<GetCityWeatherDetailsUseCase>(GetCityWeatherDetailsUseCase(getCityWeatherDetailsService: getIt<GetCityWeatherDetailsService>()));
  getIt.registerSingleton<CitiesSearchCubit>(CitiesSearchCubit(autoCompleteCitiesSearchUseCase: getIt<AutoCompleteCitiesSearchUseCase>(), getWeatherUseCase: getIt<GetWeatherUseCase>()));
  getIt.registerSingleton<CityWeatherDetailsCubit>(CityWeatherDetailsCubit(getCityWeatherDetailsUseCase: getIt<GetCityWeatherDetailsUseCase>()));

// Alternatively you could write it if you don't like global variables
}