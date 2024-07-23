import 'package:simple_weather_app/features/searchCity/domain/ui_models/city_model.dart';

abstract class CitiesSearchState {
double opacity = 0.0;

}
class CitiesSearchEmptyState extends CitiesSearchState{}
class CitiesSearchLoadingState extends CitiesSearchState{}
class CitiesSearchErrorState extends CitiesSearchState{
  String error ;
  CitiesSearchErrorState({required this.error});
}
class CitiesSearchResultState extends CitiesSearchState{
  List<CityModel> cities ;
  CitiesSearchResultState({required this.cities});
}