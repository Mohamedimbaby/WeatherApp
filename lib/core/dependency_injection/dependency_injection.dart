import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
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
  getIt.registerSingleton<GetWeatherService>(GetWeatherService());
  getIt.registerSingleton<AutoCompleteCitiesSearchUseCase>(AutoCompleteCitiesSearchUseCase(searchService: getIt<AutoCompleteSearchService>()));
  getIt.registerSingleton<GetWeatherUseCase>(GetWeatherUseCase(getWeatherService: getIt<GetWeatherService>()));
  getIt.registerSingleton<CitiesSearchCubit>(CitiesSearchCubit(autoCompleteCitiesSearchUseCase: getIt<AutoCompleteCitiesSearchUseCase>(), getWeatherUseCase: getIt<GetWeatherUseCase>()));

// Alternatively you could write it if you don't like global variables
}