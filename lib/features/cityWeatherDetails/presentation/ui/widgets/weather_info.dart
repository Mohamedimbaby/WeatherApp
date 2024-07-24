import 'package:flutter/material.dart';
import 'package:simple_weather_app/core/colors/app_colors.dart';
import 'package:simple_weather_app/features/cityWeatherDetails/domain/models/city_weather_model.dart';

class WeatherInfo extends StatelessWidget {
  final CityWeatherModel item;
  final String summary;
  const WeatherInfo({required this.item, required this.summary, super.key});

  @override
  Widget build(BuildContext context) {
    return  Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "${item.currentWeather.temperature}°C",
            style: const TextStyle(
              fontSize: 60,
              color: AppColors.background,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 10),
          Text(
            summary,
            style: const TextStyle(
              fontSize: 36,
              color: AppColors.background,
            ),
          ),
          const SizedBox(height: 20),

        ],
      ),
    );
  }
}
