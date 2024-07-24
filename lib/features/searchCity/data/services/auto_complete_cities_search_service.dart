import 'package:dio/dio.dart';
import 'package:simple_weather_app/core/strings/strings.dart';
import 'package:simple_weather_app/features/searchCity/data/models/auto_complete_response_model.dart';

class AutoCompleteSearchService {
  Future <AutoCompleteResponseModel> getSuggestionsCities(String keyword) async {
    if (keyword.isNotEmpty) {
      final response = await Dio().get(
        'https://api.opencagedata.com/geocode/v1/json?q=$keyword&key=${AppStrings.apiKey}',
      );
      var autoCompleteResponseModel = AutoCompleteResponseModel.fromJson( response.data);
      return autoCompleteResponseModel;
    }
    return AutoCompleteResponseModel(results: [], status: Status(code: 200,message: ""));
  }
}
