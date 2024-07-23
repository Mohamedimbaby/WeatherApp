import 'package:simple_weather_app/features/searchCity/data/models/auto_complete_response_model.dart';
import 'package:simple_weather_app/features/searchCity/data/services/auto_complete_cities_search_service.dart';

class AutoCompleteCitiesSearchUseCase{
  AutoCompleteSearchService searchService;

  AutoCompleteCitiesSearchUseCase({required this.searchService});

  Future<AutoCompleteResponseModel> autoCompleteCitiesSearch (String keyword)async{
   return await searchService.getSuggestionsCities(keyword);
  }
}