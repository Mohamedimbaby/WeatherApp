import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:simple_weather_app/features/cityWeatherDetails/data/models/city_weather_response.dart';
import 'package:simple_weather_app/features/cityWeatherDetails/domain/models/city_weather_model.dart';
import 'package:simple_weather_app/features/cityWeatherDetails/domain/useCase/get_city_weather_details.dart';
import 'package:simple_weather_app/features/cityWeatherDetails/presentation/cubit/city_weather_details_state.dart';
import 'package:simple_weather_app/features/searchCity/data/models/search_result_model.dart';

class CityWeatherDetailsCubit extends Cubit<CityWeatherDetailsState>{
  GetCityWeatherDetailsUseCase getCityWeatherDetailsUseCase;
  CityWeatherDetailsCubit({required this.getCityWeatherDetailsUseCase}): super(EmptyCityWeatherDetailsState());


 Future<void> getCityWeatherDetails(double lat , double lng) async {
      emit(CityWeatherDetailsLoadingState());
      try {
        CityWeatherResponse response = await getCityWeatherDetailsUseCase.getCityWeatherDetails(lat, lng);
         emit(CityWeatherDetailsResultState(item: CityWeatherModel(
             latitude: response.latitude,
             longitude: response.longitude,
             elevation: response.elevation,
             hourlyUnits: response.hourlyUnits,
             hourly: response.hourly,
             currentWeather: response.current_weather,
           nextDays: _getNextDays(response)
         )));
      } on DioError catch (_) {
        emit(CityWeatherDetailsErrorState(error:"Server Error"));
      }catch(e){
        emit(CityWeatherDetailsErrorState(error:"Something went wrong"));
      }
  }

  _getNextDays(CityWeatherResponse response) {
   Map<String,CurrentWeather> result ={};
   for(int i = 12 ; i < 111 ; i+=24){
     result[response.hourly.time[i]] = CurrentWeather(temperature: response.hourly.temperature_2m[i], weathercode: response.hourly.weatherCode[i]);
   }
   return result;
  }
}