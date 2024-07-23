import 'package:dio/dio.dart';
import 'package:simple_weather_app/core/dependency_injection/dependency_injection.dart';

abstract class BaseService {
  Dio dio = getIt<Dio>();

}