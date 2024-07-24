import 'package:simple_weather_app/features/cityWeatherDetails/domain/models/city_weather_model.dart';

abstract class CityWeatherDetailsState {}
class EmptyCityWeatherDetailsState extends CityWeatherDetailsState{}
 class CityWeatherDetailsLoadingState extends CityWeatherDetailsState{}
 class CityWeatherDetailsResultState extends CityWeatherDetailsState{
  CityWeatherModel item ;

  CityWeatherDetailsResultState({required this.item});
}
 class CityWeatherDetailsErrorState extends CityWeatherDetailsState{
  String error ;

  CityWeatherDetailsErrorState({required this.error});
}